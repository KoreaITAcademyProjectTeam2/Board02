package com.thread.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class PostDTO {
	private PostVO post;
	private int commentCount;
}
