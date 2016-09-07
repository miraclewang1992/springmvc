<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>login</title>
</head>

<body>
	<h1>登录页面</h1>
	<form action="/login" commandName="user" method="post">  
        用户名：<input type="text" name="username" />
		<br />  
        密 &nbsp;&nbsp;码：<input type="password" name="password" />
		<br />
		<input type="submit" name="button" value="submit">
	</form>
</body>
</html>
