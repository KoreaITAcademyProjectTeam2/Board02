package com.thread.service;

import java.util.List;

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

    private CommentMapper commentMapper;

    
    @Autowired
    public CommentServiceImpl(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }
    
    @Transactional
    @Override
    public void comment(CommentVO vo) {

        log.info("write......" + vo);

        // CommentVO 객체가 유효한지 검사합니다.
        // 만약 필요한 정보가 없다면 예외를 발생시킵니다.
        if (vo == null || vo.getComment_content() == null || vo.getComment_post_id() == null) {
            throw new IllegalArgumentException("댓글 정보가 유효하지 않습니다");
        }

        // 데이터베이스에 새로운 댓글을 추가합니다.
        commentMapper.comment(vo);

    }


    @Override
    public int commentModify(CommentVO vo) {
        return commentMapper.update(vo);
    }


    @Transactional
    @Override
    public int commentRemove(Long comment_id) {
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
    
    @Override
    public List<CommentVO> getCommentsByPostId(Long post_id) {
        return commentMapper.getListWithPaging(post_id);
    }

    @Override
    public List<CommentVO> getListWithPaging(Long post_id) {
        return commentMapper.getListWithPaging(post_id);
    }
}