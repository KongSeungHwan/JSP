<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="common.Person" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core ForEach</title>
</head>
<body>
	<c:forEach var="i" begin="1" end="3" step="1">
		<p>반복 ${i}</p>
	</c:forEach>
	<h4>반복문 속성</h4>
	<table border="1">
		<c:forEach begin="3" end="7" var="i" varStatus="loop">
			<tr>
				<td>count:${loop.count}</td>
				<td>index:${loop.index}</td>
				<td>current:${loop.current}</td>
				<td>first:${loop.first}</td>
				<td>last:${loop.last}</td>
				<td>i:${i}</td>
			</tr>
		</c:forEach>
	</table>
	
	<h4>enhanced for문</h4>
	<%
		String[] str={"red","orange","yellow","green","blue","nvay","purple","빨","주","노","초","파","남","보"};
	%>
	<table border="1">
		<c:forEach items="<%=str %>" var="color" varStatus="loop">
			<tr>
				<td>count:${loop.count}</td>
				<td>index:${loop.index}</td>
				<td>current:${loop.current}</td>
				<td>first:${loop.first}</td>
				<td>last:${loop.last}</td>
				<td>i:${i}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>