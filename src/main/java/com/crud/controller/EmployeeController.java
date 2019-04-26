package com.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.crud.bean.Employee;
import com.crud.bean.Msg;
import com.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	/**
	 * ������������һ ����ɾ����1-2-3 ����ɾ����1
	 * 
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids") String ids) {
		// ����ɾ��
		if (ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			// ��װid�ļ���
			for (String id : str_ids) {
				del_ids.add(Integer.parseInt(id));
			}
			employeeService.deleteBatch(del_ids);
		} else {
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
		return Msg.success();
	}

	/**
	 * ���ֱ�ӷ���ajax=PUT��ʽ������ ��װ������ Employee
	 * [empId=1014,empName=null,gender=null,email=null,dId=null]
	 * 
	 * ���⣬ �������������ݣ� ����Employee�����װ���ϣ�����sql�﷨���� update tbl_emp where emp_id=1014;
	 * 
	 * ԭ�� Tomcat�� 1.���������е����ݣ���װһ��map�� 2.request.getParameter("empName")�ͻ�����map��ȡֵ
	 * 3.SpringMVC��װPOJO�����ʱ�򡣻��POJO��ÿ�����Ե�ֵ��request.getParameter("email");
	 * 
	 * AJAX����PUT���������� PUT�����������е����ݣ�request.getParameter("empName")�ò���
	 * Tomcatһ����PUT���󲻻��װ�������е�����Ϊmap��ֻ��POST��ʽ������ŷ�װ������Ϊmap
	 * 
	 * ��������� ����Ҫ��֧��ֱ�ӷ���PUT֮�������Ҫ��װ�������е����� 1.������HttpPutFormContentFilter
	 * 2.�������ã����������е����ݽ�����װ��һ��map��
	 * 3.request�����°�װ��request.getParameter()����д���ͻ���Լ���װ��map��ȡ���� Ա�����·���
	 * 
	 * @param employee
	 * @return
	 */

	@RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT) // value="/emp/{empId}"��empId������Employee�е���������һ��,���򴫹���������Ϊ��
	@ResponseBody
	public Msg saveEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.success();
	}

	/**
	 * ����Ա��id��ѯԱ��
	 */
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id) {
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}

	/**
	 * ����û����Ƿ����
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam(value = "empName") String empName) {
		// ���ж��û����Ƿ��ǺϷ��ı��ʽ
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if (!empName.matches(regx)) {
			return Msg.fail().add("va_msg", "�û���������6-16λ���ֺ���ĸ����ϻ���2-5λ����");
		}
		// ���ݿ��û����ظ�У��
		boolean b = employeeService.checkUser(empName);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "�û���������");
		}
	}

	/**
	 * Ա������ jqueryǰ��У��,ajax�û����ظ�У��,��Ҫ����(���У��(JSR303),ΨһԼ��) 1.Ҫ֧��JSR303У��
	 * 2.����Hibernate-Validator
	 *
	 * ���������@Validע�⣬����֪Spring����Ҫȷ�������������У���� �ơ�
	 */
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			// У��ʧ�ܣ�Ӧ�÷���ʧ�ܣ���ģ̬������ʾУ��ʧ�ܵĴ�����Ϣ
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("������ֶ�����" + fieldError.getField());
				System.out.println("������Ϣ��" + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		} else {
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}

	/**
	 * ��ȡ����Ա����Ϣ
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", page);
	}

	// @RequestMapping("/emps")
	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo page = new PageInfo(emps, 5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
}
