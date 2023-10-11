package com.thread.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thread.domain.CommentVO;
import com.thread.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {

    private static final Logger log = LoggerFactory.getLogger(CommentServiceImpl.class);

    @Autowired
    private CommentMapper commentMapper;

    @Transactional
    @Override
    public void comment(CommentVO vo) {

        log.info("write......" + vo);

        // CommentVO 객체가 유효한지 검사합니다.
        // 만약 필요한 정보가 없다면 예외를 발생시킵니다.
        if (vo == null || vo.getComment_content() == null) {
            throw new IllegalArgumentException("댓글 정보가 유효하지 않습니다");
        }

        // 데이터베이스에 새로운 댓글을 추가합니다.
        commentMapper.comment(vo);

    }


    @Override
    public int commentModify(CommentVO vo) {

    	log.info("modify......" + vo);

    	// CommentVO 객체가 유효한지 검사합니다.
    	if (vo == null || vo.getComment_content() == null) {
    	    throw new IllegalArgumentException("댓글 정보가 유효하지 않습니다");
    	}

    	return commentMapper.update(vo);
    }

	@Transactional
	@Override
	public int commentRemove(Long comment_id) {

		log.info("remove...." + comment_id);

		CommentVO vo = commentMapper.read(comment_id);

		commentMapper.modifyCommentCnt(vo.getComment_post_id(), -1);
		return commentMapper.delete(comment_id);

	}
	
    @Override
    public int getCommentCount(Long post_Id) {
        return commentMapper.countCommentsByPostId(post_Id);
    }
    
    @Override
    public CommentVO getById(Long comment_id) {
    	return commentMapper.getById(comment_id);
    }
}