package com.thread.mapper;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> f2912afb812be2a54089616773531c8fb800dc16
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

}
