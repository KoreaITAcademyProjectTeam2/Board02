package com.thread.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thread.domain.CommentVO;
import com.thread.domain.PostVO;
import com.thread.mapper.CommentMapper;
import com.thread.mapper.PostMapper;
import com.thread.service.CommentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment/*")
public class CommentController {

	@Inject
	private CommentService commentService;
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Autowired
	private PostMapper postMapper;
	
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

	// 댓글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String commentRemove(Long comment_id, RedirectAttributes redirectAttrs) throws Exception {
		
	    // post_id 정보가 필요하다면 CommentVO를 통해 가져올 수 있습니다.
	    CommentVO vo = commentService.getById(comment_id);
	    
	    if (vo == null) {
	        redirectAttrs.addFlashAttribute("message", "댓글을 찾을 수 없습니다.");
	        return "redirect:/main";
	    }
	
	    commentService.commentRemove(comment_id);
	
	    return "redirect:/main/getPost?post_id=" + vo.getComment_post_id();
	}
	
	// 댓글 목록
	@RequestMapping("/main/getPost")
	public String getPost(@RequestParam("post_id") Long post_id, Model model) {
	    // 게시물 정보 가져오기
	    PostVO post = postMapper.get(post_id);
	    model.addAttribute("post", post);

	    // 댓글 목록 가져오기
	    List<CommentVO> commentList = commentMapper.getListWithPaging(post_id);
	    model.addAttribute("commentList", commentList);

	    return "getPost";
	}



}