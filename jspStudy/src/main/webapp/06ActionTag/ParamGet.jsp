<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Param</title>
</head>
<body>
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	<h2>포워딩된 배개변수 확인</h2>
	<ul>
		<li><jsp:getProperty property="name" name="person"/></li>
		<li><jsp:getProperty property="name" name="person"/></li>
		<li><%=request.getParameter("thing") %>></li>
		<li><%=request.getParameter("nation") %>></li>
		<li><%=request.getParameter("age") %>></li>
	</ul>
	<jsp:include page="out/IncludePage3.jsp" >
		<jsp:param value="알빠노!" name="player"/>
		<jsp:param value="12" name="score"/>
	</jsp:include>
</body>
</html>