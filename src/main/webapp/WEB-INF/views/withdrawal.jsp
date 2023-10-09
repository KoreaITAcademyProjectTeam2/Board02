<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="java.sql.*"
	import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />
<title>withdrawal</title>
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
			<div class = "withdrawal_Message">회원정보 탈퇴</div>
		</header>
		
		<div class = "withdrawal_Main_Message">
		사용하고 계신 이메일(user_email)은 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br/>
		탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br/>
		탈퇴 후에는 이메일(user_email)로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br/>
		게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br/>
			<input type ="radio" name = "agree" value = "agree">안내 사항을 모두 확인하였으며, 이에 동의합니다.

		</div>
		
		<footer>
		<form id="user_Join" method="post">
			<!-- <div class="email-form">
				<input type="password" name="password" id = "password" class="user_Join" placeholder="비밀번호" />
			</div> -->
			<div id="password_message"></div>
			<input type="button" class="withdrawalBtn" value="회원탈퇴" onclick = "removeUser();"/>
		</form>
		</footer>
	</div>
	<!-- <script>
		function removeUser() {
			if(window.confirm("탈퇴하시겠습니까?")){
				location.href="/withdrawal"
			}
		} -->
	
	
	
	</script>
</body>
</html>