package com.thread.service;

import java.util.List;

import com.thread.domain.CommentVO;

public interface CommentService {

	   void comment(CommentVO vo);
	   
	   int commentModify(CommentVO vo);
	
	   int commentRemove(Long comment_id);
	   
	   int getCommentCount(Long postId);

	   CommentVO getById(Long comment_id);

	   List<CommentVO> getCommentsByPostId(Long post_id);
	   
	   List<CommentVO> getListWithPaging(Long post_id);

	}

