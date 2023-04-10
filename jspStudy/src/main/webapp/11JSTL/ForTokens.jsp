<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="common.Person" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] str={"red","orange","yellow","green","blue","nvay","purple"};
	%>
	<c:forTokens items="<%=str%>" delims="," var="color">
		<span style="color:${color}">${color}</span>
	</c:forTokens>
</body>
</html>