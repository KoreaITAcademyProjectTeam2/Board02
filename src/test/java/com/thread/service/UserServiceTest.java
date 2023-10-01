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

	@Test
	public void testNewUser() {
		UserVO user = new UserVO();
		user.setUser_email("user1@example.com");

		service.newUser(user);

		log.info("회원 생성: " + user.getUser_email());
	}

	@Test
	public void testGet() {
		log.info(service.get(""));
	}

	@Test
	public void testModifyPwd() {
		UserVO user = service.get("");

		log.info("modify..." + user);
		user.setUser_pwd("서비스 테스트에서 수정한 내용.");
		log.info("modify result..." + service.modifyPwd(user));
	}

	@Test
	public void testModifyUserName() {
		UserVO user = service.get("");

		log.info("modify..." + user);
		user.setUser_name("서비스 테스트에서 수정한 내용.");
		log.info("modify result..." + service.modifyUserName(user));
	}

}
