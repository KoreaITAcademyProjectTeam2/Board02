<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
  <meta name="viewport" content="width=device-width" />
  <title>myPage</title>
  <link rel="stylesheet" href="/resources/header.css">
  <link rel="stylesheet" href="/resources/styles/mypage.css">
  <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/nav.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/main.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/login.css" rel="stylesheet" type="text/css" />
  
</head>
<body>
<header>
  <div class="header-container">
    <div class="left_box">
      <span class="logo_box">
        <a href="/main">
        	<img src="">로고 들어가야함
        </a>
      </span>
    </div>
  </div>
</header>

	<div class="middle-container">
<span id = roundbox></span>
<span id = box>닉네임<br/><b>user1</b></span>
<span id = box>게시물 수<br/><b>100+</b></span>
<span id = box2></span>
<div id = moreInfo>
	<div>
	<form method="post" action="/modify">
      <input type = "submit" value = "회원정보 수정" class = "small_text" />
      </form>
      </div>
	<div>
	<form method="get" action="/withdrawal">
      <input type = "submit" value = "회원정보 탈퇴" class = "small_text" />
      </form>
      </div>
	<div>
	<a href="/logout" class="small_text">로그아웃</a>
      </div>	
</div>
</div>
<div class = "footer-container">
<div>
<div class="container">
	<div>글</div>
	<div>댓글</div>
	<div>좋아요</div>
</div>
<div id = box3>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
</div>
</div>
</div>
</body>
</html>