<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="java.sql.*"
	import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />
<title>user Join</title>
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
			<div>
				<img class="logoPicture" src="resources/img/logo_text.png" alt="인스타 로고" />
			</div>
		</header>
		<form id = "user_Join" method="post" action="/registerUser">
			<div class="email-form">
				<input type="text" name="user_email" id="user_email" class="user_Join" placeholder="이메일" />
			</div>
			<div id="email_message"></div>

			<div class="email-form">
				<input type="password" name="user_password" id = "password" class="user_Join" placeholder="비밀번호" />
			</div>
			<div id="password_message"></div>

			<div class="email-form">
				<input type="text" name="user_name" id="user_name" class="user_Join_nickname" placeholder="닉네임" /> 
				<input type="button" class="confirm" value="중복확인" onclick="nicknameCheck();">

			</div>
			<div id="user_name_message"></div>

		<footer>
				<input type="submit" id = "submit" value="회원가입" class="small_text" />
				<div id="submit_message"></div>
		</footer>
		</form>
	</div>

	<script>
	
	var nicknameVerified = false;
	
	$(document).ready(function() {
		$('#user_email').on('blur', function() {
	        var user_email = $(this).val();
	        var message = $("#email_message");

	        $.ajax({
	            url: 'emailCheck',
	            type: 'post',
	            data: { user_email: user_email },
	            success: function(ecnt) {
	                if (ecnt >= 1) {
	                    message.text("이미 사용 중인 이메일입니다.");
	                    $('#user_email').val('');
	                } else {
	                    message.text("");
	                }
	            },
	            error: function() {
	                message.text("에러입니다");
	            }
	        });
	    });
		
	    $('#password').on('keyup', function() {
	        var password = $(this).val();
	        var message = $("#password_message");
	        
	        if (/\s/.test(password)) {
	            message.text("공백을 사용할 수 없습니다.");
	        } else {
	            message.text("");
	        }
	    });
	    $('#user_Join').on('submit', function(e) {
	        var email = $('#user_email').val().trim();
	        var password = $('#password').val().trim();
	        var nickname = $('#user_name').val().trim();
	        var message = $("#submit_message");
	        
	        if(!nicknameVerified) { // 중복 확인 플래그 체크
	            message.text("닉네임 중복 확인을 해주세요.");
	            e.preventDefault();
	            
	            return false;
	        }

	        if(!email || !password || !nickname) {
	            message.text("모든 필드를 입력해주세요.");
	            e.preventDefault(); // 폼 제출 방지
	            return false;
	        }
	    });

	});
	
		/* 중복확인 버튼 클릭 메서드 */
    function nicknameCheck() {
        var user_name = $('#user_name').val();
        var message = $("#user_name_message");

        $.ajax({
            url: 'nicknameCheck',
            type: 'post',
            data: { user_name: user_name },
            success: function(cnt) {
            	var noSpecialChars = /^[가-힣a-zA-Z0-9]*$/;
            	
                if (cnt >= 1) {
                	message.text("중복된 닉네임입니다.");
                    $('#user_name').val('');
                    nicknameVerified = false;
                    
                } else if(user_name == "" || !noSpecialChars.test(user_name)){
                	message.text("사용할 수 없는 닉네임입니다.");
                	nicknameVerified = false;
                    
                }else {
                	message.text("사용 가능한 닉네임입니다.");
                	nicknameVerified = true;
                }
            },
            error: function() {
            	message.text("에러입니다");
            	nicknameVerified = false;
            }
        });
    };
</script>
</body>
</html>
