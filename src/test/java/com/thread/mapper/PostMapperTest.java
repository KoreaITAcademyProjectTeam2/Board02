package com.thread.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thread.domain.Criteria;
import com.thread.domain.PostVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PostMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private PostMapper mapper;
	
	@Test
	public void testInsert() {
		
		PostVO post = new PostVO();
		post.setPost_content("새로 작성하는 내용");
		post.setPost_user_email("user1@example.com");

		mapper.insert(post);
		log.info(post);
	}
	
	@Test
	public void testGet() {
		mapper.get(3L);
	}
	
	@Test
	public void testGetList() {
		log.info(mapper.getList(5L,1L));
	}
	
	@Test
	public void testRemove() {
		mapper.deleteComments(2L);
		mapper.delete(2L);
	}
	
	@Test
	public void testGetCommentCount() {
		log.info("comment count: " + mapper.getCommentCount(17L));
	}
	
	@Test
	public void testGetUser() {
		log.info("post3 user: " + mapper.getUser(18L));
	}
	
	//검색
	/*@Test
    public void searchGetListTest() throws Exception{
        
        Criteria cri = new Criteria(3,10);    // 3페이지 & 10개 행 표시
        cri.setKeyword("테스트");
        
        List<PostVO> list = mapper.searchGetList(cri);
        
        for(int i = 0; i < list.size(); i++) {
            System.out.println("list" + i + ".........." + list.get(i));
        }
	}*/
	@Test
	public void testGetFirstCommentUser() {
		log.info("");
		log.info("post3 first comment user: " + mapper.getFirstCommentUser(3L));
	}
	
	@Test
	public void testGetFirstComment() {
		log.info("post3 first comment" + mapper.getFirstComment(3L));
	}
}
