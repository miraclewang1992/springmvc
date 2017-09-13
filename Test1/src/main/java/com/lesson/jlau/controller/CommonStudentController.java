package com.lesson.jlau.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.lesson.jlau.bean.Student;
import com.lesson.jlau.service.StudentServiceI;

@Controller
public class CommonStudentController {
	@Resource
	private StudentServiceI studentService;
	
	@RequestMapping(value="/hello.json",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String hello(@RequestParam(value="pg",required=false)String pg){
		ModelAndView mv=new ModelAndView();
		String callback="";
		mv.addObject("pg", 1);
		System.out.println(pg); 
		String json =JSON.toJSONString(mv);  
		String result = callback+"("+json+")";  
        System.out.println(result);  
        return result;  
	}
	
	@RequestMapping("/addStu.json")
	@ResponseBody
	public ModelAndView addStu(){
		this.studentService.addStu();
		return null;
	}
	
	@RequestMapping("/getOne.json")
	@ResponseBody
	public ModelAndView getOne(){
		 System.out.println(this.studentService.getById("222").getStuId());
		 return null;
		 
	}
	@RequestMapping("/{id}/getById.json")
	@ResponseBody
	public ModelAndView getById(@PathVariable("id") String id){
		ModelAndView mv =new ModelAndView();
		Student stu = this.studentService.getById(id);
		mv.addObject("stu",stu);
		Student stu2 = this.studentService.getById(id);
		stu2.setStuMajor("信息技术科学"+new java.util.Date());
	    this.studentService.update(stu2);
	    Student stu1 = this.studentService.getById(id);
	    mv.addObject("stu2",stu2);
		mv.addObject("stu1", stu1);
		return mv;
		 
	}
	@RequestMapping("/getAll.json")
	@ResponseBody
	public ModelAndView getAll(){
		 List<Student> stus=this.studentService.getAll();
		 return null;
		 
	}
	
	
	@RequestMapping("/updateJson.json")
	@ResponseBody
	public Map getById(){
		 
	    Map  m = this.studentService.updateJson();
	    
		return m;
		 
	}
	
	@RequestMapping("/update.json")
	@ResponseBody
	public ModelAndView update(){
		 this.studentService.update();
		 return null;
		 
	}
	
	@RequestMapping(value="/delete.json",method=RequestMethod.DELETE)
	@ResponseBody
	public ModelAndView delete(){
		ModelAndView mv = new ModelAndView();
		mv .addObject("num",1);
		return mv ;
		
	}
	
	@RequestMapping("/test.json")
	@ResponseBody
	public ModelAndView updateA(){
		 this.studentService.updateA();
		 return null;
		 
	}
	
}
