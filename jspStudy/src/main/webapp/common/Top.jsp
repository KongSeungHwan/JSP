<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table style="border: 1px dashed black" width="90%">
	<tr>
		<td align="center">
		<%if(session.getAttribute("UserId")==null) {%>
			<a href="../07LogInOutPrac/LoginForm.jsp"></a>
		<%}else{ %>
			<a href="../07LogInOutPrac/Logout.jsp"></a>
		<%} %>
		</td>
	</tr>
	
</table>