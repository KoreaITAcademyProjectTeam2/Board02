<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/resources/header/header.jsp"%>
<%@ include file="/resources/header/aside.jsp"%>

<head>
  <meta name="viewport" content="width=device-width" />
  <title>main-page</title>
  <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/nav.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/body.css" rel="stylesheet" type="text/css" /> 
</head>

<body>

  <!--body-->
	<div class='none'></div>
   
  <div class="main_body">
    <article>
      <!-- <div class="story">
        게시글 추가
        <form action="/newPost" method="post" id="">
            <input type="textarea">
        </form>
      </div> -->
      <div class="feed-container">
	      <form class="feed" action="/main/newPost" method="POST">
	
	        <a href="/main" class="feed_picture">
	          <p>이미지 등 게시글 내용</p>
	        </a>
	        <textarea rows="5" cols=50 name='content' placeholder="글 작성"></textarea>
	        <!--feedbottom-->
	        <div class="feed_bottom">
	          <div class="emoticon_box">
	            <button class="buttonBox" type="submit">게시</button>
	          </div>
	        </div>
	        <!--/feedbottom-->
	      </form>
      </div>

    </article>

  </div>

</body>