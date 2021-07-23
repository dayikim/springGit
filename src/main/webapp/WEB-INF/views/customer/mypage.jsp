<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
body{
 				 padding-top: 30px;}
 table{margin:auto}


#title{
    font-weight: bold;
    font-size:larger;
    background-color: #ddd;
}

</style>
<script>
$(function(){
	$("#back").on("click",function(){
		location.href = '/Main/main';
	})
	
	$("#memberOut").on("click",function(){
       let check = confirm("정말 탈퇴하겠습니까?");
         if(check){
         location.href="/customer/memberOut";   
         } else{
            return;
         }
    })
   

   
});
    

</script>
</head>
<body>
	    <table class="table mb-5 col-7" align=center>
 		<thead>
		<tr>
			 <td colspan=2 align="center"id="title">마이페이지
		</tr>
		 <thead>
		 <tbody>
		<tr>
			<th class="col-2 mb-5" >아이디</td>
			<td class="col-8 mb-5">
			${myinfo.id}
			
		</tr>
		
		<tr>
			<th>이름</td>
			<td id="ajax_name">
			${myinfo.name}
		</tr>
		<tr>
			<th>전화번호
			<td id="ajax_phone">
			${myinfo.phone}
		</tr>
		<tr>
			<th>이메일</td>
			<td id="ajax_email">
			${myinfo.email}
			
		</tr>
		<tr>
			<th>등록일자</td>
			<td>
			${myinfo.reg_date}
		</tr>

		<tr>
			<td align=left><button id="back" class="btn btn-dark" type="button">메인으로</button> 
			<td align=right><button class="btn btn-dark" id="memberOut">회원탈퇴</button>
		</tr>
		</tbody>
	</table>
</body>
</html>