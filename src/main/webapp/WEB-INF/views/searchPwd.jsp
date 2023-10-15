<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session ="true"
    import="java.sql.*"
    %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
  <head>
  <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>user Join</title>
    <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/styles/login.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
   
</script>

</head>
  <body>
    <div class="main-container">
      <header class="logo">
        <div>
          <img class="logoPicture" src="resources/img/logo_text.png" alt="인스타 로고" />
        </div>
      </header>
      <form>
      	<div class="email-form">
      		<input type="text" name="user_email" class="email" placeholder="이메일" />
      	</div>
   
    
    <footer>
      <form method="post" action="/login">
      <input type = "submit" value = "인증하기" class = "small_text" />
      </form>
    </footer>
</div>
  </body>
</html>
