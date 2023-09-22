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
    <title>user Join</title>
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
      <form method="post" action="/login">
        <input type="text" name="id" class="user_Join" placeholder="이메일" />
        <input type="submit" class="confirm" value="인증" /><p/>
        <input type="text" name="id" class="id" placeholder="이메일 인증 번호" />
        <input type="submit" class="confirm" value="확인" /><p/>
        <input type="password" name="password" class="password" placeholder="비밀번호" /><p/>
        <input type="password" name="password" class="password" placeholder="비밀번호 확인" />
        <input type="submit" class="confirm" value="확인" /><p/>
        <input type="password" name="nickname" placeholder="닉네임" />
    </form>
    
    <footer>
      <form method="post" action="/login">
      <input type = "submit" value = "회원가입" class = "small_text" />
      </form>
    </footer>
</div>
<!-- <script src="js/login.js"></script> -->
  </body>
</html>
