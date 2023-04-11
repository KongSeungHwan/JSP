<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.BoardDAO"%>
<%@ page import="utils.AlertFunc"%>
<%
	String num=request.getParameter("num");
	BoardDAO dao= new BoardDAO(application); 
	
	int res = dao.deletePost(num);
	dao.close();
	if(res==1){
		AlertFunc.alertLocation("삭제끝났데이","List.jsp", out);
		
	}else{
		AlertFunc.alertBack("삭제 몬했데이", out);
	}
%>