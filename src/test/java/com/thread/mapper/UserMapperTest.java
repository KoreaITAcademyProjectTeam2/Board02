package com.thread.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thread.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Test
	public void testInsert() {

		UserVO user = new UserVO();
		user.setUser_email("user5@example.com");
		user.setUser_pwd("password5");
		user.setUser_name("username5");

		mapper.insert(user);
		log.info(user);
	}

	@Test
	public void testGet() {
		mapper.get("");
	}

	@Test
	public void testGetList() {
		mapper.getList();
	}

}