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
public class PostServiceImpl implements PostService {

	@Setter(onMethod_ = @Autowired)
	private PostMapper mapper;

	@Transactional
	@Override
	public void newPost(PostVO post) {
		log.info("new Post..." + post);
		mapper.insert(post);
	}

	@Override
	public List<PostVO> getList(Long count, Long currentCount) {
		log.info("getList...");
		return mapper.getList(count, currentCount);
	}

	@Override
	public PostVO get(Long post_id) {
		log.info("get...");
		return mapper.get(post_id);
	}

	@Transactional
	@Override
	public boolean modify(PostVO post) {
		log.info("modify... : " + post);
		boolean modifyResult = mapper.update(post) == 1;
		return modifyResult;
	}

	@Override
	public boolean remove(Long post_id) {
		mapper.deleteComments(post_id);
		return mapper.delete(post_id) == 1;
	}

	@Override
	public int getCommentCount(Long post_id) {
		return mapper.getCommentCount(post_id);
	}

	@Override
	public String getUser(Long post_id) {
		return mapper.getUser(post_id);
	}

	@Override
	public int countPostsByUser(String user_email) {
		return mapper.countPostsByUser(user_email);
	}

}
