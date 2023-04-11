<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="common.JDBConnect"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가 수정 삭제</title>
</head>
<body>
	<%
		JDBConnect jdbc = new JDBConnect();
		
		String id="test";
		String pw="9999";
		String name="시험";
		String sql="insert into member values(?,?,?,sysdate)";
		PreparedStatement ps = jdbc.con.prepareStatement(sql);
		ps.setString(1,id);
		ps.setString(2,pw);
		ps.setString(3,name);
		//setInt(index,value) / setDate()/ setString()
		out.println(ps.executeUpdate()+"행 입력");
	%>

</body>
</html>