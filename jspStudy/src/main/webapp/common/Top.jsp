<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>
	tr{
		text-align: center
	}
	td{
		text-align: center;
	}
	table{
	width: 90%
	}
</style>
<table style="border: 1px dashed black">
	<tr>
		<td align="center">
		<%if(session.getAttribute("UserId")==null) {%>
			<a href="../07LogInOutForm/LoginForm.jsp">로그인</a>
		<%}else{ %>
			<a href="../07LogInOutForm/Logout.jsp">로그아웃</a>
		<%} %>
			<a href="../08M1Board/List.jsp">게시판</a>
		</td>
	</tr>
	
</table>