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
 * 处理和部门有关的请求
 * URI格式：
 * /emp/{id}  GET 查询员工
 * /emp       POST 保存员工
 * /emp/{id}  PUT 修改员工
 * /emp/{id}  DELETE 删除员工
 */

@Controller
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	
	
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts() {
		//查出的所有部门信息
		List<Department> list=departmentService.getDepts();
		return Msg.success().add("depts", list);
	}
}
