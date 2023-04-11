<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Authorization</title>
</head>
<body>
	<h2>mvc 패턴-> 회원 인증</h2>
	<h2>${authMsg}</h2>
	<ol>
		<li><a href="MemberAuth.mvc?id=admin&pass=1234">회원인증(관리자) </a>
		<li><a href="MemberAuth.mvc?id=tmdghks56&pass=123123">회원인증(내 계정)</a>
	</ol>
	<form name="authForm" method="post" action="./MemberAuth.mvc">
		<input type="text" name="id" placeholder="아이디"/>
		<input type="password" name="pw" placeholder="비밀번호"/>
		<input type="submit" value="로그인"/>
	</form>
</body>
</html>