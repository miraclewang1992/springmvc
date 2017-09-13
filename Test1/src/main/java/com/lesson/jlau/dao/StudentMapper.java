package com.lesson.jlau.dao;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lesson.jlau.bean.Student;

public interface StudentMapper {
    int deleteByPrimaryKey(String stuId);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String stuId);

    int updateByPrimaryKeySelective(Student record);
   /* @Transactional(propagation=Propagation.REQUIRED) */
    int updateByPrimaryKey(Student record);

	List<Student> getAll();

	Student findStuByLoginName(String username);

	int updateById(Student stu);
	/*@Transactional(propagation=Propagation.REQUIRED) 
*/	Student getById(String id);
}