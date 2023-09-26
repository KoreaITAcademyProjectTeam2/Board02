package com.thread.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PostVO {
    private Long post_id;
    private String post_content;
    private String post_user_email;
    private Date post_add_date;
    private Date post_modify_date;
}
