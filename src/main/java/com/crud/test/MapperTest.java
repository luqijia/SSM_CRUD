
package com.crud.test;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.crud.bean.Employee;
import com.crud.dao.DepartmentMapper;
import com.crud.dao.EmployeeMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {

	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;

	@Autowired
	SqlSession sqlSession;
	
//	@Autowired
//	PhoneNumber PhoneNumber;
	
//	@Autowired
//	Contact contat;

	@Test
	public void testCRUD() {
		/**
		 * //1.创建SpringIOC容器 ApplicationContext ioc=new
		 * ClassPathXmlApplicationContext("applicationContext.xml"); //2.从容器中取Mapper
		 * DeptBeanMapper bean=ioc.getBean(DeptBeanMapper.class);
		 *
		 **/
		System.out.println(departmentMapper);
		// 3.批量插入多个员工，使用可以执行批量操作的sqlSession
//		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//		for (int i = 0; i < 1000; i++) {
//			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
//			mapper.insertSelective(new Employee(null, uid, "M", uid + "@crud.com", 1));
//		}
//		System.out.println("批量完成");
		List<Employee> emps=employeeMapper.selectByExampleWithDept(null);
//		List<Employee> emps=employeeMapper.selectByExample(null);
		for(int i=0;i<10;i++) {
			System.out.println(emps.get(i).getEmpName());
			
		}
	}
	
	@Test
	public void testPhoneNumber() {
//		System.out.println(PhoneNumber.toString());
//		contat.abc();
	}
}
