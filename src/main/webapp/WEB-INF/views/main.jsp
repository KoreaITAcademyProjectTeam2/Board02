<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/header/header.jsp"%>
<%-- <%@ include file="/resources/header/aside.jsp"%> --%>

<head>
  <meta name="viewport" content="width=device-width" />
  <title>main-page</title>
  <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/nav.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/body.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/comments.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/main.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/uploadImage.css" rel="stylesheet" type="text/css" />
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
		<div id="feed-container">
			<c:forEach items="${list}" var="postDTOs">
			<div class="feed" >
				<div class="feed_id">
					<div class="id_box">
						<div class="id_box_img">
		                	(profile_img)
		                </div>
					<div class="id_container">
						<div class="id_name">${postDTOs.userName }</div>
					</div>
					</div>
				</div>
				<div class="feed-post-box" onclick='location.href="main/getPost?post_id=<c:out value="${postDTOs.post.post_id }" />"'>
					<div class="feed_picture">
							<div class="uploadResult">
              					<ul>
              					(이미지 영역)
<%--               					    <c:choose>
								        <c:when test="${not empty post.attachList}">
								            <c:forEach var="attach" items="${post.attachList}">
								                <div>
								                    <li>${attach.file_name}</li>
								                    <li><img src='<c:url value="/display"/>?fileName=${attach.uploadPath + "/s_" + attach.uuid + "_" + attach.file_name}'></li>
								                </div>
								            </c:forEach>
								        </c:when>
								        <c:otherwise>
								            <p>No attachments available</p>
								        </c:otherwise>
								    </c:choose> --%>
              					</ul>
            				</div>
					</div>
					<div class="feed_text" >
						<c:out value="${postDTOs.post.post_content }"/>
					</div>
				</div>
				<!-- /feed-post-box -->
				
				<div class="feed_bottom">
					<div class="emoticon_box">
						<div class="feed_info">
		          			<div>작성일:<span><fmt:formatDate value="${postDTOs.post.post_add_date}" pattern="yyyy-MM-dd"/></span></div>
		          			
		          		</div>
						<div class="emoticon_box2">
							<div class="comment_box">
								<img class="comment" src="/resources/img/comment.png" alt="댓글 이미지">
								<div class="emoticon_number">${postDTOs.commentCount }</div>
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
		        	<c:if test="${not empty postDTOs.firstComment.comment_content }">
						<div class="comments1_box">
							<div class="comment_user_id">${postDTOs.firstCommentUser }</div>
							<div class="comments-comment">${postDTOs.firstComment.comment_content }</div>
						</div>
						<!-- comments1_box -->
					</c:if>
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
		<div id="loader_container"><div id="loader" style="display: none;"></div></div>
	    </article>
	</div>
<script>

	function debounce(func, delay) {
		let timeout;
		return function() {
			const context = this;
	        const args = arguments;
	        clearTimeout(timeout);
	        timeout = setTimeout(() => {
	            timeout = null;
	            func.apply(context, args);
	        }, delay);
		};
	}

	function handleScroll() {
		
		if((window.innerHeight + window.scrollY) >= document.body.offsetHeight * 0.99){
			loadMoreData();
		}
	}
	
	function loadMoreData() {
		document.getElementById('loader').style.display = 'block';
		
		let currentCount = document.querySelectorAll('.feed').length;
		
		fetch('/main/loadPost?count=10&currentCount=' + currentCount)
			.then(response => response.json())
			.then(data => {

				appendDomData(data);
				
				document.getElementById('loader').style.display = 'none';
			})
			.then(() => {
				return new Promise((resolve) => {
					setTimeout(() => {
						
						resolve()
					}, 1000);
				});
			});
	}
	
	function createUserBox(postDTOs){
		return `
			<div class="feed_id">
			  <div class="id_box">
			    <div class="id_box_img">(profile_img)</div>
			    <div class="id_container">
			      <div class="id_name">\${postDTOs.userName }</div>
			    </div>
			  </div>
			</div>
		`;
	}
	
	function createFeedPostBox(postDTOs){
		return `
        <div class="feed-post-box">
          <div class="feed_picture">(이미지 영역)</div>
          <div class="feed_text" data-postid="\${postDTOs.post.post_id}">\${postDTOs.post.post_content}</div>
    	</div>
		`;
	}
	
	function createFeedBottom(postDTOs){
		const postAddDate = new Date(postDTOs.post.post_add_date);
		const formattedDate = postAddDate.toISOString().slice(0, 10);
		return `
			<div class="feed_bottom">
			  <div class="emoticon_box">
			    <div class="feed_info">
				  <div>작성일: <span>\${formattedDate}</span></div>
				</div>
				<div class="emoticon_box2">
				  <div class="comment_box">
				    <img class="comment" src="/resources/img/comment.png" alt="댓글">
				    <div class="emoticon_number">\${postDTOs.commentCount}</div>
				  </div>
				</div>
			  </div>
			</div>
		`;
	}
	
	function createFeedArticle(postDTOs) { //게시글에 댓글을 추가
	    return `
	        <div class="feed_article">
	            <div class="feed_article_box">
	            <c:if test="${not empty postDTOs.firstCommentUser }">
	                <div class="comments1_box">
	                    <div class="comment_user_id">\${postDTOs.firstCommentUser }</div>
	                    <div class="comments-comment">${postDTOs.firstComment.comment_content}</div>
	                </div>
	            </c:if>
	            </div>
	        </div>
	    `;
	}

	function appendDomData(data){
		
		let currentCount = document.querySelectorAll('.feed').length;
		const feedContainer = document.getElementById('feed-container');
		
		
		
		data.forEach(post => {
			
			
			const feedElement = document.createElement('div');
			feedElement.classList.add('feed');
			
			const userBox = createUserBox(post);
			const feedPostBox = createFeedPostBox(post);
			const feedBottom = createFeedBottom(post);
			const feedArticle = createFeedArticle(post);
			
			
			
			feedElement.innerHTML = userBox + feedPostBox + feedBottom + feedArticle;
			
			feedElement.querySelector('.feed_text').addEventListener('click', function() {
	            location.href = `main/getPost?post_id=\${post.post.post_id}`;
	        });
			
			feedContainer.appendChild(feedElement);
			
	        
		});
		/* feedContainer.insertAdjacentHTML('beforeend', newContent); */

	}
	const debounceHandleScroll = debounce(handleScroll, 300);
	window.addEventListener('scroll', debounceHandleScroll);

</script>

	<script type="text/javascript">
	$(document).ready(function(){
	    (function(){
	        const post_id = '<c:out value="${postDTOs.post.post_id}"/>';
			
	        
	        
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
</body>
