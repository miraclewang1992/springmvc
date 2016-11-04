package com.lesson.jlau.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lesson.jlau.bean.User;
import com.lesson.jlau.service.UserServiceI;

@Controller
public class CommonUserController {
	@Resource
	private UserServiceI userService;
	@RequestMapping(value="login.do" ,method=RequestMethod.GET)
	public ModelAndView loginForm(){
		ModelAndView view =new ModelAndView("login");
		return view;
	}
	@RequestMapping(value="login.do" ,method=RequestMethod.POST)
	public String login( User user){
		SecurityUtils.getSubject().login(new UsernamePasswordToken(user.getUsername(), user.getPassword()));  
	    return "redirect:/user.do";  
	}
	
	
	@RequestMapping(value="/logout.do",method=RequestMethod.GET)    
    public String logout(  ){   
        //使用权限管理工具进行用户的退出，跳出登录，给出提示信息  
        SecurityUtils.getSubject().logout();    
        return "redirect:/login.do";  
    }   
	
	@RequestMapping(value="/user.do",method=RequestMethod.GET)    
    public ModelAndView user(){   
		ModelAndView view =new ModelAndView("test");
		return view;
    }   
	 @RequestMapping("/403.do")  
    public String unauthorizedRole(){  
        return "/403";  
    }  
	 @RequestMapping("/test1.do")  
	   public void getUserListFromRedis(){
		   Date date =new Date();
		   List<Long> ids=this.userService.getUserId();
		   Date date1=new Date();
		   List<User> users=new ArrayList<User>();
		   for(int size=ids.size(),i=0;i<size;i++){
			   users.add(this.userService.getByUserId(ids.get(i)));
		   }
		   Long result=date1.getTime()-date.getTime();
		   System.out.println("------------"+result);
	   }

	
}
