package com.thread.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thread.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class UserController {

	@Autowired
	private PostService service;

	// 로그인 이후 나오는 첫 페이지. 모든 글과 댓글이 보이도록 한다.
	@GetMapping("/main")
	public void mainView(Model model) {

		model.addAttribute("list", service.getList());
		log.info("Main Page Thread List");
	}

	@PostMapping("/main")
	public String loginSuccess() {
		log.info("go mainPage");

		return "redirect:/main";
	}

	@GetMapping("/login")
	public void loginPage() {

		log.info("Login Page");
	}

	@PostMapping("/login")
	public String userJoinSuccess() {
		log.info("go LoginPage");

		return "redirect:./login";
	}

	@PostMapping("/userJoin")
	public void userJoinPage() {
		log.info("UserJoin Page");
	}

	@GetMapping("/myPage")
	public void myPage() {
		log.info("go MyPage");
	}

}
