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
  
   <style>
   
  </style>

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
<% 
    // 세션에서 사용자 객체 가져오기
    com.thread.domain.UserVO loggedInUser = (com.thread.domain.UserVO)session.getAttribute("member"); 
%>

<span id="box">닉네임<br/><b><%= loggedInUser.getUser_name() %></b></span>
<span id="box">게시물 수<br/><b>${userPostCount}</b></span>
<span id = box2></span>
<div id = moreInfo>
	<div>
	<form method="post" action="/modify">
      <input type = "submit" value = "회원정보 수정" class = "small_text" />
      </form>
      </div>
	<div>
	<form method="post" action="/withdrawal">
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
	<div>게시글</div>
	<div>댓글</div>
</div>	

<div id="box3">
<!-- 늘어나기 -->
  <div id="scrolling-container" style="border: 1px solid white; float: left; width: 100%; height: auto;">
    <jsp:include page="./main.jsp" />
  </div>
</div>

<div id = box4>
<div style="border: 1px solid white; float: right; width: 0%;">
  </div>
</div>

</div>
</div>
</body>
</html>
<script>
  //게시글을 클릭했을 때 실행되는 함수
  function onFeedClick() {
    //feed_id와 feed-post-box를 보여줍니다.
    document.querySelectorAll('.feed_id, .feed-post-box').forEach(element => {
      element.style.display = 'block';
    });

    //feed_bottom와 feed_article를 숨깁니다.
    document.querySelectorAll('.feed_bottom, .feed_article').forEach(element => {
      element.style.display = 'none';
    });
  }

  //댓글을 클릭했을 때 실행되는 함수
  function onCommentClick() {
    // feed_id와 feed-post-box를 숨깁니다.
    document.querySelectorAll('.feed_id, .feed-post-box').forEach(element => {
      element.style.display = 'none';
    });

    //feed_bottom와 feed_article를 보여줍니다.
    document.querySelectorAll('.feed_bottom, .feed_article').forEach(element => {
      element.style.display = 'block';
    });
  }

  //"게시글" 클릭 이벤트를 추가
  document.querySelector('.container div:first-child').addEventListener('click', onFeedClick);

  //"댓글" 클릭 이벤트를 추가
  document.querySelector('.container div:last-child').addEventListener('click', onCommentClick);
  
   const scrollingContainer = document.getElementById("scrolling-container");
	scrollingContainer.addEventListener("scroll", () => {
 	scrollingContainer.style.height = scrollingContainer.scrollHeight + "px";
});

</script>
