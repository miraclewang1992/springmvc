package com.lesson.jlau.service;

import java.util.List;
import java.util.Map;

import com.lesson.jlau.bean.Student;

public interface StudentServiceI {

	public Student getById(String string);

	public void update();

	public Student findStuByLoginName(String username);

	public List<Student> getAll();

	public void addStu();

	public int update(Student stu);

	public Map updateJson();

	public int updateA();

 

}
