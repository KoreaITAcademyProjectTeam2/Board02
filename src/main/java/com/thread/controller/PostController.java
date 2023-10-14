package com.thread.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thread.domain.CommentVO;
import com.thread.domain.PostDTO;
import com.thread.domain.PostVO;
import com.thread.domain.UserVO;
import com.thread.service.CommentService;
import com.thread.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class PostController {

	@Autowired
	private PostService postService;
	@Autowired
	private CommentService commentService;

	@Autowired
	private PostDTO postDTO;
	
	@GetMapping(value = "/newPost", produces = MediaType.APPLICATION_JSON_VALUE)
	public void newPost() {

		log.info("make post");
	}

	@PostMapping(value = "/newPost", produces = MediaType.APPLICATION_JSON_VALUE)
	public String makePost(HttpSession session, PostVO post, @RequestParam("post_content") String post_content) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		
		if(currentUser == null) {
			return "redirect:/login";
		}
		
		post.setPost_content(post_content);
		post.setPost_user_email(currentUser.getUser_email());
		postService.newPost(post);
		log.info("make post complete");
		return "redirect:/main";
	}

	@GetMapping({ "/getPost", "/modifyPost" })
	public void viewPost(@RequestParam("post_id") Long post_id, Model model) {
		List<CommentVO> commentList = commentService.getListWithPaging(post_id);
		model.addAttribute("commentList", commentList);

		postDTO.setPost(postService.get(post_id));
		postDTO.setCommentCount(postService.getCommentCount(post_id));
		postDTO.setUserName(postService.getUser(post_id));
		model.addAttribute("post", postDTO);

		log.info("check a thread " + post_id);
	}

	@PostMapping("/modifyPost")
	public String modifyPost(HttpSession session, PostVO post) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		if(currentUser.getUser_email() == postService.getUser(post.getPost_id())) {
			log.info(postService.modify(post));
			return "redirect:/main/getPost?post_id=" + post.getPost_id();
		}
		return "redirect:/main";
	}

	@PostMapping("/removePost")
	public String removePost(HttpSession session, @RequestParam Long post_id) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		
		if(currentUser.getUser_email() == postService.getUser(post_id)) {
			postService.remove(post_id);
			log.info(post_id + " remove complete");	
		}
		return "redirect:/main";
	}

	@ResponseBody
	@GetMapping(value = "/loadPost", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<PostDTO> loadPost(@RequestParam("count") Long count, @RequestParam("currentCount") Long currentCount) {
		List<PostVO> postVOs = postService.getList(count, currentCount);
		List<PostDTO> postDTOs = new ArrayList<>();

		for (PostVO postVO : postVOs) {
			PostDTO postDTO = new PostDTO();
			postDTO.setPost(postVO);
			postDTO.setCommentCount(postService.getCommentCount(postVO.getPost_id()));
			postDTO.setUserName(postService.getUser(postVO.getPost_id()));
			postDTO.setFirstComment(postService.getFirstComment(postVO.getPost_id()));
			postDTO.setFirstCommentUser(postService.getFirstCommentUser(postVO.getPost_id()));
			postDTOs.add(postDTO);
		}
		log.info("post load");
		return postDTOs;
	}
	
}
