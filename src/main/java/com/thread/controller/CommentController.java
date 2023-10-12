package com.thread.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.thread.domain.CommentVO;
import com.thread.service.CommentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment/*")
public class CommentController {

	@Inject
	private CommentService commentService;
	
	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String commentWirte(CommentVO vo) throws Exception {
	    
	    commentService.comment(vo);
	    
	    return "redirect:/main/getPost?post_id=" + vo.getComment_post_id();
	}
	
	// 댓글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String commentModifyForm(@RequestParam Long comment_id, Model model) throws Exception {
	    CommentVO vo = commentService.getById(comment_id);
	    model.addAttribute("comment", vo);
	    return "comment/modify";
	}

	// 댓글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String commentRemoveForm(@RequestParam Long comment_id, Model model) throws Exception {
	    CommentVO vo = commentService.getById(comment_id);
	    model.addAttribute("comment", vo);
	    return "comment/remove";
	}

}