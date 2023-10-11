package com.thread.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thread.domain.CommentVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommentMapperTest {

    @Autowired
    private CommentMapper commentMapper;

    @Test
    public void testComment() {

    // 테스트할 댓글 데이터 생성
	CommentVO comment = new CommentVO();
    comment.setComment_post_id(1L);
    comment.setComment_content("plzplzplzplz");

    // comment 메소드 호출
    commentMapper.comment(comment);

    // 데이터베이스에서 댓글 읽어오기
    CommentVO retrieved = commentMapper.getById(comment.getComment_id());

    // 원래의 데이터와 일치하는지 확인
	// assertEquals의 첫 번째 인자는 기대값(expected), 두 번째 인자는 실제 값(actual)입니다.
	// 여기서는 작성한 댓글 내용과 조회된 댓글 내용이 동일함을 확인합니다.
	assertEquals(comment.getComment_content(), retrieved.getComment_content());
	
	log.info("comment!!");
	
    }

    @Test
    public void testUpdate() {
    	
        // 수정할 댓글의 ID와 수정할 내용 설정
    	Long comment_id = 1L; // 수정할 댓글의 ID
        String modifiedContent = "수정된 내용"; // 수정할 내용

        // 댓글 조회 및 수정
        CommentVO comment = commentMapper.getById(comment_id);

        if (comment != null) {
            comment.setComment_content(modifiedContent);
            commentMapper.update(comment);

            // 댓글 재조회 후, 수정된 내용이 일치하는지 확인
            CommentVO modifiedComment = commentMapper.getById(comment_id);

            assertEquals(modifiedContent, modifiedComment.getComment_content());
        } else {
            fail("댓글을 찾을 수 없습니다.");
        }
    } 
    
    @Test
    public void testDelete() {
    	
        // 삭제할 댓글의 ID 설정
        Long comment_id = 1L; // 삭제할 댓글의 ID

        // 댓글 조회 및 삭제
        CommentVO comment = commentMapper.getById(comment_id);

        if (comment != null) {
            commentMapper.delete(comment_id);

            // 댓글 재조회 후, 해당 댓글이 없는지 확인
            CommentVO deletedComment = commentMapper.getById(comment_id);
            
            assertNull(deletedComment);
        } else {
            fail("댓글을 찾을 수 없습니다.");
        }
    } 

}