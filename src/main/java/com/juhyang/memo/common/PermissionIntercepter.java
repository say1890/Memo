package com.juhyang.memo.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionIntercepter implements HandlerInterceptor {

	// 요청이 들어올때
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
			
			// 로그인 정보
			HttpSession session = request.getSession();
			
			
			// 현재 요청한 url의 path ( uri )
			String uri = request.getRequestURI();
			
			
			// 로그인 상태
			if(session.getAttribute("userId") != null) {
				//로그인 화면과 회원가입 화면 접근 못하게
				//리스트 화면으로 이동
				
				if(uri.startsWith("/user/")) {
					//리스트 페이지로 이동
					response.sendRedirect("/post/list_view");
					return false;
				}
				
			}else {	// 비로그인 상태
					//리스트 화면, 디테일 화면으로 이동하려고 할때 로그인 페이지로 이동
				if(uri.startsWith("/post/")) {
					response.sendRedirect("/user/signin_view");
					return false;
				}
				
			
			}
			return true;
			
		
			
		}
	// response 처리할때
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response,Object handler,
				ModelAndView modelAndView) {
			
		}
	// 모든 것이 완료되었을때
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
			Object handler, Exception ex) {
		
	}
}