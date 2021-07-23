<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</head>

<script>
$(function(){
	
	$("#signup").on("click", function(){
		location.href = "/member/signup";
	})
	
})
</script>
<body>

<form action = "/member/LoginProc" method = "post">
				<table border =1 align = center>
					<tr>
						<th> Login BoX
					</tr>
					<tr>
						<td>ID: <input type = text name = id placeholder="ID를 입력해주세욘">
					</tr>
					<tr>
						<td>PW: <input type = password name = pw placeholder="암호를 입력해주세욘">
					</tr>
					<tr>
						<td align=center> <button login>로그인</button><button type = "button" id= signup>회원가입</button>
					</tr>
				</table>
</form>
	
</body>
</html>