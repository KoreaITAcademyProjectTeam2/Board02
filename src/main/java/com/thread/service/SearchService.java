package com.thread.service;

import java.util.List;

import com.thread.domain.Criteria;
import com.thread.domain.PostVO;

public interface SearchService {
	
	/* 검색 */
	public List<PostVO> getSearchList(Criteria cri);
	
	/* 총 갯수 */
	public int searchGetTotal(Criteria cri);

}
