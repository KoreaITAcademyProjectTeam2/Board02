<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="./header.jsp"%>

<head>
  <meta name="viewport" content="width=device-width" />
  <title>main-page</title>
  <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/nav.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/body.css" rel="stylesheet" type="text/css" /> 
</head>

<body>

  <!--body-->
  <div id="container">

  </div>
  <div class="none"></div>
  
  <div class="main_body">
    <div class="right-none"></div>
    <article>
      <div class="story">
        게시글 추가
        <form action="/newPost" method="post" id="">
            <input type="textarea">
        </form>
      </div>
      
      <div class="feed">
        <div class="feed_id">
          <div class="id_round">
            <div class="id_box">
              <div class="id_box_img">
                (profile_img)
              </div>
              <div class="id_container">
                <div class="id_name">USER_NAME</div>
              </div>
            </div>
          </div>
        </div>

        <div class="feed_picture">
          <p>이미지 등 게시글 내용</p>
        </div>
        <!--feedbottom-->
        <div class="feed_bottom">
          <div class="emoticon_box">
            <div class="emoticon_box2">
              <div class="heart_box">
                <img class="heart" src="/resources/img/heart.png" alt="좋아요 이미지">
              </div>
            </div>

          </div>
        </div>
        <!--/feedbottom-->

        <div class="feed_article">
          <div class="feed_article_box">

            <div class="comments1_box">
              <div class="comments"><span>아이디1 </span>댓글1</div>
              <div class="comments"><span>아이디1 </span>댓글1</div>
              <div class="comments"><span>아이디1 </span>댓글1</div>
            </div>
            <div class="new_comments">
            </div>
          </div>
        </div>
        <div class="inputContainer"> 
          <div class="type_comment">
            <input class="inputBox" type="text" placeholder="댓글 작성...">
          </div>
          <span>
            <button class="buttonBox" type="submit">게시</button>
          </span>
        </div>
      </div>
    </article>

  </div>

</body>
