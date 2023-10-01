package com.thread.mapper;

import java.util.List;

import com.thread.domain.UserVO;

public interface UserMapper {

	public List<UserVO> getList();

	public UserVO get(String user_email);

	public void insert(UserVO user);

	public int update_pwd(UserVO user);

	public int update_user_name(UserVO user);

	public int delete(String user_email);

}
