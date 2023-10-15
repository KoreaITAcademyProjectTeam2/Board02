package com.thread.service;

import java.util.List;

import com.thread.domain.Criteria;
import com.thread.domain.PostVO;

public interface PostService {
	
	public void newPost(PostVO post);
	
	public List<PostVO> getList(Long count, Long currentCount);
	
	public PostVO get(Long post_id);
	
	public boolean modify(PostVO post);
	
	public boolean remove(Long post_id);

	
	public int getCommentCount(Long post_id);

	String getUser(Long post_id);

	public List<PostVO> getSearchList(Long count, Long currentCount);
	
	 /* 검색 목록 
    public static List<PostVO> searchGetList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}*/
}
