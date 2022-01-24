package com.juhyang.memo.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {
	
	//암호화 메소드
	public static String md5(String message) {
		String encData = "";
		try {
			//암호화를 해주는 객체 생성
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = message.getBytes();
			
			//암호화 기준 : md5 으로 암호를 해줌
			md.update(bytes);
			byte[] digest = md.digest();
			
			// 숫자  ->  문자열
			for(int i = 0; i < digest.length; i++) {
				
				encData += Integer.toHexString(digest[i] & 0xff);
				
				
			}
			
		} catch (NoSuchAlgorithmException e) {
		
			e.printStackTrace();
			return null;
		}
		
		return encData;
	}
}
