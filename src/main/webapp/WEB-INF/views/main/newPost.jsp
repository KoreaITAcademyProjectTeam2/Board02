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
      	<button id="uploadBtn">Upload</button>
        <form class="feed" action="/main/newPost" method="POST">
          <div class="feed_picture">
            <div class="uploadResult">
              <ul>
                <!-- 이곳에 이미지 추가 -->
                
              </ul>
            </div>
	      </div>
	        <textarea name='post_content' placeholder="글 내용"></textarea>
	        <div class="uploadDiv">
	          <input type="file" name="uploadFile" accept="image/*" multiple>
	        </div>
	        <div class="feed_bottom">
	          <div class="emoticon_box">
	          <div class="tag-container"></div>
	            <button id="uploadBtn" class="buttonBox" type="submit">게시</button>
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
<script>
$(document).ready(function() {
	
	const cloneObj = $(".uploadDiv").clone();
	const uploadResult = $(".uploadResult ul");
	
	$("#uploadBtn").on("click", function(e){
		let formData = new FormData();
		
		let inputFile = $("input[name='uploadFile']");
		
		let files = inputFile[0].files;
		
		console.log(files);
		
		for(let i = 0; i < files.length; i++){
			if(checkExtension(files[i].name, files[i].size)){
				formData.append("uploadFile", files[i]);
			} else{
				alert("");
			}
		}
		
		$.ajax({
			url: '/main/newPost/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				console.log("result: " + result);
				showUploadedFile(result);
				
				$(".uploadDiv").html(cloneObj.html());
			}
		});
		
	});
	
	$("input[name='uploadFile']").on("change", function(){
		let formData = new FormData();
		
		let inputFile = this;
		
		let files = inputFile.files;
		
		for(let i = 0; i < files.length; i++){
			if(checkExtension(files[i].name, files[i].size)){
				formData.append("uploadFile", files[i]);
			}
			else{
				break;
			}
		}
		
		$.ajax({
			url: '/main/newPost/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				console.log("result: " + result);
				showUploadedFile(result);
				
				$(".uploadDiv").html(cloneObj.html());
			}
		});
	});

	function showUploadedFile(uploadResultArr){
		let str = "";
		
		$(uploadResultArr).each(function(i, obj) {
			str += "<li>" + obj.fileName + "</li>"
			const fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
			
			str += "<li><img src='/main/newPost/display?fileName="+fileCallPath+"'></li>"
		});
		

		uploadResult.append(str);
	}
});

function checkExtension(fileName, fileSize){

	const regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)$", "i");

	const maxSize = 5242880;

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	
	if(regex.test(fileName)){
		return true;
	}
	
	console.log("업로드 실패");
	
	return false;
}
</script>


</body>