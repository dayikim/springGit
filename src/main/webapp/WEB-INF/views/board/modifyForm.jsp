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

<script>
$(function(){
$("#modiBtn").on("click", function(){
	
	$("#modify_seq").val($("#before_seq").text());
	$("#modify_title").val($("#before_title").text());
	$("#modify_contents").val($("#before_contents").text());
	$("#frm").submit();
})
})
</script>

</head>
<body>
<div class="container">
		<div class = row>
            <div class="col-12 main"><b>자유게시판</b></div>
        </div>
        <div class = row>
                <div class="col-1 seq" id="before_seq">${beforeBoard.seq}</div>
                <div class="col-4 title"contenteditable="true" id = before_title>${beforeBoard.title}</div>
                <div class="col-3 writer">${beforeBoard.writer }</div>
                <div class="col-3 date" >${beforeBoard.write_date }</div>
                <div class="col-1 count">${beforeBoard.view_count }</div>
        </div>
        	<div class = row>
            	<div class="col-12 contents" contenteditable="true" id = before_contents>${beforeBoard.contents }</div>
            </div> 
            <div class="row footer">
            	<div class = "col-6"></div>
            	<div class = "col-2"></div><a href="/Board/post?seq=${beforeBoard.seq}"><button type="button" class="btn btn-danger">뒤로가기</button></a></div>
            	<form action = "/Board/boardModified" id = frm method="get">
            		<input type = hidden name =modify_seq id = modify_seq>
            		<input type = hidden name =modify_title id = modify_title>
            		<input type = hidden name =modify_contents id = modify_contents>
            		<div class = "col-2"><button type="button" class="btn btn-success" id = modiBtn>수정하기</button></div>
     			</form>
            </div>
    </div>


</body>
</html>