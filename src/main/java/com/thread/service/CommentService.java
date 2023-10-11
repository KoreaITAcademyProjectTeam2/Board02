package com.thread.service;

import com.thread.domain.CommentVO;

public interface CommentService {

	   void comment(CommentVO vo);
	   
	   int commentModify(CommentVO vo);
	
	   int commentRemove(Long comment_id);
	   
	   int getCommentCount(Long postId);

	   CommentVO getById(Long comment_id);
	}
