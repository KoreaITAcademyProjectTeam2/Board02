package com.thread.service;

import java.util.List;

import com.thread.domain.CommentDTO;
import com.thread.domain.CommentVO;

public interface CommentService {

	List<CommentDTO> findAll(Long boardId);

	Long save(CommentDTO commentDTO);

	List<CommentDTO> findAll(List<CommentVO> list);

	static void write(CommentVO vo) {
		// TODO Auto-generated method stub
		
	}


}


