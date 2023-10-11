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
      <!-- <div class="story">
        게시글 추가
        <form action="/newPost" method="post" id="">
            <input type="textarea">
        </form>
      </div> -->
      <div class="feed-container">
      
	      <div class="feed" >
	        <div class="feed_id">
	            <div class="id_box">
	              <div class="id_box_img">
	                (profile_img)
	              </div>
	              <div class="id_container">
	                <div class="id_name"><c:out value="${post.userName }" /></div>
	              </div>
	              <!-- end id_container -->
	            </div>
	            <!-- end id_box -->
				<div class="feed_action">
					<a href="modifyPost?post_id=<c:out value="${post.post.post_id }" />" class="feed_action_box">수정</a>
					<form action="removePost" method="POST"><button class="feed_action_box" type="submit" name="post_id" value="<c:out value="${post.post.post_id }" />">삭제</button></form>
				</div>
	        </div>
	        <!-- end feed_id -->
			<div class="feed-post-box">
				<div class="feed_picture">
						(이미지 영역)
				</div>
				<div class="feed_text">
					<c:out value="${post.post.post_content }"/>
				</div>
			</div>

	          
	        <!--feedbottom-->
	        <div class="feed_bottom">
	          
	          <div class="emoticon_box">
	          	<div class="feed_info">
	          		<div class="feed_info_tags">작성일</div>
	          		<div class="feed_info_tags" hidden>수정일</div>
	          	</div>
	            <div class="emoticon_box2">
	              <div class="comment_box">
	              	<img class="comment" src="/resources/img/comment.png" alt="댓글 이미지">
	              	<div class="emoticon_number">${post.commentCount }</div>
	              	<!-- 댓글 작성 페이지로 넘어감. -->
	              </div>
	            </div>
	          </div>

	        </div>
	        
	        
	       <!--/feedbottom-->
   
           <div class="feed_article">
             <c:forEach items="${comments}" var="comment">
              <div class="feed_article_box">
              <div class="comments1_box">
                <div class="comment_user_id">${comment.comment_user_email}</div>
                <div class="comments-comment">${comment.comment_content}</div>
              </div>
              </div>
           </c:forEach>

           <!-- 게시글의 댓글 -->
          <form action="/comment/write" method="post">
           <div class="inputContainer">
             <div class="type_comment">
               <!-- 게시글 ID도 함께 전송합니다 -->
               <input type='hidden' name='comment_post_id' value='${empty post ? 0 : post.post.post_id}'>
               
               <!-- 사용자가 입력한 새로운 댓글 내용 -->
               
               <input class="inputBox" type="text" placeholder="댓글 작성..." name="comment_content">
             </div>
             <span>
               <!-- '게시' 버튼 클릭 시 위에서 정의한 action URL로 폼 데이터 전송 -->
               <button class="buttonBox" type="submit">게시</button>
             </span>
           </div>
         </form> 

           <!-- 댓글 작성 -->
	      </div>
	      
      </div>

    </article>

  </div>
</body>
