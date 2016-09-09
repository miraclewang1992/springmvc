package com.lesson.jlau.webservice;

import java.util.Map;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService
public interface IHelloWorld {
@WebMethod
public String sayHello(@WebParam(name="username")String username);
@WebMethod
public Map addUser(@WebParam(name="user")Map user);
}
