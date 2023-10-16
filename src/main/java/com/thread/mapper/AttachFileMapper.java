package com.thread.mapper;

import java.util.List;

import com.thread.domain.AttachFileDTO;

public interface AttachFileMapper {
	public void insert(AttachFileDTO dto);
	public void delete(String uuid);
	public List<AttachFileDTO> findByPostId(Long post_id);
}
