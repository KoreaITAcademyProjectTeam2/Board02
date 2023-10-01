package com.thread.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private String user_email;
	private String user_password;
	private String user_name;
	private Date user_add_date;
}
