package com.lesson.jlau.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lesson.jlau.bean.Student;
import com.lesson.jlau.dao.StudentMapper;
import com.lesson.jlau.service.StudentServiceI;

@Service("studentService")
public class StudentService implements StudentServiceI {
	
	@Resource
	private StudentMapper studentDao;

	
	/*
		对get()方法配置使用缓存,缓存有效期为3600秒,缓存的key格式为:{package_name}.DemoServiceImpl.get
		同时为参数配置了@CacheKey后,表示此参数的值将做为key的后缀,此例的key,最终是:{package_name}.DemoServiceImpl.get.{id}
		可以为多个参数配置@CacheKey,拦截器会调用参数的toString()做为key的后缀
		若配置多个@CacheKey参数,那么最终的key格式为:{package_name}.{class_name}.{method}.{arg1}.{arg2}.{...}
	 */
	/*@Cacheable(expire=3600)
	public Student getById(@CacheKey String id) {
		return studentDao.getById(id);
	}
*/
	
	 
	public Student getById(String id) {
	 
		return studentDao.getById(id);
	}


	public void update() {
		Student stu=new Student();
		stu.setStuId("1");
		stu.setStuClass((short) 2);
		stu.setStuName("1211113");
		int i=this.studentDao.updateById(stu);
		System.out.println(i);
		Student stu2=new Student();
		stu2.setStuId("3");
		stu2.setStuClass((short) 2);
		stu2.setStuName("1211113");
		int i2=this.studentDao.insertSelective(stu2);
		System.out.println(i2);
		
	}


	public Student findStuByLoginName(String username) {
		Student stu=this.studentDao.findStuByLoginName(username);
		return stu;
	}


	public List<Student> getAll() {
	 
		return this.studentDao.getAll();
	}


	public void addStu() {
		for(int i=10;i<1000000;i++){
			
		Student stu2=new Student();
		stu2.setStuId(i+"");
		stu2.setStuClass((short) 2);
		stu2.setStuName("name"+"_i");
		stu2.setStuCreateTime(new java.util.Date());
		stu2.setStuEnterYear(new java.util.Date());
		stu2.setStuMajor("信息管理与信息系统");
		stu2.setStuPassword("123456");
		int i2=this.studentDao.insertSelective(stu2);
		}
	}
}