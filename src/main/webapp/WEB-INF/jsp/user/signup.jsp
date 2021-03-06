<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memo-회원가입</title>
<!-- bootstrap -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- stylesheet -->
	<link rel = "stylesheet" href = "/static/css/style.css" type = "text/css">

	

	
</head>
<body>
	<div id = "wrap">
	<c:import url ="/WEB-INF/jsp/include/header.jsp" />

		
		<section class ="content  d-flex justify-content-center">
		<div class = "join-box my-5">
		<div class = "display-4">회원 가입</div>
			<!-- 아이디 패스워드 패스워드 확인 이름 이메일 -->
			<input  type = "text"  id = "loginIdInput" placeholder = "아이디" class = "form-control mt-3">
				<small id ="idCheckInfo" class ="d-none">text</small>
			<input  type = "password"  id = "passwordInput" placeholder = "비밀번호" class = "form-control mt-3">
			<input  type = "password"  id = "passwordConfirmInput" placeholder = "비밀번호 확인" class = "form-control mt-3">
			<input  type = "text"   id = "nameInput" placeholder = "이름" class = "form-control mt-3">
			<input  type = "email"   id = "emailInput" placeholder = "이메일" class = "form-control mt-3">
				<small id ="mailCheckInfo" class ="d-none"></small>
			
			<button type = "button" id ="joinBtn" class ="mt-3 btn btn-primary form-control" >회원 가입</button>
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
		
		 
		 var isIdDuplication =true;
		 var isEmailDuplication =true;
		 var isIdLong = false;
		 
		 
		$("#loginIdInput").on("propertychange change keyup paste input",(function(){ 
			$("#idCheckInfo").removeClass("d-none");
			var loginId = $("#loginIdInput").val();
			if(loginId.length<=4){
				$("#idCheckInfo").text("ID는 5자 이상으로 입력해주세요.");
				return;
			}
			if(loginId.length>=5){
				$("#idCheckInfo").addClass("d-none");
				isIdLong=true;
			}
			$.ajax({
				url: "/user/checkId",
				type:"post",
				data:{"loginId":loginId},
				success:function(data){
					if(data.result) {
						$("#idCheckInfo").removeClass("d-none");
						$("#idCheckInfo").text("중복되었습니다.");	
						isIdDuplication = true;
						
					} else {
						 $("#idCheckInfo").removeClass("d-none");
						 $("#idCheckInfo").text("사용 가능합니다.");
						isIdDuplication = false;
						
					}
					
				}, error:function(e){
					alert("error" + e);
				}
				
			});
			
		}));
		
		 // 이메일 유효성 검사
		$("#emailInput").on("propertychange change keyup paste input",(function(){ 
			
			var email = $("#emailInput").val();
			
			$.ajax({
				url: "/user/checkEmail",
				type:"post",
				data:{"email":email},
				success:function(data){
					if(data.result) {
						$("#mailCheckInfo").removeClass("d-none");
						$("#mailCheckInfo").text("이미 사용중인 이메일입니다.");	
						isEmailDuplication = true;
						
					} else {
						$("#mailCheckInfo").removeClass("d-none");
						 $("#idCheckInfo").text("사용 가능한 이메일입니다.");
						 isEmailDuplication = false;
						
					}
					
				}, error:function(e){
					alert("error" + e);
				}
				
			});
			
		}));

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
			
			if(isIdLong == true && isIdDuplication == true){
				alert("id가 중복되었습니다.");
				return;
			}
			
			if(isIdLong == false){
				alert("id는 5자 이상이 되어야 합니다.");
				return;
			}
			if(email == "" || email == null){
				$("#mailCheckInfo").text("이메일을 입력해 주세요.");
				return;
			}

			 if(regEmail.test(email) && isEmailDuplication==false){
			 alert("이메일 인증에 성공하였습니다.");
			 } else{     
			 alert("이메일이 유효하지 않습니다.");
			 return;
			 }
			  
		
			 $.ajax({
				 type:"post",
				 url:"/user/sign_up",
				 data:{"loginId":loginId, "password":password, "name":name, "email":email},
				 success:function(data) {
						if(data.result == "success") {
							// 로그인 화면으로 이동
							location.href = "/user/signin_view";
							
						} else {
							alert("회원가입 실패");
						}
					}, 
					error:function() {
						alert("에러 발생");
					}
			 });
				
			
			
		});
		
	});
	
	</script>

</body>
</html>