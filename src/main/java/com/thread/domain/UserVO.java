package com.thread.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private String user_email;
	private String user_pwd;
	private String user_name;
	private Date user_signin_date;
}
