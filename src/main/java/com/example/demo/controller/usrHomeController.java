package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class usrHomeController {
	
	@RequestMapping("/usr/home/main")
	public String main() {
		return "/usr/home/main";
	}
	
	@RequestMapping("/")
	public String demo() {
		return "/usr/home/main";
	}
	
	@RequestMapping("/demo")
	public String dddemo() {
		return "/usr/demo";
	}
}
