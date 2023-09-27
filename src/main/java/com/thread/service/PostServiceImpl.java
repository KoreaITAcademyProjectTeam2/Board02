package com.thread.service;

import java.util.List;

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

	@Override
	public List<PostVO> getList() {
		
		return mapper.getList();
	}

	@Override
	public PostVO get(Long post_id) {
		return mapper.get();
	}

	@Override
	public boolean modify(Long post_id) {
		
		return false;
	}

	@Override
	public boolean remove(Long post_id) {
		
		return mapper.delete(post_id)==1;
	}

}
