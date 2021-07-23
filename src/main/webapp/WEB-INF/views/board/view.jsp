<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>
	*{box-sizing: border-box;}
     div{border: 1px solid black;}
     .container{width: 550px;height: 500px; margin: auto;}
     .main{height: 35px; text-align: center;line-height: 35px;}
     .navi{height: 40px; float: left;}
     .navi > div{float: left; height: 40px; line-height: 40px; text-align: center;}
     .seq{width: 30px;}
     .title{width: 250px;overflow:hidden;word-wrap:break-word;}
     .writer{width: 100px;}
     .date{width: 100px;}
     .count{width: 65px;}
     .contents{height: 365px;}  
     .file{height: 55px;overflow: scroll;}
     .footer{height: 45px; line-height: 45px;}    
     .controller{width: 550px; height: 50px; margin: 10px;}
     .comment{float: left; width: 450px; height: 100%; textalign: left}
     .reply{float: left; width: 98px; height: 100%;}
     #btn{width: 100%; height: 100%;}   
</style>
<body>
	<div class="container">
            <div class="main"><b>자유게시판</b></div>
            <div class="navi">
                <div class="seq" id="seq">${post.seq}</div>
                <div class="title">${post.title}</div>
                <div class="writer">${post.writer }</div>
                <div class="date">${post.write_Date }</div>
                <div class="count">${post.view_Count }</div>
            </div>
            <div class="contents">${post.contents }</div>
    </div>
</body>
</html>