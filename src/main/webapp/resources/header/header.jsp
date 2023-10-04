<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/header.css">
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
<header>
  <div class="header-container">
    
    <div class="left_box">
      <span class="logo_box">
        <a href="/main">
        	<img src="">로고 들어가야함
        </a>
        </span>
    </div>


    <!-- 내가 고친부분 -->
    <div class="search_box">
      <form class="search-form" action="">
          <input type="search" class="search-input" placeholder="   🔎 검색">
          <button type="submit" class="search-btn">button</button>
      </form>
    </div>

    <div class="right_box">
      <span class="home_box">
        <a href="/main" class="header_button">
        	<img class="home" src="/resources/img/home.png" alt="탐색" />
        </a>
      </span>
<!-- 
      <span class="direct_box" >
        <a href="message.html" class="header_button">
          <img class="direct" src="/resources/img/direct.png" alt="메세지" />
        </a>
      </span>
 -->
      <span class="compass_box">
        <a href="/main/newPost" class="header_button">
          <img src="/resources/img/chat-box.png"
            alt="새 글쓰기" />
        </a>
      </span>
      
      <span class="myPage">
     	 <a href="/myPage">
      	  	<img class="myPage" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/profile.png" 
      	  	alt="마이페이지" />
         </a>
      </span>

    </div>
  </div>
</header>
  
  <!--/header-->