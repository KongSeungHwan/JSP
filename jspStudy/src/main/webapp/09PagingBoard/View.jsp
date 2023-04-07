<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.BoardDAO" %>
<%@ page import="membership.BoardDTO" %>
<%@ include file="./LoginCheck.jsp" %>
<%
	String num=String.valueOf(request.getParameter("num"));
	out.println(num);
	BoardDAO dao = new BoardDAO(application);
	dao.updateVisitCount(num);
	BoardDTO dto= dao.getView(num);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<script>
	function deFunc(){
		let con=confirm("삭제하시겠습니까?");
		if(con){
			let form=document.viewForm;
			form.method="post";
			form.action="DeleteProc.jsp";
			form.submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../common/Top.jsp"/>
	<form name="viewForm">
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
				<td>조회수</td>
				<td><%=dto.getVisitCount()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><%=dto.getContent()%></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
				<%
					if(session.getAttribute("UserId")!=null&&session.getAttribute("UserId").toString().equals(dto.getId())){
					
				%>
					<button type="button" onclick="location.href='Edit.jsp?num=<%=dto.getSequenceNum()%>';"> 수정하기</button>
					<button type="button" onclick="deFunc();">삭제하기</button>
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