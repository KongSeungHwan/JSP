<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="common.JDBConnect"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="common.JDBConnPool" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 목록 조회</h2>
<%
	//JDBConnect jdbc =  new JDBConnect(); //클라이언트단
	JDBConnPool jdbc = new JDBConnPool(); //서버단
	String sql = "select id,pw,name,regdate from member";
	Statement st= jdbc.con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	while(rs.next()){
		%>
		<br>
		<table style="border: 1px dashed black;">
			<tr>
				<th><%= rs.getString("id")%></th>
				<td><%= rs.getString("pw")%></td>
				<td><%= rs.getString("name")%></td>
				<td><%= rs. getString("regdate")%></td>
			</tr>
		</table>
		<%
	}
%>
</body>
</html>