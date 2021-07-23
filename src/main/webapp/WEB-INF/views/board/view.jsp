<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<style>
	*{box-sizing: border-box;}
     .container{width: 550px;height: 300px; margin: auto;}
     .main{height: 35px; text-align: center;line-height: 35px;}
    /* .navi{height: 40px; float: left;}
     .navi > div{float: left; height: 40px; line-height: 40px; text-align: center;}
     .seq{width: 30px;}
     .title{width: 250px;overflow:hidden;word-wrap:break-word;}
     .writer{width: 100px;}
     .date{width: 100px;}
     .count{width: 65px;} */
     .contents{height: 200px;}  
     
</style>
<body>
	<div class="container">
		<div class = row>
            <div class="col-12 main"><b>자유게시판</b></div>
        </div>
        <div class = row>
                <div class="col-1 seq" id="seq">${post.seq}</div>
                <div class="col-4 title">${post.title}</div>
                <div class="col-3 writer">${post.writer }</div>
                <div class="col-3 date">${post.write_date }</div>
                <div class="col-1 count">${post.view_count }</div>
        </div>
        	<div class = row>
            	<div class="col-12 contents">${post.contents }</div>
            </div> 
            <div class="row footer">
            	<div class = "col-6"></div>
            	<div class = "col-2"></div><a href="/Board/boardlist"><button type="button" class="btn btn-danger">뒤로가기</button></a></div>
            	<c:choose>
            		<c:when test="${post.writer == loginID}">
            			<div class = "col-2"><a href="/Board/boardDelete?seq=${post.seq}"><button type="button" class="btn btn-warning">삭제</button></a></div>
            			<div class = "col-2"><a href="/Board/modifyChoice?seq=${post.seq}"><button type="button" class="btn btn-success">수정</button></a></div>
            		</c:when>
            	</c:choose>	
            </div>
    </div>
</body>
</html>