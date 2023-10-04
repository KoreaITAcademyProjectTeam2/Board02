package com.thread.service;

import java.util.List;

import com.thread.domain.UserVO;

public interface UserService {

	public UserVO userLogin(UserVO user) throws Exception;

	public void newUser(UserVO user);

	public List<UserVO> getList();

	public UserVO get(String user_email);

	public boolean modifyPassword(UserVO user);

	public boolean modifyUserName(UserVO user);

	public boolean remove(String user_email);

}