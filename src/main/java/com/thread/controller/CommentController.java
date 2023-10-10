package com.thread.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String commentModify(CommentVO vo) throws Exception {
	    
	    commentService.commentModify(vo);
	    
	    return "redirect:/main/getPost?post_id=" + vo.getComment_post_id();
	    
	}

}