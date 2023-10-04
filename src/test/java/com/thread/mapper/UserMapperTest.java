package com.thread.mapper;

import org.apache.ibatis.annotations.Mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.Mapping;

import com.thread.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {

	@Autowired
	private UserMapper usermapper;

	/* 로그인 쿼리 mapper 메서드 테스트 */
    @Test
    public void userLogin() throws Exception{
        
        UserVO user = new UserVO();    // UserVO 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 */
        user.setUser_email("test1@example.com");
        user.setUser_password("password1");
        
        /* 올바른 않은 아이디 비번 입력경우 */
        //member.setMemberId("test1123");
        //member.setMemberPw("test1321321");
        
        usermapper.userLogin(user);
        System.out.println("결과 값 : " + usermapper.userLogin(user));
        
    }
}




