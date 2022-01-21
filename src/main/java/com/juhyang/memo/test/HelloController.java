package com.juhyang.memo.test;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class HelloController {
	@ResponseBody
	@GetMapping("/hello")
	public String Hello() {
		return "hello!";
	}
}
