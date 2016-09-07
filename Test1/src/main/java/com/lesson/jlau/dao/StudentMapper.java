package com.lesson.jlau.dao;

import java.util.List;

import com.lesson.jlau.bean.Student;

public interface StudentMapper {
    int deleteByPrimaryKey(String stuId);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String stuId);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

	List<Student> getAll();

	Student findStuByLoginName(String username);

	int updateById(Student stu);

	Student getById(String id);
}