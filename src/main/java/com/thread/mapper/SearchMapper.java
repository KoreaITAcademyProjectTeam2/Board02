package com.thread.mapper;

import java.util.List;

import com.thread.domain.Criteria;
import com.thread.domain.PostVO;

public interface SearchMapper {

	//List<PostVO> searchGetList(Criteria cri);
	
	// 내용 검색 
	public List<PostVO> getSearchList(Criteria cri);
	
	// 총 갯수 
	public int searchGetTotal(Criteria cri);

}
