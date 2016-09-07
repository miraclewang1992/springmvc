package com.lesson.jlau.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.lesson.jlau.bean.User;
import com.lesson.jlau.dao.UserMapper;
import com.lesson.jlau.service.UserServiceI;

@Service("userService")
public class UserService implements UserServiceI {
	@Resource 
	private UserMapper userDao;
	
	@Cacheable(value="selectRolePermission",key="#username")  
	public User selectRolePermission(String username) {
		User u=this.userDao.selectRolePermission(username);
		return u;
	}
	//清除缓存
	@CacheEvict(value = { "selectRolePermission"}, allEntries = true) 
	public int insertUser(User user) {
		
		return this.userDao.insertSelective(user);
	}
	//更新缓存
	@CachePut(value="selectRolePermission",key="#user.getUsername()")
	public  User  updateUser(User user) {
		this.userDao.updateByPrimaryKeySelective(user);
		return user; 
	}
	public List<User> getUsers() {
		List<User> users=this.userDao.getUsers();
 		return users;
	}
	public List<Long> getUserId() {
		 List<Long> ids=this.userDao.getUserId(); 
		return ids;
	}
	@Cacheable(value="getByUserId",key="#id")  
	public User getByUserId(long id) {
		 User user=this.userDao.selectByPrimaryKey(id);
		 return user;
	}
	 
	//清除缓存
	@CacheEvict(value = { "getByUserId"}, allEntries = true) 
	public void flushByUserIds() {
		 
		
	}   
}