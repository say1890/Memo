package com.juhyang.memo.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.memo.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {

	@Autowired
	PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("content") String content,
			@RequestParam("subject") String subject,
			@RequestParam("file")MultipartFile file,
			HttpServletRequest request
			) {

		// 현재 로그인된 사용자의 user table id (pk)
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.addPost(userId, subject, content, file);
		
		
		Map<String, String> result = new HashMap<>();
		
		
		if(count ==1)
		{
			result.put("result","success");
		}
		else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	@GetMapping("/delete")
	public Map<String, String> postDelete(@RequestParam("postId") int postId){
		Map<String,String> result = new HashMap<>();

		
		int count = postBO.deletePost(postId);
		if(count ==1)
		{
			result.put("result","success");
		}
		else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	
	
	
}
