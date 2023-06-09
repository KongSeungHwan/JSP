<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="LoginCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
<style>
	table{
		width: 90%;
	}
</style>
</head>
<body>
	<jsp:include page="../common/Top.jsp"/>
	<h2>글쓰기</h2>
	<form action="WriteProc.jsp" name="writeForm" method="post" onsubmit="return validateForm(this);">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width:90%"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="width:90%;height:100px"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location.href='List.jsp'">목록보기</button>
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>