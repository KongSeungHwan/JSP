<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2> 전송</h2>
	<ul>
	<li>리퀘스트전송 이름: <%=request.getParameter("name") %> </li>
	<li>리퀘스트전송 나이: <%=request.getParameter("age") %> </li>
	<li>리퀘스트전송 나이: <%=(ArrayList<String>)(request.getAttribute("requestList")) %> </li>
	
	<li>세션전송: <%=(ArrayList<String>)(session.getAttribute("sessionList"))%></li>
	<li>어플리케이션전송:<%=(ArrayList<String>)(application.getAttribute("applicationList"))%></li>
	</ul>
</body>
</html>