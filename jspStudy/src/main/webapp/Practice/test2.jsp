<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import="java.util.ArrayList" %>
   
<%
request.setAttribute("requestList",new ArrayList<>(Arrays.asList("name","age")));
session.setAttribute("sessionList", new ArrayList<>(Arrays.asList("백수","괴발자","개발자","개씨발")));
application.setAttribute("applicationList", new ArrayList<>(Arrays.asList("Soccer","Travel","Music")));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보내라</title>
</head>
<body>
   <form action="Get.jsp" method="post">
<!--    	   request 영역에 담아서 데이터를 보내주세요   		 -->
      <label>이름:</label>
      <input type="text" name="name" /><br> 
      <label>나이:</label><input type="text" name="age" /><br>
      
<!--       session 영역에 담아서 데이터를 보내주세요 -->
      <label>직업:</label>
      <select name="job">
         <option>백수</option>
         <option>개발자</option>
         <option>괴발자</option>
         <option>개씨발</option>
      </select><br>
<!--       application 영역에 담아서 데이터를 보내주세요 -->
      <label>취미:</label>
      <input type="checkbox" name="hobby" value="Soccer">Soccer
      <input type="checkbox" name="hobby" value="Travel">Travel
      <input type="checkbox" name="hobby" value="Music">Music
      <br>
      <input type="submit" value="옛다">
   </form>
</body>
</html>