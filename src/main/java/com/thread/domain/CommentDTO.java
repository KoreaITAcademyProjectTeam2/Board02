package com.thread.domain;

import java.util.Date;
import java.util.List;
public class CommentDTO {

  private int commentCnt;
  private List<CommentVO> list;
  private String comment_content;
  private Date comment_add_date;
  private Date comment_modify_date;
  private int comment_id;
  private String comment_user_email;
  private int comment_post_id;

}