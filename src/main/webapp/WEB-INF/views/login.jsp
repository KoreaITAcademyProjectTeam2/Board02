<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session ="true"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
  <head>
  <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>login</title>
    
    <!-- jquery버튼추가 -->
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

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
      
      <% if(request.getAttribute("success") != null) { %>
    <p class="success_message"><%= request.getAttribute("success") %></p>
<% } %>

      <form id="login_form" class="login-container" method="post" action="/main">
      <div class="email-form">
        <input type="text" class="user_Login" name="user_email" placeholder="아이디" />
        </div>
        <input type="password" class="user_Login" name="user_password" placeholder="비밀번호" />

        <input type="submit" class="loginBtn" value="로그인" id="login_check_input_box_false"/>
      <!-- <input class="login_check_input" disabled="disabled"> -->  
           <c:if test = "${result == 0 }">
             <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
     </c:if>
    </form>
</div>

<div class="user-container">
  <form method="post" action="/userJoin">
    <span>계정이 없으신가요?</span>
    <input type="submit" class="user" value="회원가입" />
  </form>
</div>

<script>
    /* 로그인 버튼 클릭 메서드 */
    $(".loginBtn").click(function(){
        
        /* alert("로그인 버튼 작동"); */
        
        /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/login");
        $("#login_form").submit();
        
    });
</script>

<!-- <script src="js/login.js"></script> -->
  </body>
</html>

