<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޸� ����Ʈ</title>
<!-- bootstrap -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- stylesheet -->
	<link rel = "stylesheet" href = "/static/css/style.css" type = "text/css">

</head>
<body>
	<div id  ="wrap">
		<c:import url ="/WEB-INF/jsp/include/header.jsp" />
		<section class ="d-flex justify-content-center">
			<div class ="w-75 my-5">
				<h1>�޸�Խ���</h1>
				<table class ="table">
					<thead>
						<tr>
							<th>NO.</th>
							<th>����</th>
							<th>�ð�</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var ="post" items = "${postlist}">
						
						<tr>
							<td>${post.id}</td>
							<td><a href ="/post/detail_view?postId=${post.id}">${post.subject}</td>
							<td><fmt:formatDate value ="${post.createdAt}" pattern = "yyyy�� MM�� dd�� h�� mm��"/></td>
						</tr>
						
						</c:forEach>
					</tbody>
				</table>
				
				<div class ="d-flex justify-content-end">
				<a href = "/post/create_view" class ="btn btn-info">�۾���</a>
				</div>
				<button></button>
				
			</div>
		</section>
		
		<c:import url ="/WEB-INF/jsp/include/footer.jsp"/>
	</div>

</body>
</html>