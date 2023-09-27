package com.thread.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thread.domain.PostVO;
import com.thread.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class PostController {

	private PostService service;


    @GetMapping("/newPost")
    public void newPost() {

        log.info("make post");
    }

    @PostMapping("/newPost")
    public String makePost(PostVO post) {
    	
    	log.info("make post complete");
    	return "redirect:/main";
    }
    
    @GetMapping("/postId") //특정 아이디를 가진 스레드에 접속한다.
    public void viewPost() {

        log.info("check a thread");
    }
    
    @GetMapping({"/get", "modify"})
    public void get(@RequestParam("post_id") Long post_id) {
    	
    }
}
