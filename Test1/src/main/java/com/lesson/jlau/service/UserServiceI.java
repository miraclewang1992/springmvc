package com.lesson.jlau.service;

import java.util.List;

import com.lesson.jlau.bean.User;

public interface UserServiceI {

	public User selectRolePermission(String loginName);

	public int insertUser(User user);

	public  User  updateUser(User user);

	public List<User> getUsers();

	public List<Long> getUserId();

	public User getByUserId(long id);

	public void flushByUserIds();

}
