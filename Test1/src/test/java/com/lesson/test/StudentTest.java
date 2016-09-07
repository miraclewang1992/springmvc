package com.lesson.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lesson.jlau.bean.Student;
import com.lesson.jlau.service.StudentServiceI;
/*@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})*/
public class StudentTest {
		private StudentServiceI studentService=null;
	   @Before
	    public void before(){
	        //使用"spring.xml"和"spring-mybatis.xml"这两个配置文件创建Spring上下文
	        ApplicationContext ac = new ClassPathXmlApplicationContext(new String[]{"spring-mybatis.xml"});
	        //从Spring容器中根据bean的id取出我们要使用的userService对象
	        studentService = (StudentServiceI) ac.getBean("studentService");
	    } 
	    
	   @Test
		public void getById(){
		   Student stu=this.studentService.getById("22222");
			System.out.println(stu.toString());
		}
}
