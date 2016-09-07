package com.lesson.jlau.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lesson.jlau.bean.Student;
import com.lesson.jlau.service.StudentServiceI;

@Controller
public class CommonStudentController {
	@Resource
	private StudentServiceI studentService;
	
	@RequestMapping("/hello.json")
	@ResponseBody
	public ModelAndView hello(@RequestParam(value="pg",required=false)String pg){
		ModelAndView mv=new ModelAndView();
		System.out.println("hello world"); 
		return mv;
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
		 System.out.println(this.studentService.getById(id).toString());
		 return null;
		 
	}
	@RequestMapping("/getAll.json")
	@ResponseBody
	public ModelAndView getAll(){
		 List<Student> stus=this.studentService.getAll();
		 return null;
		 
	}
	
	
	@RequestMapping("/update.json")
	@ResponseBody
	public ModelAndView update(){
		 this.studentService.update();
		 return null;
		 
	}
}
