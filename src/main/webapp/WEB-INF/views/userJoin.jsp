<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="java.sql.*"
	import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />
<title>user Join</title>
<link href="/resources/styles/common.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/styles/login.css" rel="stylesheet"
	type="text/css" />
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

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
</script>


<script type="text/javascript">
	function pwd_Check() {
		let reg_pwd = /(?=.*[0-9a-zA-Z])(?=.*[#@$]).{5,7}/;
		alert(document.regForm.a_pwd.value);
		if (!reg_pwd.test(document.regForm.a_pwd.value)) {
			alert("비밀번호는 영,소문자 1개 대문자 1개 특수문자 #@$% 중 1개 길이 6~8글자로 해야합니다.");
			document.regForm.a_pwd.focus();
			return false; // prevent form submission
		}

		if (!(document.regForm.a_pwd.value).includes("${email}")) {
			alert("email이 포함된 패스워드 사용 금지");
			document.regForm.a_pwd.focus();
			return false; // prevent form submission
		}
		return true; // allow form submission
	}
</script>

</head>
<body>
	<div class="main-container">
		<header class="logo">
			<div>
				<img class="logoPicture" src="resources/img/logo_text.png"
					alt="인스타 로고" />
			</div>
		</header>
		<form id="user_Join" method="post">
			<div class="email-form">
				<input type="text" name="id" class="user_Join" placeholder="이메일" />
			</div>

			<div class="email-form">
				<input type="password" name="password" class="user_Join"
					placeholder="비밀번호" />
			</div>

			<div class="email-form">
				<input type="text" name="nickname" id = "nickname" class="user_Join_nickname" placeholder="닉네임" /> 
					<input type="button" class="confirm" value="중복확인" onclick = "nicknameCheck();">
			</div>
		</form>
		<c:if test="${result >= 1 }">
			<div class="login_warn">중복된 닉네임 입니다.</div>
		</c:if>

		<footer>
			<form method="post" action="/login">
				<input type="submit" value="회원가입" class="small_text" />
			</form>
		</footer>
	</div>

	<script>
		/* 중복확인 버튼 클릭 메서드 */
    function nicknameCheck() {
        var nickname = $('#nickname').val();
        $.ajax({
            url: 'nicknameCheck',
            type: 'post',
            data: { nickname: nickname },
            success: function(cnt) {
                if (cnt == 0) {
                    alert("사용 가능한 닉네임입니다.");
                } else {
                    alert("닉네임이 이미 사용 중입니다.");
                    $('#nickname').val('');
                }
            },
            error: function() {
                alert("에러입니다");
            }
        });
    };
</script>
</body>
</html>
