<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header class ="bg-secondary d-flex align-items-center ">
			<h1 class ="ml-5">Memo</h1>
			
			<%-- 세션에 userId 값이 존재하는지? --%>
				<c:choose>
				
					<c:when test = "${not empty userId}">
						<div class ="mr-3">
							${userName}님 <a href= "/user/sign_out">로그아웃</a>
						</div>
					</c:when>
					
					<c:otherwise>
						<div class ="mr-3">
							<a href= "/user/sign_in">로그인</a>
						</div>
					</c:otherwise>
					
				</c:choose>
				
			
		</header>