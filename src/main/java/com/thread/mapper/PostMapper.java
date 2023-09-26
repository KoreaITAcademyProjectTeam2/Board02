package com.thread.mapper;

import java.util.List;

import com.thread.domain.PostVO;

public interface PostMapper {
	
	public List<PostVO> getList();
	
    public void insert(PostVO post);
    
    public int update(PostVO post);
}
