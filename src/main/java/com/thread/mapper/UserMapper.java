package com.thread.mapper;

import java.util.List;

import com.thread.domain.UserVO;

public interface UserMapper {

	/* 로그인 */
	public UserVO userLogin(UserVO user);

	public List<UserVO> getList();

	public UserVO get(String user_email);

	public void insert(UserVO user);

	public int update_user_password(UserVO user);

	public int update_user_name(UserVO user);

	public int delete(String user_email);

	/*
	 * public int nicknameCheck(String nickname);
	 */
}
