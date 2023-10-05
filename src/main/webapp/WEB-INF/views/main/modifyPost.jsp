<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/header/header.jsp"%>
<%@ include file="/resources/header/aside.jsp"%>
<head>
  <meta name="viewport" content="width=device-width" />
  <meta charset="UTF-8">
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
      <!-- <div class="story">
        게시글 추가
        <form action="/newPost" method="post" id="">
            <input type="textarea">
        </form>
      </div> -->
      <div class="feed-container">
      
	      <div class="feed">
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
	            <form action="removePost" method="POST"><button class="feed_action_box" type="submit" name="post_id" value="<c:out value="${post.post_id }" />">삭제</button></form>
	        </div>
	        <!-- end feed_id -->
	        <form action="modifyPost" method="POST">
			<input type="hidden" value="<c:out value="${post.post_id }"/>" name="post_id" readonly>
			<div class="feed-post-box">
				<div class="feed_picture">
						<!-- (이미지 영역) -->
				</div>
				<div class="feed_text">
					<textarea name="post_content"><c:out value="${post.post_content }"/></textarea>
				</div>
			</div>
			<!-- feed-post-box -->
	        <div class="feed_bottom">
	          <div class="emoticon_box">
	          <div class="tag-container"></div>
	            <button class="buttonBox" type="submit">수정</button>
	          </div>
	        </div>
	        <!--/feed_bottom-->
	        </form>
	      </div>
	      
      </div>

    </article>

  </div>
</body>