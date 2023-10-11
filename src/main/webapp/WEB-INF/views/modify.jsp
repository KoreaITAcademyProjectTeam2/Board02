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
			<div class = "withdrawal_Message">회원정보 수정</div>
		</header>
		<form id="user_Join" method="post">
			
			<div class="email-form">
				<input type="password" name="password" id="password"
					class="user_Login" placeholder="현재 비밀번호" />
			</div>
			<div id="password_message"></div>
			
			<div class="email-form">
				<input type="password" name="password" id="newPassword"
					class="user_Login" placeholder="새 비밀번호" />
			</div>
			<div id="newPassword_message"></div>

			<div class="email-form">
				<input type="password" name="password" id="confirmPassword"
					class="user_Login" placeholder="비밀번호 확인" />
			</div>
			<div id="password_confirm_message"></div>

			<input type="button" class="change" value="비밀번호 변경" onclick="modifyPassword();">
			
			<div id="password_change_message"></div>
			<br/>
			
			<div class="email-form">
				<input type="text" name="user_name" id="user_name" class="user_Login" placeholder="닉네임" />
			</div>
			

			<input type="button" class="change" value="닉네임 변경" onclick="modifyUserName();">
			
			<div id="modify_username_message"></div>
			
			
		</form>
	</div>
	
<script>
$(document).ready(function() {
	var isPasswordMatching = false;
	
    $('#password').on('keyup', function() {
        var password = $(this).val();
        var message = $("#password_message");
        
        // AJAX를 사용하여 현재 비밀번호 일치 여부를 검사
        $.ajax({
            type: "POST",
            url: "/checkCurrentPassword",
            data: { password: password },
            success: function(data) {
                if(data) {
                	isPasswordMatching = true;
                    message.text("현재 비밀번호가 일치합니다.");
                    message.css('color', 'green');
                } else {
                	isPasswordMatching = false;
                    message.text("현재 비밀번호가 일치하지 않습니다.");
                    message.css('color', 'red');
                }
            },
            error: function(error) {
                console.error("Error:", error);
                message.text("비밀번호 확인 중 오류가 발생했습니다.");
            }
        });
    });
    
    $('#newPassword').on('focus', function() {
        if(isPasswordMatching) {
            $("#password_message").text("");
        }
    });
    
    $('#newPassword').on('keyup', function() {
        var password = $(this).val();
        var message = $("#newPassword_message");
        
        if (/\s/.test(password)) {
            message.text("공백을 사용할 수 없습니다.");
        } else {
            message.text("");
        }
    });
    $('#confirmPassword').on('keyup', function() {
        var newPassword = $('#newPassword').val();
        var confirmPassword = $(this).val();
        var message = $("#password_confirm_message");
        
        if(newPassword === confirmPassword) {
            message.text("비밀번호가 일치합니다.");
            message.css('color', 'green');
        } else {
            message.text("비밀번호가 일치하지 않습니다.");
            message.css('color', 'red');
        }
    });
    
    $('#password, #newPassword, #confirmPassword').on('keyup', function() {
        $("#password_change_message").text("");
    });
    
    $('#newPassword, #confirmPassword').on('keyup', function() {
        var newPassword = $('#newPassword').val();
        var confirmPassword = $('#confirmPassword').val();
        var confirmPasswordMessage = $("#confirmPassword_message");

        // 새 비밀번호와 비밀번호 확인이 일치하는 경우
        if (newPassword && confirmPassword && newPassword === confirmPassword) {
            confirmPasswordMessage.text("비밀번호가 일치합니다.").css('color', 'green');
        } else {
            confirmPasswordMessage.text("");  // 메시지 숨기기
        }
    });

    // 새 비밀번호 입력 필드에 추가 입력이 발생할 때 메시지 클리어
    $('#newPassword').on('keyup', function() {
        $("#confirmPassword_message").text("");  // 메시지 숨기기
    });

});


function modifyPassword() {
    var currentPassword = $('#password').val();
    var newPassword = $('#newPassword').val();
    var confirmPassword = $('#confirmPassword').val();
    var message = $("#password_change_message");
    
    $("#confirmPassword_message").text("");

    if(newPassword !== confirmPassword) {
        message.text("비밀번호가 일치하지 않습니다.");
        message.css('color', 'red');
        return;
    }

    // AJAX 요청을 사용하여 서버에 비밀번호 변경 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "/updateUserPassword",  // 해당 URL을 서버에서 처리해야 합니다.
        data: { 
            currentPassword: currentPassword, 
            newPassword: newPassword 
        },
        success: function(response) {
            if(response) {
                message.text("비밀번호가 변경되었습니다.");
                message.css('color','green');
            } else {
                message.text("현재 비밀번호를 다시 확인해주세요.");
            }
        },
        error: function(error) {
            console.error("Error:", error);
            message.text("비밀번호 변경 중 오류가 발생했습니다.");
        }
    });
}




    function modifyUserName() {
        var newUserName = $('#user_name').val();
        var message = $("#modify_username_message");
        var noSpecialChars = /^[가-힣a-zA-Z0-9]*$/;
        
        // 사용자 이름이 비어 있지 않은지 확인
        if (!newUserName) {
            message.text("새 닉네임을 입력하세요.");
            return;
        }

        // 특수 문자 확인
        if (!noSpecialChars.test(newUserName)) {
            message.text("사용할 수 없는 닉네임입니다.");
            return;
        }

        // 중복 확인
        $.ajax({
            type: "POST",
            url: "/nicknameCheck",
            data: { user_name: newUserName },
            success: function(cnt) {
                if (cnt >= 1) {
                    message.text("중복된 닉네임입니다.");
                    $('#user_name').val('');
                } else {
                    // 중복되지 않은 경우, 닉네임 업데이트 수행
                    $.ajax({
                        type: "POST",
                        url: "/updateUserName",
                        data: { user_name: newUserName },
                        success: function(response) {
                            if(response) {
                                message.text("닉네임이 성공적으로 변경되었습니다.");
                            } else {
                                message.text("닉네임 변경 중 오류가 발생했습니다. 다시 시도하세요.");
                            }
                        },
                        error: function(error) {
                            console.error("Error:", error);
                            message.text("닉네임 변경 중 오류가 발생했습니다. 다시 시도하세요.");
                        }
                    });
                }
            },
            error: function(error) {
                console.error("Error:", error);
                message.text("닉네임 중복 확인 중 오류가 발생했습니다. 다시 시도하세요.");
            }
        });
    }
</script>



</body>
</html>