package com.lesson.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lesson.jlau.webservice.IHelloWorld;

public class CxfTest {
	 private CxfTest() {  
	    }  
	   
	    public static void main(String args[]) throws Exception {  
	        // START SNIPPET: client  
	        ClassPathXmlApplicationContext context  
	            = new ClassPathXmlApplicationContext(new String[] {"client-beans.xml"});  
	   
	        IHelloWorld client = (IHelloWorld)context.getBean("client");  
	        String response = client.sayHello("hello");  
	        System.out.println("Response: " + response);  
	        System.exit(0);  
	        // END SNIPPET: client  
}}