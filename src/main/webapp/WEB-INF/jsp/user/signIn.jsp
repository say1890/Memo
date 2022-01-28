<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
<!-- bootstrap -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- stylesheet -->
	<link rel = "stylesheet" href = "/static/css/user/style.css" type = "text/css">


</head>
<body>
	<div id = "wrap">
	 	<c:import url ="/WEB-INF/jsp/include/header.jsp" />
	 	<section class = "d-flex justify-content-center">
	 	
	 	<form id="loginForm">
	 		<div class = "login-box my-5">
	 			<input  type = "text"  id = "loginIdInput" placeholder = "���̵�" class = "mt-3">
				<input  type = "password"  id = "passwordInput" placeholder = "��й�ȣ" class ="mt-3">
	 			<button type = "submit"  class ="mt-3">�α���</button>
	 			<div class ="text-center mt-2">
	 				<a href = "user/signup_view">ȸ������</a>
	 			</div>
	 		</div>
	 	</form>
	 	
	 	</section>
	 	<c:import url ="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	
	<script>
		$(document).ready(function(){
			$("#loginForm").on("submit", function(e){
				e.preventDefault();
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId==null){
					alert("id �Է��ϼ���");
					return;
				}
				if(password == null){
					alert("pw�Է��ϼ���.");
				}
				
				$.ajax({
					
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data){
						if(data.result == "success"){
							location.href ="/post/list_view";
						}
						else{
							alert("���̵�, ��й�ȣ Ȯ���ϼ���.");
						}
					},
					error:function(){
						alert("���� �߻�");
					}
					
				})
				
			})
			
		});
	</script>
	

</body>
</html>