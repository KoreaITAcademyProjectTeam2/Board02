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
<!--   잠시 보류
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
function emailCheck(email){
	frm = document.regFrm;
	if(email == "") {
		alert("email을 입력해 주세요.");
		frm.email.focus();
		return;
	}
	url = "emailCheck.jsp?email=" + email;
	window.open(url, "EmailCheck", "width=300,height=150");
}
</script> -->

<script type="text/javascript">
   function pwd_Check(){
      let reg_pwd = /(?=.*[0-9a-zA-Z])(?=.*[#@$]).{5,7}/;
      alert(document.regForm.a_pwd.value);
      if(!reg_pwd.test(document.regForm.a_pwd.value)){
         alert("비밀번호는 영,소문자 1개 대문자 1개 특수문자 #@$% 중 1개 길이 6~8글자로 해야합니다.");
         document.regForm.a_pwd.focus();
         return false;  // prevent form submission
      }

      if(!(document.regForm.a_pwd.value).includes("${email}")){
         alert("email이 포함된 패스워드 사용 금지");
         document.regForm.a_pwd.focus();
         return false;  // prevent form submission
      }
      return true; // allow form submission
   }
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
      		<input type="text" name="id" class="user_Join" placeholder="이메일" />
      	</div>
        
       <div class="email-form">
       		<input type="password" name="password" class="user_Join" placeholder="비밀번호" />
       </div>

        <div class="email-form">
        	<input type="password" name="nickname" class="user_Join" placeholder="닉네임" />
        </div>
        </form>
    
    <footer>
      <form method="post" action="/login">
      <input type = "submit" value = "회원가입" class = "small_text" />
      </form>
    </footer>
</div>
  </body>
</html>
