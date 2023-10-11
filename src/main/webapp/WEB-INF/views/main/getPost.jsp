<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/header/header.jsp"%>
<%@ include file="/resources/header/aside.jsp"%>
<head>
  <meta name="viewport" content="width=device-width" />
  <title>main-page</title>
  <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/nav.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/body.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/comments.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <div class='none'></div>
  <div class="main_body">
    <article id="posts">
      <div class="feed-container">
      
	      <div class="feed" >
	        <div class="feed_id">
	            <div class="id_box">
	              <div class="id_box_img">
	                (profile_img)
	              </div>
	              <div class="id_container">
	                <div class="id_name">USER_NAME</div>
	              </div>
	              <!-- end id_container -->
	            </div>
	            <!-- end id_box -->
				<div class="feed_action">
					<a href="modifyPost?post_id=<c:out value="${post.post_id }" />" class="feed_action_box">수정</a>
					<form action="removePost" method="POST"><button class="feed_action_box" type="submit" name="post_id" value="<c:out value="${post.post_id }" />">삭제</button></form>
				</div>
	        </div>
	        <!-- end feed_id -->
			<div class="feed-post-box">
				<div class="feed_picture">
						(이미지 영역)
				</div>
				<div class="feed_text">
					<c:out value="${post.post_content }"/>
				</div>
			</div>
			
			
		
	          
	        <!--feedbottom-->
	        <div class="feed_bottom">
	          
	          <div class="emoticon_box">
	          	<div class="feed_info">
	          		<div class="feed_info_tags">작성일</div>
	          		<div class="feed_info_tags" type="hide">수정일</div>
	          		<div class="feed_info_tags">태그</div>
	          	</div>
	            <div class="emoticon_box2">
	              <div class="heart_box">
	                <img class="heart" src="/resources/img/heart.png" alt="좋아요 이미지">
	                <div class="emoticon_number">333</div>
	                <!-- 좋아요 표시. -->
	              </div>
	              <div class="comment_box">
	              	<img class="comment" src="/resources/img/comment.png" alt="댓글 이미지">
	              	<div class="emoticon_number">333</div>
	              	<!-- 댓글 작성 페이지로 넘어감. -->
	              </div>
	            </div>
	          </div>

	        </div>
	        
	        
	       <!--/feedbottom-->

<div class="comment-container">
  <!-- 댓글 작성 상자 -->
  <form action="/comment/write" method="post" class="comment-form">
    <div class="inputContainer">
      <div class="type_comment">
        <input type='hidden' name='comment_post_id' value='${empty post ? 0 : post.post_id}'>
        <input class="inputBox" type="text" placeholder="댓글 작성..." name="comment_content">
      </div>
      <span>
        <button class="buttonBox" type="submit">게시</button>
      </span>
    </div>
  </form>

  <!-- 댓글 목록 -->
<div id="commentList" class="commentList">
  <c:forEach items="${commentList}" var="comment">
    <div class="commentItem">
      <div class="profilePic">
        <img src="(프로필 이미지 경로)" alt="프로필 이미지">
      </div>
      <div class="commentContent">
        <p>${comment.comment_content}</p>
      </div>
      <div class="userInfo">
        <p><strong>${comment.comment_user_email}</strong></p>
        <p><fmt:formatDate value="${comment.comment_add_date}" pattern="yyyy-MM-dd" /></p>
      </div>
    </div>
  </c:forEach>
</div>


	</div>
    </article>

  </div>
</body>
