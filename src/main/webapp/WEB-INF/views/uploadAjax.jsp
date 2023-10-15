<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.uploadResult{
	width: 100%;
	background-color: gray;
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

<h1>Upload With Ajax</h1>

<div class="uploadDiv">
	<input type="file" name="uploadFile" accept="image/*" multiple>
</div>
<div class="uploadResult">
	<ul>
	
	</ul>
</div>
<button id="uploadBtn">Upload</button>



<script src="https://code.jquery.com/jquery-3.7.0.min.js" 
integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
crossorigin="anonymous"></script>

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
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				console.log(result);
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
			
			str += "<li><img src='/display?fileName="+fileCallPath+"'></li>"
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
</html>