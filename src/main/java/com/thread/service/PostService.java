package com.thread.service;

import java.util.List;

import com.thread.domain.PostVO;

public interface PostService {
	
	public void newPost(PostVO post);
	
	public List<PostVO> getList(Long count, Long currentCount);
	
	public PostVO get(Long post_id);
	
	public boolean modify(PostVO post);
	
	public boolean remove(Long post_id);

	
	public int getCommentCount(Long post_id);

	String getUser(Long post_id);
}
