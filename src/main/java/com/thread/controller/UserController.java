package com.thread.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class UserController {
	
    //로그인 이후 나오는 첫 페이지. 모든 글과 댓글이 보이도록 한다.
    @GetMapping("/main")
    public void mainView(){

        log.info("Main Page Thread List");
    }
	
	@GetMapping("/login")
    public void loginPage(){

        log.info("Login Page");
    }
	
	@PostMapping("/main")
	public String loginSuccess() {
		log.info("go mainPage");
		
		return "redirect:./main";
	}
	
}
