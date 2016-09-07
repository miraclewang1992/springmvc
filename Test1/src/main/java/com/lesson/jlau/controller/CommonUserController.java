package com.lesson.jlau.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lesson.jlau.bean.User;

@Controller
public class CommonUserController {
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
	

	
}
