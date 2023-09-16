package com.thread.domain;

import lombok.Data;

import java.util.Date;

@Data
public class UserVO {
    private String user_email;
    private String user_password;
    private String user_name;
    private Date user_signin_date;
}
