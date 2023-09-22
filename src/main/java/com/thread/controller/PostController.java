package com.thread.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class PostController {



    @GetMapping("/newPost")
    public void newPost() {

        log.info("make thread post");
    }

    @PostMapping("/newPost")
    public String makeThread() {
    		log.info("make thread complete");
        return "redirect:/main";
    }
    
    @GetMapping("/postId") //특정 아이디를 가진 스레드에 접속한다.
    public void check_Thread() {

        log.info("check a thread");
    }
}
