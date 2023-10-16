package com.thread.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thread.domain.AttachFileDTO;
import com.thread.domain.CommentVO;
import com.thread.domain.PostVO;
import com.thread.mapper.AttachFileMapper;
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

	@Setter(onMethod_ = @Autowired)
	private AttachFileMapper attachMapper;
	
	@Transactional
	@Override
	public void newPost(PostVO post) {
		
		mapper.insert(post);
		Long generatedPostId = mapper.LastPostId();
		if(post.getAttachList() == null || post.getAttachList().size() <= 0) {
			return;
		}
		
		post.getAttachList().forEach(attach -> {
			attach.setFile_post_id(generatedPostId);
			
			attachMapper.insert(attach); 
		}); 
		
		
	}

	@Override
	public List<PostVO> getList(Long count, Long currentCount) {
		log.info("getList...");
		List<PostVO> posts = new ArrayList<PostVO>();
		posts.forEach(post -> {
			if(attachMapper.findByPostId(post.getPost_id()) != null) {
				post.setAttachList(attachMapper.findByPostId(post.getPost_id()));
			}
		});
		return mapper.getList(count, currentCount);
	}

	@Override
	public PostVO get(Long post_id) {
		log.info("get...");
		PostVO post = mapper.get(post_id);
		post.setAttachList(attachMapper.findByPostId(post_id));
		return post;
	}

	@Transactional
	@Override
	public boolean modify(PostVO post) {
		log.info("modify... : " + post);
		
		if(post.getAttachList() == null) {
			return mapper.update(post) == 1;
		}
		
		post.getAttachList().forEach(attach -> {
			attach.setFile_post_id(post.getPost_id());
			
			attachMapper.insert(attach); 
		}); 
		post.setAttachList(attachMapper.findByPostId(post.getPost_id()));
		
		return mapper.update(post) == 1;
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
	
	@Override
	public List<AttachFileDTO> getAttachList(Long post_id){
		return attachMapper.findByPostId(post_id);
	}
}
