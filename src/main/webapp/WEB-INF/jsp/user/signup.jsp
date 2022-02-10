<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memo-ȸ������</title>
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
		<div class = "display-4">ȸ�� ����</div>
			<!-- ���̵� �н����� �н����� Ȯ�� �̸� �̸��� -->
			<input  type = "text"  id = "loginIdInput" placeholder = "���̵�" class = "form-control mt-3">
				<small id ="idCheckInfo" class ="d-none">text</small>
			<input  type = "password"  id = "passwordInput" placeholder = "��й�ȣ" class = "form-control mt-3">
			<input  type = "password"  id = "passwordConfirmInput" placeholder = "��й�ȣ Ȯ��" class = "form-control mt-3">
			<input  type = "text"   id = "nameInput" placeholder = "�̸�" class = "form-control mt-3">
			<input  type = "email"   id = "emailInput" placeholder = "�̸���" class = "form-control mt-3">
				<small id ="mailCheckInfo" class ="d-none"></small>
			
			<button type = "button" id ="joinBtn" class ="mt-3 btn btn-primary form-control" >ȸ�� ����</button>
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
				$("#idCheckInfo").text("ID�� 5�� �̻����� �Է����ּ���.");
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
						$("#idCheckInfo").text("�ߺ��Ǿ����ϴ�.");	
						isIdDuplication = true;
						
					} else {
						 $("#idCheckInfo").removeClass("d-none");
						 $("#idCheckInfo").text("��� �����մϴ�.");
						isIdDuplication = false;
						
					}
					
				}, error:function(e){
					alert("error" + e);
				}
				
			});
			
		}));
		
		 // �̸��� ��ȿ�� �˻�
		$("#emailInput").on("propertychange change keyup paste input",(function(){ 
			
			var email = $("#emailInput").val();
			
			$.ajax({
				url: "/user/checkEmail",
				type:"post",
				data:{"email":email},
				success:function(data){
					if(data.result) {
						$("#mailCheckInfo").removeClass("d-none");
						$("#mailCheckInfo").text("�̹� ������� �̸����Դϴ�.");	
						isEmailDuplication = true;
						
					} else {
						$("#mailCheckInfo").removeClass("d-none");
						 $("#idCheckInfo").text("��� ������ �̸����Դϴ�.");
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
				alert("id�� �Է��ϼ���.");
				return;
			}
			
			if(password == null || password == "") {
				alert("��й�ȣ�� �Է��ϼ���.");
				return;
			}
			if(name == null || name == "") {
				alert("�̸��� �Է��ϼ���.");
				return;
			}
			if(password != passwordConfirm) {
				alert("��й�ȣ�� �ٽ� Ȯ�����ּ���.");
				return;
			}
			
			if(isIdLong == true && isIdDuplication == true){
				alert("id�� �ߺ��Ǿ����ϴ�.");
				return;
			}
			
			if(isIdLong == false){
				alert("id�� 5�� �̻��� �Ǿ�� �մϴ�.");
				return;
			}
			if(email == "" || email == null){
				$("#mailCheckInfo").text("�̸����� �Է��� �ּ���.");
				return;
			}

			 if(regEmail.test(email) && isEmailDuplication==false){
			 alert("�̸��� ������ �����Ͽ����ϴ�.");
			 } else{     
			 alert("�̸����� ��ȿ���� �ʽ��ϴ�.");
			 return;
			 }
			  
		
			 $.ajax({
				 type:"post",
				 url:"/user/sign_up",
				 data:{"loginId":loginId, "password":password, "name":name, "email":email},
				 success:function(data) {
						if(data.result == "success") {
							// �α��� ȭ������ �̵�
							location.href = "/user/signin_view";
							
						} else {
							alert("ȸ������ ����");
						}
					}, 
					error:function() {
						alert("���� �߻�");
					}
			 });
				
			
			
		});
		
	});
	
	</script>

</body>
</html>