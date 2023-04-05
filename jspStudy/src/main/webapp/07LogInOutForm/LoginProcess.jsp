<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%
	String userId=request.getParameter("user_id");
	String userPw=request.getParameter("user_pw");
	
	 String driver=application.getInitParameter("OracleDriver");
     String url=application.getInitParameter("OracleUrl");
     String id=application.getInitParameter("OracleId");
     String pw=application.getInitParameter("OraclePw");
	MemberDAO dao= new MemberDAO(driver,url,id,pw);
	MemberDTO mem = dao.getMember(userId,userPw);
	dao.close();
	
	if(mem!=null){
		session.setAttribute("UserId", mem.getId());
		session.setAttribute("UserName", mem.getName());
		response.sendRedirect("LoginForm.jsp");
	}else{
		request.setAttribute("loginErrMsg","로그인 오류다");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>