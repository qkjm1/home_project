package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class usrHomeController {
	
	@RequestMapping("/usr/home/main")
	@ResponseBody
	public String main() {
		return "hello world!!!!!!!!!!!!!!!!!!!!!!";
	}
	
	@RequestMapping("/usr/home/demo")
	public String demo() {
		return "/usr/demo";
	}
}
