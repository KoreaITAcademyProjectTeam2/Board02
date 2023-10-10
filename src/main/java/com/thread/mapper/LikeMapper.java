package com.thread.mapper;

import com.thread.domain.LikeVO;

public interface LikeMapper {
	public Long likeNumbers(Long post_like_id);
	
	public void LikePost(LikeVO like); //PostLike 생성
	
	public void DislikePost(LikeVO like); //PostLike 삭제	
	
	public void DeletePost(Long post_like_id); //게시글 삭제시 좋아요 삭제.
}
