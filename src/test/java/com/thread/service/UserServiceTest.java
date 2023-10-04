package com.thread.service;

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
public class UserServiceTest {

	@Setter(onMethod_ = { @Autowired })
	private UserService service;

	@Test
	public void testExist() {

		log.info("------------------------");
		log.info(service);
	}

	/*
	 * @Test public void testNewUser() { UserVO user = new UserVO();
	 * user.setUser_email("user1@example.com");
	 * 
	 * service.newUser(user);
	 * 
	 * log.info("회원 생성: " + user.getUser_email()); }
	 */

	@Test
	public void testGet() {
		log.info(service.get("user2@example.com"));
	}

	@Test
	public void testModifyPassword() {
		UserVO user = service.get("user5@example.com");

		log.info("modify..." + user);
		user.setUser_password("pwd05");
		log.info("modify result..." + service.modifyPassword(user));
	}

	@Test
	public void testModifyUserName() {
		UserVO user = service.get("user5@example.com");

		log.info("modify..." + user);
		user.setUser_name("다섯번째 유저");
		log.info("modify result..." + service.modifyUserName(user));
	}

	@Test
	public void testRemove() {
		UserVO user = service.get("user5@example.com");

		log.info("remove..." + user);
		user.setUser_email("다섯번째 유저");
		log.info("remove result..." + service.remove("user5@example.com"));
	}

}