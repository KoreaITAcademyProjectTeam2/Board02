package com.thread.service;

import java.util.List;
import java.util.logging.LogManager;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thread.domain.Criteria;
import com.thread.domain.CommentVO;
import com.thread.domain.PostVO;
import com.thread.mapper.PostMapper;
import com.thread.mapper.SearchMapper;

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
	public List<PostVO> getSearchList(Long count, Long currentCount) {
		log.info("getList...");
		return mapper.getList(count, currentCount);
	}
/*
	//검색
	private static final Logger log = LoggerFactory.getLogger(PostServiceImpl.class);
	
	@Autowired
	SearchMapper searchMapper;
	//검색 목록
    @Override
    public List<PostVO> searchGetList(Criteria cri) throws Exception {
        
        return searchMapper.searchGetList(cri);
    }

	*/

	@Override
	public int countPostsByUser(String user_email) {
		return mapper.countPostsByUser(user_email);
	}

	@Override
	public String getFirstCommentUser(Long post_id) {
		return mapper.getFirstCommentUser(post_id);
	}

	@Override
	public CommentVO getFirstComment(Long post_id) {
		return mapper.getFirstComment(post_id);
	}

	@Override
	public String getUserEmail(Long post_id) {
		return mapper.userEmail(post_id);
	}

}
