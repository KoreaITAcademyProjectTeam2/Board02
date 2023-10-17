package com.thread.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.thread.domain.CommentVO;
import com.thread.domain.UserVO;
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
	public String commentWirte(CommentVO vo, HttpSession session) throws Exception {
	    // 세션에서 로그인한 사용자의 정보를 가져옵니다.
	    UserVO user = (UserVO) session.getAttribute("member");
	    
	    if (user != null) {
	        // 로그인한 사용자의 이메일 정보를 CommentVO에 설정합니다.
	        vo.setComment_user_email(user.getUser_email());
	        
	        commentService.comment(vo);
	        
	        return "redirect:/main/getPost?post_id=" + vo.getComment_post_id();
	    } else {
	        return "redirect:/error";
	    }
	}

	// 댓글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String commentModify(CommentVO vo) throws Exception {
	    commentService.commentModify(vo);
	    return "redirect:/main/getPost?post_id=" + vo.getComment_post_id();
	}

	// 댓글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String commentRemove(@RequestParam Long comment_id) throws Exception {
	    CommentVO vo = commentService.getById(comment_id);
	    if (vo != null) {
	        commentService.commentRemove(comment_id);
	        return "redirect:/main/getPost?post_id=" + vo.getComment_post_id();
	    } else {
	        // 적절한 에러 처리
	        return "redirect:/error";
	    }
	}
	
//	// 무한 스크롤
//	@RequestMapping(value = "/getComments", method = RequestMethod.GET)
//	public @ResponseBody List<CommentVO> getComments(@RequestParam Long postId,
//	                                                 @RequestParam int page,
//	                                                 @RequestParam int pageSize) throws Exception {
//	    
//		List<CommentVO> comments = commentService.getCommentsByPostId(postId, page, pageSize);
//		return comments;
//	}

}
