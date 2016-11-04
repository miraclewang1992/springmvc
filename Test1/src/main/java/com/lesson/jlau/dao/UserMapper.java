package com.lesson.jlau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.cache.annotation.CachePut;

import com.lesson.jlau.bean.User;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);
  
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	public User selectRolePermission(@Param("username")String username);

	public List<User> getUsers();

	public List<Long> getUserId();
}