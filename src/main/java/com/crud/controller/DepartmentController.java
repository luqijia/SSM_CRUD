package com.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.bean.Department;
import com.crud.bean.Employee;
import com.crud.bean.Msg;
import com.crud.service.DepartmentService;

/**
 * ����Ͳ����йص�����
 * URI��ʽ��
 * /emp/{id}  GET ��ѯԱ��
 * /emp       POST ����Ա��
 * /emp/{id}  PUT �޸�Ա��
 * /emp/{id}  DELETE ɾ��Ա��
 */

@Controller
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	
	
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts() {
		//��������в�����Ϣ
		List<Department> list=departmentService.getDepts();
		return Msg.success().add("depts", list);
	}
}
