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
  <link href="/resources/styles/main.css" rel="stylesheet" type="text/css" />
</head>

<body>


<!--body-->
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
			<c:forEach items="${list}" var="posts">
			<div onclick='location.href="main/getPost?post_id=<c:out value="${posts.post_id }" />"' class="feed" >
				<div class="feed_id">
					<div class="id_box">
						<div class="id_box_img">
		                	(profile_img)
		                </div>
					<div class="id_container">
						<div class="id_name">USER_NAME</div>
					</div>
					</div>
				</div>
				<div class="feed-post-box">
					<div class="feed_picture">
						(이미지 영역)
					</div>
					<div class="feed_text">
						<c:out value="${posts.post_content }"/>
					</div>
				</div>
	
		          
		        <!--feedbottom-->
				<div class="feed_bottom">
					<div class="emoticon_box">
						<div class="feed_info">
		          			<div>작성일</div>
		          			<div>태그</div>
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
							</div>
							<!-- comment_box -->
						</div>
						<!-- emoticon_box2 -->
					</div>
					<!-- /emoticon_box -->
		        </div>
		        <!--/feedbottom-->
		
		        <div class="feed_article">
		        	<div class="feed_article_box">
						<div class="comments1_box">
							<div class="comment_user_id">아이디1</div>
							<div class="comments-comment">아이디1 댓글</div>
						</div>
						<!-- comments1_box -->
					</div>
					<!-- feed_article_box -->
				</div>
				<!-- feed_article -->
		        <!-- 게시글의 댓글 -->
			</div>
			<!-- end feed-->
			</c:forEach>
		</div>
		<!-- end feed_container -->
	    </article>
	</div>
<script>
	
</script>
</body>
