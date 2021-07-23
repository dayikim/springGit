<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
* {
	box-sizing: border-box;
	text-align: center;
}

.login_box {
	margin: auto;
	font-weight: 800;
	font-size: 20px;
}

body {
	padding-top: 200px;
}

#container {
	margin: auto;
	border: 1px solid black;
	width: 400px;
	height: 300px;
}

#table {
	margin: auto;
	border: 1px solid black;
}

td {
	text-align: center;
}

#login_box, label {
	font-weight: 800;
	padding-top: 10px;
}

#login_name {
	font-size: larger;
	background-color: #ddd;
}
</style>

</head>
<script>
$(function(){
	
	$("#signup").on("click", function(){
		location.href = "/customer/signup";
	})
	
	  $("#logout").on("click", function () { //로그아웃 
          alert("로그아웃 되었습니다.")
          location.href = "/customer/logoutProc"
      });
	
	$("#memberOut").on("click", function () { //회원탈퇴
        alert("정말로 탈퇴하시겠습니까?")
        location.href = "/customer/memberOut"
    });
	
})
</script>
<body>
	<c:choose>
		<c:when test="${login!=null }">

			<table class="table col-8" height=100px id="table">
				<thead>
					<tr>
						<th colspan=6 id="login_name">환영합니다. ${login.name}님!
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="col"><button type="button" class="btn btn-dark"
								id="toBoard">게시판</button>
						<th scope="col"><button type="button" class="btn btn-dark"
								id="mypage">마이페이지</button>
						<th scope="col"><button type="button" class="btn btn-dark"
								id="logout">로그아웃</button>
					</tr>
				</tbody>
			</table>

		</c:when>
		<c:otherwise>
				<form action="/customer/loginProc" method="post">

					<table border=1 align=center>
						<tr>
							<th>Login BoX
						</tr>
						<tr>
							<td>ID: <input type=text name=id placeholder="ID를 입력해주세욘">
						</tr>
						<tr>
							<td>PW: <input type=password name=pw
								placeholder="암호를 입력해주세욘">
						</tr>
						<tr>
							<td align=center>
								<button class="btn btn-dark">로그인</button>
								<button class="btn btn-dark" type="button" id=signup>회원가입</button>
						</tr>
					</table>
				</form>
		</c:otherwise>
	</c:choose>
</body>
</html>