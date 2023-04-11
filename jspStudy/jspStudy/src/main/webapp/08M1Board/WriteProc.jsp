<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.BoardDAO"%>
<%@ page import="membership.BoardDTO"%>
<%@ page import="utils.AlertFunc"%>
<%
	String title= request.getParameter("title");
	String content=request.getParameter("content");
	BoardDTO dto= new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(String.valueOf(session.getAttribute("UserId")));
	
	BoardDAO dao= new BoardDAO(application);
	int res = dao.insertWrite(dto);
	dao.close();
	if(res==1){
		response.sendRedirect("List.jsp");
	}else{
		AlertFunc.alertBack("입력값 읎다 돌아가라",out);
	}
%>
