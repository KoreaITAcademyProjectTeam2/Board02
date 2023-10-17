<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/header/header.jsp"%>
<%-- <%@ include file="/resources/header/aside.jsp"%> --%>
<head>
<meta name="viewport" content="width=device-width" />
<title>main-page</title>
<link href="/resources/styles/common.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/styles/nav.css" rel="stylesheet" type="text/css" />
<link href="/resources/styles/body.css" rel="stylesheet" type="text/css" />
<link href="/resources/styles/comments.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/styles/uploadImage.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<div class='none'></div>
	<div class="main_body">
		<article id="posts">
			<div class="feed-container">
				<div class="feed">
					<div class="feed_id">
						<div class="id_box">
							<div class="id_box_img">(profile_img)</div>
							<div class="id_container">
								<div class="id_name">
									<c:out value="${post.userName }" />
								</div>
							</div>
						</div>
						<div class="feed_action">
							<a href="modifyPost?post_id=<c:out value="${post.post.post_id }" />" class="feed_action_box">수정</a>
							<form action="removePost" method="POST">
								<button class="feed_action_box" type="submit" name="post_id" value="<c:out value="${post.post.post_id }" />">삭제</button>
							</form>
						</div>
					</div>
					<div class="feed-post-box">
						<div class="feed_picture">
							<div class="uploadResult">
              					<ul>
                <!-- 이곳에 이미지 추가 -->
              					</ul>
            				</div>
						</div>
						<div class="feed_text">
							<c:out value="${post.post.post_content }" />
						</div>
					</div>


					<!--feedbottom-->
					<div class="feed_bottom">
						<div class="emoticon_box">
							<div class="feed_info">
								<div class="feed_info_tags">작성일</div>
								<div class="feed_info_tags" hidden="hidden">수정일</div>
							</div>
							<div class="emoticon_box2">
								<div class="comment_box">
									<img class="comment" src="/resources/img/comment.png"
										alt="댓글 이미지">
									<div class="emoticon_number">${post.commentCount }</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 게시글의 댓글 -->
					<form action="/comment/write" method="post" class="comment-form">
						<div class="inputContainer">
							<div class="type_comment">
								<input type='hidden' name='comment_post_id'
									value='${empty post ? 0 : post.post.post_id}'>
									<input type="hidden" name="comment_user_email" value="${userEmail}">
									<input
									class="inputBox" type="text" placeholder="댓글 작성..."
									name="comment_content">
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
									<img src="(프로필 이미지 경로)" alt="프로필">
								</div>
								<div class="commentContent">
									<p class="commentAuthor">${comment.comment_user_email}
									<fmt:formatDate value="${comment.comment_add_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="formattedDate"/>
										<span class="commentDate" data-date="${formattedDate}"></span>
									</p>
									<p>${comment.comment_content}</p>
									<p/>
								</div>
								<div class="commentActions">
									<a href="/comment/modify?comment_id=${comment.comment_id}"
										class="commentAction modify">수정</a>
									<a href="/comment/remove?comment_id=${comment.comment_id}"
										class="commentAction delete">삭제</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</article>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js" 
integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
crossorigin="anonymous"></script> 

	<script type="text/javascript">
		/* // 작성일을 상대적인 형식으로 변환하고 출력
		const dateString = "${comment.comment_add_date}";
		document.write(formatRelativeDate(dateString)); */

		function formatRelativeDate(dateString) {
			
			const now = new Date();
			const date = new Date(dateString);
			const timeDiff = now - date;

			// 밀리초 단위로 시간 계산
			const seconds = timeDiff / 1000;
			const minutes = seconds / 60;
			const hours = minutes / 60;
			const days = hours / 24;

			if (seconds < 0) {
		        return '방금 전'; // 게시된 시간이 현재 시간보다 미래인 경우
		    } else if (seconds < 60) {
		        return Math.floor(seconds) + '초 전';
		    } else if (minutes < 60) {
		        return Math.floor(minutes) + '분 전';
		    } else if (hours < 24) {
		        return Math.floor(hours) + '시간 전';
		    } else {
		        return Math.floor(days) + '일 전';
		    }
		}

		
		const commentDates = document.querySelectorAll(".commentDate");
	    commentDates.forEach(element => {
	        const rawDate = element.getAttribute("data-date");
	        element.innerText = formatRelativeDate(rawDate);
	    });
	</script>
	

	<script type="text/javascript">
		$(document).ready(function() {
		    // '수정' 버튼 클릭 시 실행할 함수 정의
		    $('.modify-button').click(function() {
		        // '수정' 버튼이 속한 댓글 div를 찾음
		        var commentDiv = $(this).closest('.comment');
		        // 댓글의 ID를 가져옴
		        var commentId = commentDiv.data('id');
		        // 댓글 내용을 가져옴
		        var commentContent = commentDiv.find('.comment-content').text();
		
		        // 텍스트를 텍스트 입력 요소로 바꿈
		        commentDiv.find('.comment-content').replaceWith('<input type="text" value="' + commentContent + '">');
		
		         // '수정' 및 '삭제' 버튼을 '확인' 버튼으로 바꿈
		         $(this).replaceWith('<button class="confirm-button">확인</button>');
			     // 삭제버튼은 숨김 처리함.
			     commentDiv.find('.delete-button').hide();
		    
			     // 확인 버튼 클릭 시 이벤트 핸들러 추가 
			     commentDiv.find('.confirm-button').click(function() {
			         // 여기에 댓글 업데이트를 위한 AJAX 요청 코드가 들어갑니다...
			     });
		    });
		});
	</script>
	<script type="text/javascript">
	$(document).ready(function(){
	    (function(){
	        const post_id = '<c:out value="${post.post.post_id}"/>';
			
	        
	        
	        $.getJSON("/main/getAttachList", {post_id: post_id}, function(arr){
	        	let str = "";
	        	console.log(arr);
	            $(arr).each(function(i, attach){
	            	const fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.file_name);
	            	
	            	str += "<div>";
	    			str += "<li>" + attach.file_name + "</li>";
	    			str += "<li><img src='/display?fileName="+fileCallPath+"'></li>";
	    			str += "</div>";
	    			
	    			console.log(attach.file_name);
	            });
	            
		        $(".uploadResult ul").html(str);
	        });
	        
	        
	    })();
	});
	</script>
	<!-- <script src="/resources/js/attachList.js"></script> -->

</body>


