<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="java.sql.*"
	import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>modify</title>
    <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/styles/login.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous">
    </script>
</head>

<body>
    <div class="main-container">
        <header class="logo">
            <div class="withdrawal_Message">회원정보 수정</div>
        </header>
        <form id="user_Join" method="post">
            <!-- Password Sections -->
            <div class="email-form">
                <input type="password" name="password" id="password" class="user_Login" placeholder="현재 비밀번호" />
            </div>
            <div id="password_message"></div>

            <div class="email-form">
                <input type="password" name="password" id="newPassword" class="user_Login" placeholder="새 비밀번호" />
            </div>
            <div id="newPassword_message"></div>

            <div class="email-form">
                <input type="password" name="password" id="confirmPassword" class="user_Login" placeholder="비밀번호 확인" />
            </div>
            <div id="password_confirm_message"></div>

            <input type="button" class="change" value="비밀번호 변경" onclick="modifyPassword();">
            <div id="password_change_message"></div>
            <br/>

            <!-- Nickname Sections -->
            <div class="email-form">
                <input type="text" name="user_name" id="user_name" class="user_Login" placeholder="닉네임" />
            </div>
            <input type="button" class="change" value="닉네임 변경" onclick="modifyUserName();">
            <div id="modify_username_message"></div>
        </form>
    </div>
    
    <script src="/resources/js/modify.js"></script> <!-- External JavaScript for a cleaner structure -->

</body>
</html>