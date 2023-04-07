<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="membership.BoardDAO"%>
<%@ page import="membership.BoardDTO"%>
<%@ page import="utils.AlertFunc"%>
<%
	String num=request.getParameter("num");
	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = dao.getView(num);
	String sessionId=session.getAttribute("UserId")!=null&&
			session.getAttribute("UserId").toString().equals(dto.getId())? session.getAttribute("UserId").toString(): null;
	if(session.getAttribute("UserId")==null){
		AlertFunc.alertBack("끄지라 마", out);
		response.sendRedirect("LoginForm.jsp");
		}
	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<script type="text/javascript">
	function validateForm(form){
		if(form.title.value==""){
			console.log(form);
			window.alert("제목을 입력하지 않았습니다.");			
			form.title.focus();
			return false;
		}
		if(form.content.value==""){
			console.log(form);
			window.alert("내용을 입력하지 않았습니다.");			
			form.content.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="../common/Top.jsp"/>
	<h2>수정하기</h2>
	<form action="EditProc.jsp" name="editForm" method="post" onsubmit="return validateForm(this)">
		<input type="hidden" name="num" value="<%=dto.getSequenceNum()%>"/>
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width:90%" value="<%=dto.getTitle()%>"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="width:90%; height:100px;"><%=dto.getContent()%></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" onclick="location.href='EditProc.jsp'">작성완료</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location.href='List.jsp'">목록보기</button>
				</td>
				
			</tr>
			
		</table>
	</form>
</body>
</html>
