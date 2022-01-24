<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- bootstrap -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- stylesheet -->
	<link rel = "stylesheet" href = "/static/css/style.css" type = "text/css">
	<link rel = "stylesheet" href = "/static/css/signup.css" type = "text/css">
	

	
</head>
<body>
	<div id = "wrap">
	<c:import url ="/WEB-INF/jsp/include/header.jsp" />

		
		<section class ="content  d-flex justify-content-center">
		<div class = "join-box my-5">
		<div class = "display-4">회원 가입</div>
			<!-- 아이디 패스워드 패스워드 확인 이름 이메일 -->
			<input  type = "text"  id = "loginIdInput" placeholder = "아이디" class = " mt-3">
			<input  type = "password"  id = "passwordInput" placeholder = "비밀번호" class = " mt-3">
			<input  type = "password"  id = "passwordConfirmInput" placeholder = "비밀번호 확인" class = " mt-3">
			<input  type = "text"   id = "nameInput" placeholder = "이름" class = " mt-3">
			<input  type = "email"   id = "emailInput" placeholder = "이메일" class = " mt-3">
			
			<button type = "button" id ="joinBtn" class ="mt-3">회원 가입</button>
			<!--class = "btn btn-info btn-block mt-3"  -->
		</div>
			
		</section>
		<c:import url ="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
	$(document).ready(function(){
		
		function validateEmail(email) {
			var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return re.test(email);
			}
		
		 var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

		

		$("#joinBtn").on("click", function(){
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			var passwordConfirm = $("#passwordConfirmInput").val();
			var name = $("#nameInput").val();
			var email = $("#emailInput").val();
			
			
			if(loginId == null || loginId == "") {
				alert("id를 입력하세요.");
				return;
			}
			
			if(password == null || password == "") {
				alert("비밀번호를 입력하세요.");
				return;
			}
			if(name == null || name == "") {
				alert("이름을 입력하세요.");
				return;
			}
			if(password != passwordConfirm) {
				alert("비밀번호를 다시 확인해주세요.");
				return;
			}
			
			 //test 함수 == 문자열이 정규식을 만족하는지 판별하는 함수
			 //조건을 만족하면 true를 반환, 만족하지 못하면 false반환
			 if(regEmail.test(email)){
			 alert("이메일 인증에 성공하였습니다.");
			 } else{     
			 alert("이메일이 유효하지 않습니다.");
			 }
			  
		
			 $.ajax({
				 type:"post",
				 url:"/user/sign_up",
				 data: { "loginId" : loginId, 
						 "password" : password,
						 "name" : name,
						 "email" : email	 
				 },
				 success:function(data){
						alert(data.result);
						 //login 화면으로 이동
						 location.href="/user/signin_view";
					 },

				 error:function(){
					 alert("에러 발생")
				 }
			 })
				
			
			
		})
		
	});
	
	</script>

</body>
</html>