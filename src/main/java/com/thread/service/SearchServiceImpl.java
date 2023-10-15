package com.thread.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thread.domain.Criteria;
import com.thread.domain.PostVO;
import com.thread.mapper.SearchMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchMapper searchMapper;
	
	/* 검색 */
	@Override
	public List<PostVO> getSearchList(Criteria cri) {
		
		log.info("getSearchList().......");
		
		return searchMapper.getSearchList(cri);
	}

	/* 총 갯수 */
	@Override
	public int searchGetTotal(Criteria cri) {
		
		log.info("searchGetTotal().......");
		
		return searchMapper.searchGetTotal(cri);
		
	}

}
