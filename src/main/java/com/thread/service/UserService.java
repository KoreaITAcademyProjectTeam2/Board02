package com.thread.service;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> f2912afb812be2a54089616773531c8fb800dc16
import com.thread.domain.UserVO;

public interface UserService {
	
	 /* 로그인 */
    public UserVO userLogin(UserVO user) throws Exception;

	public void newUser(UserVO user);

	public List<UserVO> getList();

	public UserVO get(String user_email);

	public boolean modifyPassword(UserVO user);

	public boolean modifyUserName(UserVO user);

	public boolean remove(String user_email);
}