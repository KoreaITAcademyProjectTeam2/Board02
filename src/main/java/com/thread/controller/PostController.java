package com.thread.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thread.domain.CommentVO;
import com.thread.domain.Criteria;
import com.thread.domain.PageDTO;
import com.thread.domain.PostVO;
import com.thread.domain.UserVO;
import com.thread.service.CommentService;
import com.thread.domain.PostDTO;
import com.thread.domain.PostVO;
import com.thread.domain.UserVO;
import com.thread.service.PostService;
import com.thread.service.SearchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class PostController {
	
	@Autowired
	private PostService postService;
	private CommentService commentService;
	
	@Autowired
	private PostDTO postDTO;
	
	//검색
	@Autowired
	private SearchService searchService;
	
	@GetMapping("/newPost")
	public void newPost() {

		log.info("make post");
	}

	@PostMapping("/newPost")
	public String makePost(HttpSession session, PostVO post, @RequestParam("post_content") String post_content) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		post.setPost_content(post_content);
		post.setPost_user_email(currentUser.getUser_email());
		postService.newPost(post);
		log.info("make post complete");
		return "redirect:/main";
	}

	@GetMapping({"/getPost", "/modifyPost"})
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
	
	@ResponseBody
	@GetMapping("/loadPost")
	public List<PostVO> loadPost(@RequestParam("count") Long count, 
			@RequestParam("currentCount") Long currentCount) {
		List<PostVO> posts = postService.getList(count, currentCount);
		log.info("post load");
		return posts;
	}
	//검색
	@GetMapping("/search")
	public void searchListsGET(Criteria cri, Model model) {
		
		log.info("cri : " + cri);
		
		List<PostVO> list = searchService.getSearchList(cri);
		log.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			log.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			/* return "search"; */
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, searchService.searchGetTotal(cri)));
		
		
		/* return "search"; */
		
	}
	
	//검색 스크롤
	@ResponseBody
	@GetMapping("/loadSearchPost")
	public List<PostVO> loadSearchPost(@RequestParam("count") Long count, 
			@RequestParam("currentCount") Long currentCount) {
		Long currentCounts = null;
		List<PostVO> posts = postService.getSearchList(count, currentCounts);
		log.info("post load");
		return posts;
	}

}
