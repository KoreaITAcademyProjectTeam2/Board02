package com.thread.domain;

import lombok.Data;

@Data
public class LikeVO {
	private Long post_like_id; //posts.post_id
	private String user_like_email; //users.user_email
}
