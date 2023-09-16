package com.thread.domain;

import lombok.Data;

import java.util.Date;

@Data
public class CommentVO {
    private Long comment_id;
    private String comment_content;
    private String comment_post_id;
    private String comment_user_name;
    private Date comment_add_date;
    private Date comment_modify_date;
}
