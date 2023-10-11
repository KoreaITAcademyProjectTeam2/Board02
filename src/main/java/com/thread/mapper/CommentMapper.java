package com.thread.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.thread.domain.CommentVO;

public interface CommentMapper {


	public CommentVO read(Long post_id);

   @Delete("DELETE FROM comments WHERE comment_id = #{comment_id}")
    int delete(Long comment_id);

	@Update("UPDATE comments SET comment_content = #{comment_content}, comment_modify_date = NOW() WHERE comment_id = #{comment_id}")
	int update(CommentVO comment);

	@Select("SELECT * FROM comments WHERE comment_post_id = #{post_id}")
    List<CommentVO> getListWithPaging(Long post_id);
	
//	public List<CommentVO> getListWithPaging(@Param("post_id") Long post_id);

//	public int insert(CommentVO vo);

	public void modifyCommentCnt(Long long1, int i);

	public void updateCommentCnt(String comment_content, int i);

	@Insert("INSERT INTO comments (comment_content, comment_add_date, comment_modify_date, comment_user_email, comment_post_id) " +
            "VALUES (#{comment_content}, NOW(), NOW(), #{comment_user_email}, #{comment_post_id})")
    @Options(useGeneratedKeys = true, keyProperty = "comment_id")
    void comment(CommentVO comment);


	@Select("SELECT * FROM comments WHERE comment_id = #{comment_id}")
	CommentVO getById(Long comment_id);

	@Select("SELECT COUNT(*) FROM comments WHERE post_id = #{post_Id}")
	int countCommentsByPostId(Long post_Id);

	// 쓰레드기능으로 바꿔줄 것
	// public int getCountBypost_id(Long post_id);
}