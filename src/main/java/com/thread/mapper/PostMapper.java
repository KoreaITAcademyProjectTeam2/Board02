package com.thread.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thread.domain.PostVO;

public interface PostMapper {
	
	public List<PostVO> getList(@Param("count") Long count, @Param("currentCount")Long currentCount);
	
	public PostVO get(Long post_id);
	
    public void insert(PostVO post);
    
    public int update(PostVO post);
    
    public int delete(Long post_id);
    
    public int deleteComments(Long post_id);
    
    public String getUser(Long post_id);
    
    public int getCommentCount(Long post_id);
    
    public List<Integer> getCommentCountList(@Param("count")Long count, @Param("currentCount")Long currentCount);
}
