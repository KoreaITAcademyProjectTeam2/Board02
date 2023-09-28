package com.thread.mapper;

import java.util.List;

import com.thread.domain.PostVO;

public interface PostMapper {
	
	public List<PostVO> getList();
	
	public PostVO get(Long post_id);
	
    public void insert(PostVO post);
    
    public int update(PostVO post);
    
    public int delete(Long post_id);
}
