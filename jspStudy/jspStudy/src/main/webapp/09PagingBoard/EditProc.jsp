<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="membership.BoardDAO"%>
<%@ page import="membership.BoardDTO"%>
<%@ page import="utils.AlertFunc"%>
<%
	String num=request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	try{
		dto.setSequenceNum(Integer.parseInt(num));
	}catch(NumberFormatException e){
		AlertFunc.alertBack("잘못된 접근이다 돌아가라", out);
	}
	dto.setId(String.valueOf(session.getAttribute("UserId")));

	BoardDAO dao = new BoardDAO(application);
	int res = dao.updateEdit(dto);
	dao.close();
	if (res == 1) {
		response.sendRedirect("View.jsp?num="+num);
	} else {
		AlertFunc.alertBack("잘못된 접근이다 돌아가라", out);
	}
%>
