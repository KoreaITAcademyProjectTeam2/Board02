package com.thread.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thread.domain.LikeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LikeMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private LikeMapper mapper;
	
	@Test
	public void testLike() {
		LikeVO like = new LikeVO();
		like.setPost_like_id(4L);
		like.setUser_like_email("test1@example.com");
		
		mapper.LikePost(like);
	}
	
	@Test
	public void testDislike() {
		LikeVO like = new LikeVO();
		like.setPost_like_id(4L);
	}
	
	@Test
	public void testLikeNumbers() {
		log.info("like 갯수: " + mapper.likeNumbers(4L));
		
	}
}
