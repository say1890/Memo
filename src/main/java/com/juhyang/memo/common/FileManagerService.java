package com.juhyang.memo.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	//private final String FILE_UPLOAD_PATH ="D:\\juhyang\\springProject\\upload\\image/" ;
	public final static String FILE_UPLOAD_PATH ="C:\\Users\\karu1\\OneDrive\\문서\\portfolio\\workspace\\upload\\image/";
	//static 키워드를 붙여서 메소드 자체가 그냥 호출될 수 있고, 변수값도 바로 쓸 수 있게끔 해줌.
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	// 파일 저장
	public static String savefile(int userId, MultipartFile file) {
	
		if(file == null) {
			logger.error("FileManagerService::savefile - 업로드 파일 없음");
			return null;
		}
		//파일경로
		//사용자별로구분할수있도록
		//사용자가 파일으르 올린 시간으로 구분
		//userId ->사용자별로 파일을 관리하기 때문에 파일 이름이 겹칠 일이 없음.
		//System.currentTimeMillis()   - > 1970년 1월 1일 기준으로 현지 밀리 세컨이 경과되었는지 나타내는 수
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		
		// 디렉토리 생성
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			//디렉토리 생성 에러
			logger.error("디렉토리 생성 에러");
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
			
			logger.error("파일 저장 에러");
			e.printStackTrace();
			return null;
		}
		
		// 파일 접근 가능한 주소 리턴
		// <img src = "/images/12_21313/test.png">
		
		return "/images/" + directoryName + file.getOriginalFilename();
		
	}
	
	// 파일 삭제
	public static void removeFile(String filePath) {
		
		
		//	삭제할 파일 경로
		
		// 경로 형식:	filePath : /images/22_232321/test.png
		// 	실제 파일 경로:  
		
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images/", "");
		
		// 파일 지우기
		Path path = Paths.get(realFilePath);
		
		
		// 파일이 있는지 확인
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				logger.error("파일 삭제 실패");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// 디렉토리 삭제 ( 폴더)
		// 실제 디렉토리 경로 : 퍼알 아룸울 제외한 C:\\Users\\karu1\\OneDrive\\문서\\portfolio\\workspace\\upload\\image\\4_1644231214787 
		path = path.getParent(); // 이 파일이 포함된 디렉토리를 return
		
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				logger.error("디렉토리 삭제 실패");
				e.printStackTrace();
			}
		}
				 
			}
}
