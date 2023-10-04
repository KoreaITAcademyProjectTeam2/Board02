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
	
	/* 로그인 */
    @Override
    public UserVO userLogin(UserVO user) throws Exception {
        
        return usermapper.userLogin(user);
    }

    
    /*
	@Transactional
	@Override
	public void newUser(UserVO user) {
		log.info("new User..." + user);
		mapper.insert(user);
	}

	@Override
	public List<UserVO> getList() {
		log.info("getList...");
		return mapper.getList();
	}

	@Override
	public UserVO get(String user_email) {
		log.info("get...");
		return mapper.get(user_email);
	}

	@Transactional
	@Override
	public boolean modifyPassword(UserVO user) {
		log.info("modifyPassword... : " + user);
		boolean modifyResult = mapper.update_user_password(user) == 1;
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean modifyUserName(UserVO user) {
		log.info("modifyUserName... : " + user);
		boolean modifyResult = mapper.update_user_name(user) == 1;
		return modifyResult;
	}

	@Override
	public boolean remove(String user_email) {

		return mapper.delete(user_email) == 1;
	}
*/
}