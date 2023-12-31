package com.thread.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thread.domain.AttachFileDTO;
import com.thread.domain.CommentVO;
import com.thread.domain.Criteria;
import com.thread.domain.PageDTO;
import com.thread.domain.PostDTO;
import com.thread.domain.PostVO;
import com.thread.domain.UserVO;
import com.thread.service.CommentService;
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
	@Autowired
	private CommentService commentService;

	@Autowired
	private PostDTO postDTO;
	
	//검색
	@Autowired
	private SearchService searchService;
	
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
		
		if(post.getAttachList() != null) {
			post.getAttachList().forEach(attach -> log.info(attach));
		}
		
		post.setPost_content(post_content);
		post.setPost_user_email(currentUser.getUser_email());
		
		postService.newPost(post);

		return "redirect:/main";
	}

	@GetMapping("/getPost")
	public void viewPost(@RequestParam("post_id") Long post_id, Model model) {
		List<CommentVO> commentList = commentService.getListWithPaging(post_id);
		model.addAttribute("commentList", commentList);

		postDTO.setPost(postService.get(post_id));
		postDTO.setCommentCount(postService.getCommentCount(post_id));
		postDTO.setUserName(postService.getUser(post_id));
		model.addAttribute("post", postDTO);

		log.info("check a thread " + post_id);
	}

	@GetMapping("/modifyPost")
	public String getModifyPost(@RequestParam("post_id") Long post_id, HttpSession session, Model model) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		
		log.info(currentUser.getUser_email() + " user : post " + postService.getUserEmail(post_id));
		
		if(!currentUser.getUser_email().equals(postService.getUserEmail(post_id))) {
			return "redirect:/main/getPost?post_id=" + post_id;
		}

		postDTO.setPost(postService.get(post_id));
		postDTO.setCommentCount(postService.getCommentCount(post_id));
		postDTO.setUserName(postService.getUser(post_id));
		
		postDTO.getPost().getAttachList().forEach(attach -> log.info(attach));
		
		model.addAttribute("post", postDTO);

		log.info("check a thread " + post_id);
		return "main/modifyPost";
	}
	
	@PostMapping("/modifyPost")
	public String modifyPost(HttpSession session, PostVO post) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		if(currentUser.getUser_email().equals(postService.getUserEmail(post.getPost_id()))) {
			log.info(postService.modify(post));
			return "redirect:/main/getPost?post_id=" + post.getPost_id();
		}
		return "redirect:/main";
	}

	@PostMapping("/removePost")
	public String removePost(HttpSession session, @RequestParam Long post_id) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		log.info("current user: "+currentUser.getUser_email());
		log.info("post user: "+postService.getUserEmail(post_id));
		if(currentUser.getUser_email().equals(postService.getUserEmail(post_id))) {
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

	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> getAttachList(Long post_id){
		log.info("postID: " + post_id);
		return new ResponseEntity<>(postService.getAttachList(post_id), HttpStatus.OK);
		
	}
	
}
