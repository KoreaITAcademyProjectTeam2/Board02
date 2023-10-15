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
		탈퇴 후에는 작성했던 게시글, 댓글 모두 자동 삭제되므로 신중히 선택 후 동의버튼을 눌러 탈퇴해주세요.<br/>
			<input type ="radio" name = "agree" value = "agree"><b>안내 사항을 모두 확인하였으며, 이에 동의합니다.</b>

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
		
		<form id="user_Join" method="post" action="main">
		<footer>
				<input type="submit" id = "submit" value="메인으로" class="small_text" />
				<div id="submit_message"></div>
		</footer>
		</form>
	</div>
	<script>
	
	function removeUser() {
    // 사용자가 동의했는지 확인합니다.
    if ($("input[name='agree']:checked").val() === 'agree') {
        if (window.confirm("탈퇴하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "/removeUser",
                success: function(response) {
                    if (response) {
                        alert("성공적으로 제거되었습니다!");
                        location.href = "/login"; // 제거 후 사용자를 리다이렉트하려는 위치
                    } else {
                        alert("제거 중 오류가 발생했습니다!");
                    }
                },
                error: function(error) {
                    alert("요청을 처리하는 중 오류가 발생했습니다.");
                }
            });
        }
    } else {
        alert("계속하기 전에 약관에 동의해주세요.");
    }
}
	
	
	
	
	</script>
</body>
</html>