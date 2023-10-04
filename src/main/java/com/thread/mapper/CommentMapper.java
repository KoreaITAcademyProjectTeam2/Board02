package com.thread.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thread.domain.CommentVO;

public interface CommentMapper {

	public int comment(CommentVO vo);

	public CommentVO read(Long post_id);

	public int delete(Long post_id);

	public int update(CommentVO comment);

	public List<CommentVO> getListWithPaging(@Param("post_id") Long post_id);

	// 쓰레드기능으로 바꿔줄 것
	// public int getCountByBno(Long post_id);
}
