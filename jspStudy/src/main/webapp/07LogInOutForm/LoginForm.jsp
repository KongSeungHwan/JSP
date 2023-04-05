<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log-in</title>
</head>
<body>
	<jsp:include page="../common/Top.jsp"/>
	<h2>로그인 페이지</h2>
	<span style="color:red; font-size:1.2em;">
	<%=request.getAttribute("loginErrMsg")==null?"":request.getAttribute("loginErrMsg") %>
	</span>
	<% if(session.getAttribute("UserId")==null){ %>
	<form action="LoginProcess.jsp" method="post" name="loginForm">
		아이디: <input type="text" name="user_id"/><br>
		패스워드:<input type="password" name="user_pw"/><br>
		<input type="submit" value="로그인"/>
	</form>
	<%}else{ %>
		<%=session.getAttribute("UserName")%>회원님, 로그인하셨습니다.<br>
		<a href="Logout.jsp">로그아웃</a>
	<%} %>
</body>
</html>