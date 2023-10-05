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
		user.setUser_email("user7@example.com");
		user.setUser_name("qkqh");
		user.setUser_password("12345");

		service.newUser(user);

		log.info("회원 생성: " + user.getUser_email());
		log.info("닉네임 생성 : " + user.getUser_name());
		log.info("비밀번호 생성 : " + user.getUser_password());
	}

	@Test
	public void testGet() {
		log.info(service.get("user2@example.com"));
	}

	@Test
	public void testModifyPassword() {
		UserVO user = service.get("test3@example.com");

		log.info("modify..." + user);
		user.setUser_password("password6");
		log.info("modify result..." + service.modifyPassword(user));
	}

	@Test
	public void testModifyUserName() {
		UserVO user = service.get("user6@example.com");

		log.info("modify..." + user);
		user.setUser_name("6 유저");
		log.info("modify result..." + service.modifyUserName(user));
	}

	@Test
	public void testRemove() {
		UserVO user = service.get("user6@example.com");

		log.info("remove..." + user);
		user.setUser_email("여섯번째 유저");
		log.info("remove result..." + service.remove("user6@example.com"));
	}

	@Test
	public void testNickNameCheck() {
		if (service.nicknameCheck("rlafdldfsa") >= 1) {
			log.info("중복되었습니다.");
		} else {
			log.info("사용할 수 있습니다.");
		}

	}

}
