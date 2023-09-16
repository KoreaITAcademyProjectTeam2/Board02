package com.thread.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/thread/*")
@AllArgsConstructor
public class PostController {

    //로그인 이후 나오는 첫 페이지. 모든 글과 댓글이 보이도록 한다.
    @GetMapping("/main")
    public void list(){

        log.info("Main Page Thread List");
    }

    @GetMapping("/newThread")
    public void newPost() {

        log.info("make thread post");
    }

    @PostMapping("/newThread")
    public String makeThread() {
    		log.info("make thread complete");
        return "redirect:/thread/list";
    }
    
    @GetMapping("/threadId") //특정 아이디를 가진 스레드에 접속한다.
    public void check_Thread() {

        log.info("check a thread");
    }

}