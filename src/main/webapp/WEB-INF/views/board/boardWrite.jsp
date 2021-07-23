<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Board Write</title>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
  <script>
    $(function () {
      // 취소버튼 눌렀을 때
      $("#cancel").on("click", function () {
        location.href = "javascript:history.back()";
      })
    })
  </script>
  <style>
    body {
      padding-top: 30px;
    }
    .container {
      width: 1500px;
    }
  </style>
</head>
<body>
  <div class="container">
    <form action="/board/boardWrite" method="post" enctype="multipart/form-data" id="frm">
      <div class="row">
        <!-- 제목 입력란 -->
        <div class="col-12">
          <input type=text class="form-control mb-2" placeholder="제목을 입력하세요." name="title" id="title2">
        </div>
        <!-- 글쓰기 입력란 -->
        <div class="col-12" style="height: 600px"><br>
          <textarea id="summernote" name="contents"></textarea>
        </div>
        <!-- 버튼란 -->
        <div class="col-12 btns" align="right">
          <button type="button" class="btn btn-outline-secondary" id="cancel">취소</button>
          <button type="submit" class="btn btn-outline-secondary" id="toWrite">글 쓰기</button>
        </div>
      </div>
    </form>
  </div>
  <!-- 썸머노트 API -->
  <script>
    $('#summernote').summernote({
      placeholder: '내용을 입력하세요.',
      height: 500
    });
  </script>
</body>
</html>