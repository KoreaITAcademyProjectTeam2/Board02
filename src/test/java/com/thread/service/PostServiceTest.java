package com.thread.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thread.domain.PostVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PostServiceTest {
	
	@Setter(onMethod_ = { @Autowired })
	private PostService service;
	
	@Test
	public void testExist() {

		log.info("------------------------");
		log.info(service);
	}
	
	@Test
	public void testNewPost() {
		PostVO post = new PostVO();
		post.setPost_user_email("user1@example.com");
		post.setPost_content("서비스 테스트 내용.");
		
		service.newPost(post);
		
		log.info("게시글 생성: " + post.getPost_id());
	}
	
	@Test
	public void testGet() {
		log.info(service.get(7L));
	}
	
	@Test
	public void testModify() {
		PostVO post = service.get(7L);
		
		log.info("modify..." + post);
		post.setPost_content("서비스 테스트에서 수정한 내용.");
		log.info("modify result..." + service.modify(post));
	}
}
