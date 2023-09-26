<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session ="true"
    %>
    
<!DOCTYPE html>
<html>
  <head>
  <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>login</title>
    <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/styles/login.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div class="main-container">
      <header class="logo">
        <div>
          <img class="logoPicture" src="resources/img/logo_text.png" alt="인스타 로고" />
        </div>
      </header>
      <form class="login-container" method="post" action="/main">
      <div class="email-form">
        <input type="text" name="id" placeholder="이메일" />
        </div>
        <input type="password" name="password" placeholder="비밀번호" />
        <input type="submit" class="loginBtn" value="로그인" />
    </form>
    
    <footer>
      <form method="post" action="password_check.html">
      <input type = "submit" value = "비밀번호를 잊으셨나요?" name = "pwd_check" class = "small_text" />
		</form>
    </footer>
</div>

<div class="user-container">
  <form method="post" action="/userJoin">
    <span>계정이 없으신가요?</span>
    <input type="submit" class="user" value="회원가입" />
  </form>
</div>
<!-- <script src="js/login.js"></script> -->
  </body>
</html>

