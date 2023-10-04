package com.thread.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class CommentDTO {

  private int commentCnt;
  private List<CommentVO> list;
}
