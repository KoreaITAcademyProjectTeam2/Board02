package com.thread.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	private PostService postService;
	
	@GetMapping("/newPost")
	public void newPost() {

		log.info("make post");
	}

	@PostMapping("/newPost")
	public String makePost(PostVO post, @RequestParam("post_content") String post_content) {
		post.setPost_content(post_content);
		post.setPost_user_email("test1@example.com");
		postService.newPost(post);
		log.info("make post complete");
		return "redirect:/main";
	}

	@GetMapping({"/getPost", "/modifyPost"})
	public void viewPost(@RequestParam("post_id") Long post_id, Model model) {
		model.addAttribute("post", postService.get(post_id));
		log.info("check a thread " + post_id);
	}
	
	@PostMapping("/modifyPost")
	public String modifyPost(PostVO post) {
		log.info(postService.modify(post));
		return "redirect:/main/getPost?post_id="+post.getPost_id();
	}
	
	@PostMapping("/removePost")
	public String removePost(@RequestParam Long post_id) {
		postService.remove(post_id);
		log.info(post_id +" remove complete");
		return "redirect:/main";	
	}
	
	@GetMapping("/loadPost")
	public void loadPost(@RequestParam int count, @RequestParam int currentCount, Model model) {
		model.addAttribute("page", model);
	}
	
}
