<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
        * {
            box-sizing: border-box;
        }
        p{ font-size:larger;
        }
        .join{
            text-align: center;
            font-weight: bold;
        }
        .container {
            border: 1px solid black;
            width: 300px;
            height: 400px;
            margin: auto;
        }

        .title {
            text-align: center;
        }

        #result {width:380; height: 30px;}

        .pw_check {
            width: 30px;
        }

        #phone {
            width: 130px;
        }

        #search {
            width: 80px;
        }

        #postcode {
            width: 80px;
        }

        #add1,
        #add2 {
            width: 300px;}	
        #send,#reset {
            width: 100px;
		    position:relative;
        }
        
     body{padding-top: 30px;}
 				 
 	label{font-weight: bold;
 	 }
    </style>

    <script>
        $(function(){
		//중복검사 ajax
		$("#id_input").on("input", function () {
			if($("#id_input").val()==""){
				  return;
			  }
				 let checkID = $("#id_input").val();
		$.ajax({url: "/customer/duplCheck",
			
				data : {"id":checkID}
			}).done(function (resp) {
				console.log(resp);
				  if (resp=="1") {
					  $("#idcheck_result").text("이미 사용중인 아이디입니다.");
					  $("#idcheck_result").css("color","red");
					 
				 }else {
					 $("#idcheck_result").text("사용 가능한 아이디입니다.");
					  $("#idcheck_result").css("color","green");
					  
			}

			}).fail(function (a, b, c) {
				$("#idcheck_result").text("실패!");
			});

		});
		
		
	});

    </script>
</head>

<body>
    <div class="container">
        <form action="/customer/signupProc" method="post">

            <p class="join">회원가입</p>

            <label id="id"> 아이디: <input type="text" required id="id_input" name="id"></label>
            <div id="idcheck_result"></div>
            <label>비밀번호: <input type="password" id="pw" name="pw" required></label><br>

            <label>비밀번호 확인: <input type="password" id="pw_check" name=pw_check required></label><br>
            <div id=result></div>

            <label class="name">이름: <input type="text" id="name_input" name=name required></label>
            <label class="phone">전화번호: <input type="text" id="phone_input"name=phone></label>
            <label class="email">이메일: <input type="text"id="email_input"name="email"></label><br>
            
            <input type="submit" class="btn btn-dark" value="회원가입" id="send"> <input type="reset" class="btn btn-dark" value="다시입력" id="reset">
        </form>
    </div>
	
</body>
</html>