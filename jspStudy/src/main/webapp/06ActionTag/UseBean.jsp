<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java Beans</title>
</head>
<body>
	<h2>자바빈즈</h2>
	<jsp:useBean id="person" class="common.Person"/>
	<jsp:setProperty name="person" property="name" value="알빠노"/>
	<jsp:setProperty name="person" property="age" value="30"/>
	<ul>
		<li><jsp:getProperty name="person" property="name"/></li>
		<li><jsp:getProperty name="person" property="age"/></li>
	</ul>
</body>
</html>