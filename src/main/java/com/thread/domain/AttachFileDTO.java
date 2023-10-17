package com.thread.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	private String file_name;
	private String uploadPath;
	private String uuid;
	private Long file_post_id;
}
