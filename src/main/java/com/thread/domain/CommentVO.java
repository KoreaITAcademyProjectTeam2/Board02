package com.thread.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
    private Long comment_id;
    private String comment_content;
    private Long comment_post_id;
    private String comment_user_email;
    private Date comment_add_date;
    private Date comment_modify_date;
    
	public Long getComment_id() {
        return this.comment_id;
	}

	public void setComment_id(Long id) {
        this.comment_id = id;
	}
	
}
