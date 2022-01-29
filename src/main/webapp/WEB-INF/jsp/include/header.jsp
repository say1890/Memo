<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header class ="bg-secondary d-flex align-items-center justify-content-between">
			<h1 class ="ml-5">Memo</h1>
			
			<%-- ���ǿ� userId ���� �����ϴ���? --%>
				<c:choose>
				
					<c:when test = "${not empty userId}">
						<div class ="mr-3">
							${userName}�� <a href= "/user/sign_out">�α׾ƿ�</a>
						</div>
					</c:when>
					
					<c:otherwise>
						<div class ="mr-3">
							<a href= "/user/signin_view">�α���</a>
						</div>
					</c:otherwise>
					
				</c:choose>
				
			
		</header>