<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="utils.ELUtils" %>
	<%
		ELUtils util= new ELUtils();
		pageContext.setAttribute("util", util);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 메소드 호출</title>
</head>
<body>
	<h3>영역에 지정한 객체의 메소드 호출</h3>
	001225-3000000 => ${util.getGender("001225-3000000")}<br>
	001225-2000000 => ${util.getGender("001225-2000000")}<br>
	001225-124564  => ${util.getGender("001225-124564")}<br>
	<h3>클래스명을 통한 정적 메소드 호출</h3>
	${ELUtils.showGugudan(7)}}
</body>
</html>