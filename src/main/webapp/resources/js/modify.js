$(document).ready(function() {
    var isPasswordMatching = false;
    
    $('#password').on('keyup', checkCurrentPassword);
    $('#newPassword').on('focus', clearCurrentPasswordMessageIfMatching)
                      .on('keyup', validateNewPassword);
    $('#confirmPassword').on('keyup', confirmNewPassword);
    $('#password, #newPassword, #confirmPassword').on('input', clearUserNameMessage);
    $('#password, #newPassword, #confirmPassword').on('input', clearPasswordChangeMessage);
    $('#user_name').on('input', clearPasswordMessages);
});

function setMessage(element, message, color) {
    $(element).text(message).css('color', color || 'black');
}

function clearPasswordChangeMessage() {
    $("#password_change_message").text("");
}


function checkCurrentPassword() {
    var password = $('#password').val();
    
    $.ajax({
        type: "POST",
        url: "/checkCurrentPassword",
        data: { password: password },
        success: function(data) {
            isPasswordMatching = data;
            if(data) {
                setMessage("#password_message", "현재 비밀번호가 일치합니다.", 'green');
            } else {
                setMessage("#password_message", "현재 비밀번호가 일치하지 않습니다.", 'red');
            }
        },
        error: function() {
            setMessage("#password_message", "비밀번호 확인 중 오류가 발생했습니다.", 'red');
        }
    });
}

function clearCurrentPasswordMessageIfMatching() {
    if(isPasswordMatching) {
        $("#password_message").text("");
    }
}


function validateNewPassword() {
    var newPassword = $('#newPassword').val();
    var confirmPassword = $('#confirmPassword').val();
    
    if (/\s/.test(newPassword)) {
        setMessage("#newPassword_message", "공백을 사용할 수 없습니다.", 'red');
    } else {
        $("#newPassword_message").text("");
    }
    
    if (confirmPassword) {
        if (newPassword !== confirmPassword) {
            setMessage("#password_confirm_message", "비밀번호가 일치하지 않습니다.", 'red');
        } else {
            setMessage("#password_confirm_message", "비밀번호가 일치합니다.", 'green');
        }
    }
}

$('#newPassword').on('keyup', validateNewPassword);

function confirmNewPassword() {
    var newPassword = $('#newPassword').val();
    var confirmPassword = $('#confirmPassword').val();

    if (newPassword === confirmPassword) {
        setMessage("#password_confirm_message", "비밀번호가 일치합니다.", 'green');
    } else {
        setMessage("#password_confirm_message", "비밀번호가 일치하지 않습니다.", 'red');
    }
}

function clearPasswordMessages() {
    $("#password_message, #newPassword_message, #password_confirm_message, #password_change_message").text("");
}

function clearUserNameMessage() {
    $("#modify_username_message").text("");
}

function modifyPassword() {
	clearPasswordMessages();
	
    var currentPassword = $('#password').val();
    var newPassword = $('#newPassword').val();
    var confirmPassword = $('#confirmPassword').val();
   
    
    if (!currentPassword || !newPassword || !confirmPassword) {
        setMessage("#password_change_message", "모든 필드를 입력하세요.", 'red');
        return;
    }
     
    if (!isPasswordMatching) {
        setMessage("#password_change_message", "현재 비밀번호를 확인해주세요", 'red');
        return;
    }
    
    $("#password_confirm_message").text("");

    if(newPassword !== confirmPassword) {
        setMessage("#password_change_message", "비밀번호가 일치하지 않습니다.", 'red');
        return;
    }

    $.ajax({
        type: "POST",
        url: "/updateUserPassword",
        data: { currentPassword: currentPassword, newPassword: newPassword },
        success: function(response) {
            if(response) {
                setMessage("#password_change_message", "비밀번호가 변경되었습니다.", 'green');
            } else {
                setMessage("#password_change_message", "비밀번호 변경 시 오류가 발생했습니다. 다시 시도하세요.", 'red');
            }
        },
        error: function() {
            setMessage("#password_change_message", "비밀번호 변경 중 오류가 발생했습니다.", 'red');
        }
    });
}

function modifyUserName() {
    clearPasswordMessages();

    var newUserName = $('#user_name').val();
    var noSpecialChars = /^[가-힣a-zA-Z0-9]*$/;
    
    if (!newUserName) {
        setMessage("#modify_username_message", "새 닉네임을 입력하세요.", 'red');
        return;
    }
    if (!noSpecialChars.test(newUserName)) {
        setMessage("#modify_username_message", "사용할 수 없는 닉네임입니다.", 'red');
        return;
    }

    $.ajax({
        type: "POST",
        url: "/nicknameCheck",
        data: { user_name: newUserName },
        success: function(cnt) {
        
    console.log(cnt);
            if (cnt >= 1) {
                setMessage("#modify_username_message", "중복된 닉네임입니다.", 'red');
                $('#user_name').val('');
            } else {
                $.ajax({
                    type: "POST",
                    url: "/updateUserName",
                    data: { user_name: newUserName },
                    success: function(response) {
                    console.log("response " + response);
                        if(response) {
                            setMessage("#modify_username_message", "닉네임이 성공적으로 변경되었습니다.", 'green');
                        } else {
                            setMessage("#modify_username_message", "중복된 닉네임입니다. 다시 시도하세요.", 'red');
                        }
                    },
                    error: function() {
                        setMessage("#modify_username_message", "닉네임 변경 중 오류가 발생했습니다. 다시 시도하세요.", 'red');
                    }
                });
            }
        },
        error: function() {
            setMessage("#modify_username_message", "닉네임 중복 확인 중 오류가 발생했습니다. 다시 시도하세요.", 'red');
        }
    });
}
