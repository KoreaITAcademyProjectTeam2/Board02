package com.thread.service;

import com.thread.domain.CommentVO;

public interface CommentService {

	   void comment(CommentVO vo);
	   
	   int commentModify(CommentVO vo);
	
	   int remove(Long comment_id);
	
	   void commentLike(Long comment_id);
	   
	   int getCommentCount(Long postId);
	}
	
