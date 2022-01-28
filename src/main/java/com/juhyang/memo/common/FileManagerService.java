package com.juhyang.memo.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	private final String FILE_UPLOAD_PATH ="D:\\juhyang\\springProject\\upload\\image/" ;
	
	// 파일 저장
	public String savefile(int userId, MultipartFile file) {
	
		//파일경로
		//사용자별로구분할수있도록
		//사용자가 파일으르 올린 시간으로 구분
		//
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		
		// 디렉토리 생성
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			//디렉토리 생성 에러
			return null;
		}
		try {
			byte[] bytes = file.getBytes();
			// 파일 저장 경로 + 파일 이름
			Path path = Paths.get(filePath + file.getOriginalFilename());
			//	파일 저장
			Files.write(path, bytes);
			
		}
		catch(IOException e){
			// 파일 저장 실패
			e.printStackTrace();
			return null;
		}
		
		// 파일 접근 가능한 주소 리턴
		// <img src = "/images/12_21313/test.png">
		
		return "/images/" + directoryName + file.getOriginalFilename();
		
	}
}
