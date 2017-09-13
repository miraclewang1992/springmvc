package com.lesson.jlau.webservice;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class HelloWorldImpl implements IHelloWorld {

	public String sayHello(String username) {
		// TODO Auto-generated method stub
		return "hello "+username;
	}

	public Map addUser(Map user) {
		Iterator ite =user.entrySet().iterator(); 
		while(ite.hasNext()){
			Map.Entry map=(Map.Entry) ite.next();
			System.out.println(map.getValue());
		}
		return user;
	}
	
	

}
