package com.thread.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thread.domain.UserVO;
import com.thread.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper usermapper;

	@Override
	public UserVO userLogin(UserVO user) throws Exception {

		return usermapper.userLogin(user);
	}

	@Transactional
	@Override
	public void newUser(UserVO user) {
		log.info("new User..." + user);
		usermapper.insert(user);
	}

	@Override
	public List<UserVO> getList() {
		log.info("getList...");
		return usermapper.getList();
	}

	@Override
	public UserVO get(String user_email) {
		log.info("get...");
		return usermapper.get(user_email);
	}

	@Transactional
	@Override
	public boolean modifyPassword(UserVO user) {
		log.info("modifyPassword... : " + user);
		boolean modifyResult = usermapper.update_user_password(user) == 1;
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean modifyUserName(UserVO user) {
		log.info("modifyUserName... : " + user);
		boolean modifyResult = usermapper.update_user_name(user) == 1;
		return modifyResult;
	}

	@Override
	public boolean remove(String user_email) {

		return usermapper.delete(user_email) == 1;
	}

	@Override
	public Integer nicknameCheck(String user_name) {
		Integer cnt = usermapper.nicknameCheck(user_name);
		log.info("cnt: " + cnt);
		return cnt;
	}

	@Override
	public Integer emailCheck(String user_email) {
		Integer ecnt = usermapper.emailCheck(user_email);
		log.info("ecnt: " + ecnt);
		return ecnt;
	}

}
