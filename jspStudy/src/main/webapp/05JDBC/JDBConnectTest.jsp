<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="common.JDBConnect" %>
<%@ page import="common.JDBConnPool" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <h2>JDBC connect test1</h2>
   <%
      JDBConnect jdbc1 = new JDBConnect();
      jdbc1.close();
   %>
   
   <h2>JDBC connect test2</h2>
   <%
      String driver="oracle.jdbc.OracleDriver";
      String url="jdbc:oracle:thin:@localhost:1521:xe";
      String id="kong";
      String pw="3520";
      JDBConnect jdbc2 = new JDBConnect(driver,url,id,pw);
      jdbc2.close();
   %>
   
   <h2>JDBC connect test3</h2>
   <%
      JDBConnect jdbc3 = new JDBConnect(application);
      jdbc3.close();
   %>
      <h2>JDBC Connection Pool test</h2>
<%
   JDBConnPool pool = new JDBConnPool();
   pool.close();
%>
   
   
</body>
</html>