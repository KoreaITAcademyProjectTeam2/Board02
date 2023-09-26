package com.thread.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thread.domain.PostVO;
import com.thread.mapper.PostMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PostServiceImpl implements PostService{
	
	@Setter(onMethod_ = @Autowired)
	private PostMapper mapper;
	
	@Transactional
	@Override
	public void newPost(PostVO post) {
		log.info("new Post");
		
		mapper.insert(post);
	}

}
