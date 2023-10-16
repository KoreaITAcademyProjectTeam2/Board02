<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/header/header.jsp"%>
<%-- <%@ include file="/resources/header/aside.jsp"%> --%>
<head>
  <meta name="viewport" content="width=device-width" />
  <meta charset="UTF-8">
  <title>main-page</title>
  <link href="/resources/styles/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/nav.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/body.css" rel="stylesheet" type="text/css" />
  <link href="/resources/styles/comments.css" rel="stylesheet" type="text/css" />
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
	                <div class="id_name">${post.userName }</div>
	              </div>
	              <!-- end id_container -->
	            </div>
	            <!-- end id_box -->
	            <form action="removePost" method="POST" onsubmit="return submitForm()">
	            	<button class="feed_action_box" type="submit" name="post_id" value="<c:out value="${post.post.post_id }" />">삭제</button>
	            </form>
	        </div>
	        <!-- end feed_id -->
	        <form action="modifyPost" method="POST">
			<input type="hidden" value="<c:out value="${post.post.post_id }"/>" name="post_id" readonly>
			<div class="feed-post-box">
				<div class="feed_picture">
					<div class="uploadResult">
		              <ul>
		                <!-- 이곳에 이미지 추가 -->		                
		              </ul>
		            </div>
				</div>
				<div class="feed_text">
					<textarea name="post_content" id="postContent"><c:out value="${post.post.post_content }"/></textarea>
					<div class="uploadDiv">
			          <input type="file" name="uploadFile" accept="image/*" multiple>
			        </div>
				</div>
			</div>
			<div class="feed_bottom">
			  <div class="fileName"></div>
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
 
<script src="https://code.jquery.com/jquery-3.7.0.min.js" 
integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
crossorigin="anonymous"></script> 
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
	<script type="text/javascript">
	$(document).ready(function(){
	    (function(){
	        const post_id = '<c:out value="${post.post.post_id}"/>';
	        
	        $.getJSON("/main/getAttachList", {post_id: post_id}, function(arr){
	        	let str = "";
	        	console.log(arr);
	            $(arr).each(function(i, attach){
	            	const fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.file_name);
	            	
	            	str += "<div data-index='" + i + "'>";
	    			str += "<li>" + attach.file_name + "</li>";
	    			str += "<li><img src='/display?fileName="+fileCallPath+"'></li>";
	    			
	    			str += "<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span>";
	    			
	    			str += "<input type='hidden' name='attachList[" + i + "].file_name' value='" + attach.file_name + "'>";
	    			str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + attach.uuid + "'>";
	    			str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + attach.uploadPath + "'>";
	    			
	    			str += "</div>";
	    			
	    			console.log("attachFileName: "+attach.file_name);
	            });
	            
		        $(".uploadResult ul").html(str);
	        });
	        
	        
	    })();
	});
	
	
	</script>
</body>