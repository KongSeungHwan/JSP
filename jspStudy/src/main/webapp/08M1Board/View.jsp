<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.BoardDAO" %>
<%@ page import="membership.BoardDTO" %>
<%@ include file="./LoginCheck.jsp" %>
<%
	String num=request.getParameter("num");

	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto= dao.getView(num);
	 dao.updateVisitCount(num);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
</head>
<body>
	<jsp:include page="../common/Top.jsp"/>
	<form action="" name="viewForm">
		<input type="hidden" name="num" value="<%=num %>"/>
		<table>
			<tr>
				<td>번호</td>
				<td><%=dto.getSequenceNum()%></td>
				<td>작성자</td>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=dto.getPostDate()%></td>
				<td>작성자</td>
				<td><%=dto.getVisitCount()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<td colspan="3"><%=dto.getContent()%></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
				<%
					if(session.getAttribute("UserId")!=null&&session.getAttribute("UserId").toString().equals(dto.getId())){
					
				%>
					<button type="button">수정하기</button>
					<button type="button">삭제하기</button>
				<%
					}
				%>
					
					<button type="button" onclick="location.href='List.jsp';">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>