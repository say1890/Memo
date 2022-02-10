package com.juhyang.memo.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.memo.user.bo.UserBO;
import com.juhyang.memo.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId")String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email")String email
			)
	{
int count = userBO.AddUser(loginId, password, name, email);
		
		// {"result":"success"} 
		// {"result":"fail"}
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	
	}
	
	@PostMapping("/sign_in")
	public Map<String,String> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request
			) {
			User user =userBO.getUser(loginId, password);
			 Map<String,String> result = new HashMap<>();
			if(user != null) {
				//login success
				result.put("result", "success");
				HttpSession session = request.getSession();
				
				//id, loginId, name
				session.setAttribute("userId", user.getId());
				session.setAttribute("userLoginId", user.getLoginId());
				session.setAttribute("userName", user.getName());
				
				
			}
			else {
				//login fail
				result.put("result", "fail");
			}
			return result;
			
	}
	
	@PostMapping("/checkId")
	public Map<String,Boolean> checkId(@RequestParam("loginId") String loginId){
		Map<String,Boolean> result = new HashMap<>();
		result.put("result",userBO.CountUser(loginId));
		return result;
		
	}
	
	@PostMapping("/checkEmail")
	public Map<String,Boolean> checkEmail(@RequestParam("email") String email){
		Map<String,Boolean> result = new HashMap<>();
		result.put("result",userBO.CountEmail(email));
		return result;
			
		}
	
	
	
	
}
