package com.juhyang.memo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.juhyang.memo.common.FileManagerService;
import com.juhyang.memo.common.PermissionIntercepter;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
	//컴퓨터 ( 서버 ) 내 특정 경로를 클라이언트 ( 브라우저 ) 에서 특정 path로 접근하도록 하는 설정
	
	
	@Autowired
	PermissionIntercepter permissionIntercepter;
	
	//spring bean이라는 것에 클래스를 등록해야 autowired를 사용 가능. service, repository 등에 spring bean에 등록하는 것이 있기 때문에 autowired를 넣어줬기때문에
	//에러가 나지 않았던거임.
	
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**") //클라이언트에서 접근하도록 하는 path ;
		.addResourceLocations("file:///"+FileManagerService.FILE_UPLOAD_PATH);
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(permissionIntercepter).
		addPathPatterns("/**") // 어떤 path가 인터셉터를 거쳐서 수행될지 설정
		.excludePathPatterns("/static/**", "/images/**", "/user/sign_out"); // 제외할 path
		
		
	}
}
