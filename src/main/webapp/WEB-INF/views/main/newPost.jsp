<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/resources/header/header.jsp"%>
<%-- <%@ include file="/resources/header/aside.jsp"%> --%>

<head>
  <meta name="viewport" content="width=device-width" />
  <meta charset="UTF-8">
  <title>main-page</title>
  <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/nav.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/body.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
	.uploadResult{
	width: 100%;
	background-color: white;
	}
	
	.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;}
	
	.uploadResult ul li{
	list-style: none;
	padding: 10px;
	}
	
	.uploadResult ul li img {
	width: 40px;
	}
  </style>
</head>

<body>

  <!--body-->
	<div class='none'></div>
   
  <div class="main_body">
    <article>
      <div class="feed-container">
        <form class="feed" action="/main/newPost" method="POST">
          <div class="feed_picture">
            <div class="uploadResult">
              <ul>
                <!-- 이곳에 이미지 추가 -->
                
              </ul>
            </div>
	      </div>
	        <textarea id="postContent" name='post_content' placeholder="글 내용"></textarea>
	        <div class="uploadDiv">
	          <input type="file" name="uploadFile" accept="image/*" multiple>
	        </div>
	        <div class="feed_bottom">
	          <div class="emoticon_box">
	          <div class="tag-container"></div>
	            <button id="uploadBtn" class="buttonBox" type="submit" onsubmit="return submitForm()">게시</button>
	          </div>
	        </div>
	        <!--/feedbottom-->
	      </form>
	      
      </div>

    </article>

  </div>


<script src="https://code.jquery.com/jquery-3.7.0.min.js" 
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
	crossorigin="anonymous"></script>
	<!-- jquery library -->
<script src="/resources/js/thumbnail.js"></script>
<script>
function submitForm() {
	const textAreaContent = document.getElementById("postContent").value;
	
	if(textAreaContent.trim() === ''){
		alert("내용이 존재하지 않습니다.");
		return false;
	}
	return true;
}
</script>
</body>