package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class URIController {
	@GetMapping("/")
	public String goMain() {
		log.info("go=={}","메인으로");
		return "/index";
	}
	
	@GetMapping("/views/**")
	public String goPage(HttpServletRequest req) {
		log.info("req=={}",req.getRequestURI());
		return req.getRequestURI();
		
	}
}
