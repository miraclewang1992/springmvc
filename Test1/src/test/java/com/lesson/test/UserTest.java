package com.lesson.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.lesson.jlau.bean.User;
import com.lesson.jlau.service.UserServiceI;

public class UserTest {
	private UserServiceI userService=null;
	   @Before
	    public void before(){
	        //使用"spring.xml"和"spring-mybatis.xml"这两个配置文件创建Spring上下文
	        ApplicationContext ac = new ClassPathXmlApplicationContext(new String[]{"spring-mybatis.xml"});
	        //从Spring容器中根据bean的id取出我们要使用的userService对象
	        userService = (UserServiceI) ac.getBean("userService");
	    } 
	   @Test
 		public void getById(){
 		    User u=this.userService.selectRolePermission("xiaojun");
 			System.out.println("========="+u);
 		}
	   @Test
	   public void insert(){
		   User user=new User();
		   for(int i=2;i<200000;i++){
		   user.setId((long) i);
		   user.setPassword("123");
		   user.setState("1");
		   user.setUsername("xiaohong"+i);
		   int result =this.userService.insertUser(user);
		   }
		   System.out.println("---------"+"---------------");
	   }
	   
	   @Test
	   public void update(){
		   User user=new User();
		   user.setId(200L);
		   user.setPassword("12311232121");
		   user.setState("1");
		   user.setUsername("xiaojun");
		   user.setCreateTime(new java.util.Date());
		   User user1 =this.userService.updateUser(user);
		   System.out.println("---------"+user1.toString()+"---------------");
	   }
	   
	   @Test
	   public void getUsers(){
		   Date date =new Date();
		   List<User> users=this.userService.getUsers();
		   Date date1=new Date();
		   Long result=date1.getTime()-date.getTime();
		   System.out.println(result);
	   }
	   
	   @Test
	   public void getByUserId(){
		   User user=new User();
		   user.setId(200L);
		   User user1 =this.userService.getByUserId(2222L);
		   System.out.println(user1.toString());
	   }
	   
	   @Test
	   public void flushByUserIds(){
		   this.userService.flushByUserIds();
	   }
	   
	   @Test 
	   public void getUserListFromRedis(){
		   Date date =new Date();
		   List<Long> ids=this.userService.getUserId();
		   Date date1=new Date();
		   List<User> users=new ArrayList<User>();
		   for(int size=ids.size(),i=0;i<size;i++){
			   users.add(this.userService.getByUserId(ids.get(i)));
		   }
		   Long result=date1.getTime()-date.getTime();
		   String jsonString=JSON.toJSONString(users);
		   System.out.println(jsonString);
		   List<User> users1=(List<User>)JSON.parseObject(jsonString,List.class);
		   System.out.println(users1.size());
	   }
	   
	   
}
