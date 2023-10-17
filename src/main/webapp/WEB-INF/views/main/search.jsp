<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="java.sql.*"
	import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/header/header.jsp"%>
<%-- <%@ include file="/resources/header/aside.jsp"%> --%>

<head>
  <meta name="viewport" content="width=device-width" />
  <title>search-page</title>
  <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/nav.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/body.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/comments.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/main.css" rel="stylesheet" type="text/css" />  
  <link href="/resources/styles/search.css" rel="stylesheet" type="text/css" />  
    
      <!-- jquery버튼추가 -->
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous">
	</script>
</head>

<body>
<div class='none'></div>
<div class="main_body">
<article>
<!-- 게시물 o -->
<c:if test="${listcheck != 'empty'}">
<div id="feed-container">

			<c:forEach items="${list}" var="posts">
			<div class="feed" >
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
					<div class="feed_text" onclick='location.href="getPost?post_id=<c:out value="${posts.post_id }" />"'>
						<c:out value="${posts.post_content }"/>
					</div>
				</div>
				<!-- /feed-post-box -->
				
				<div class="feed_bottom">
					<div class="emoticon_box">
						<div class="feed_info">
		          			<div>작성일:<span><fmt:formatDate value="${posts.post_add_date}" pattern="yyyy-MM-dd"/></span></div>
		          			<div>태그</div>
		          		</div>
						<div class="emoticon_box2">
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
		</c:if>
		<!-- end feed_container -->
		<div id="loader_container"><div id="loader" style="display: none;"></div></div>
</article>
	</div>
				
	<form id="moveForm" action="/search" method="get" >
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			<input type="hidden" name="type" value="${pageMaker.cri.type}">
	</form>

<!-- 게시물 x -->
<c:if test="${listcheck == 'empty'}">
	<div class="table_empty">
		검색결과가 없습니다.
	</div>
</c:if>
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
	console.log("handle scroll");
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
					console.log("delay");
					resolve()
				}, 1000);
			});
		});
}

function createUserBox(post){
	return `
		<div class="feed_id">
		  <div class="id_box">
		    <div class="id_box_img">(profile_img)</div>
		    <div class="id_container">
		      <div class="id_name">USER_NAME</div>
		    </div>
		  </div>
		</div>
	`;
}

function createFeedPostBox(post){
	return `
    <div class="feed-post-box">
      <div class="feed_picture">(이미지 영역)</div>
      <div class="feed_text" data-postid="\${post.post_id}">\${post.post_content}</div>
	</div>
	`;
}

function createFeedBottom(post){
	const postAddDate = new Date(post.post_add_date);
	const formattedDate = postAddDate.toISOString().slice(0, 10);
	return `
		<div class="feed_bottom">
		  <div class="emoticon_box">
		    <div class="feed_info">
			  <div>작성일: <span>\${formattedDate}</span></div>
			  <div>태그-<span></span></div>
			</div>
			<div class="emoticon_box2">
			  <div class="comment_box">
			    <img class="comment" src="/resources/img/comment.png" alt="댓글">
			    <div class="emoticon_number">333</div>
			  </div>
			</div>
		  </div>
		</div>
	`;
}

function createFeedArticle() { //게시글에 댓글을 추가
    return `
        <div class="feed_article">
            <div class="feed_article_box">
                <div class="comments1_box">
                    <div class="comment_user_id">댓글1 작성자</div>
                    <div class="comments-comment">댓글1 내용</div>
                </div>
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
		const feedArticle = createFeedArticle();
		
		console.log(feedPostBox)
		
		feedElement.innerHTML = userBox + feedPostBox + feedBottom + feedArticle;
		
		feedElement.querySelector('.feed_text').addEventListener('click', function() {
            location.href = `main/getPost?post_id=\${post.post_id}`;
        });
		
		feedContainer.appendChild(feedElement);
		
        
	});
	 feedContainer.insertAdjacentHTML('beforeend', newContent); 

}
const debounceHandleScroll = debounce(handleScroll, 300);
window.addEventListener('scroll', debounceHandleScroll);
</script>


</body>
</html>