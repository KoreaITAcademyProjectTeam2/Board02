package com.thread.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thread.domain.CommentVO;
import com.thread.service.CommentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentController {

	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWirte(CommentVO vo) throws Exception {
	    
	    CommentService.write(vo);
	    
	    return "redirect:/view?post_id=" + vo.getComment_post_id();
	}
}