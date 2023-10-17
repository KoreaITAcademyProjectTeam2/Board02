$(document).ready(function() {
	
	const cloneObj = $(".uploadDiv").clone();
	const uploadResult = $(".uploadResult ul");
	
	$("input[name='uploadFile']").on("change", function(){
		let formData = new FormData();
		
		let inputFile = this;
		
		let files = inputFile.files;
		
		
		if(files == null){
			return;
		}
		
		if(files.length > 4) {
		    alert("이미지는 최대 4개까지만 업로드 가능합니다.");
		    this.value = ""; // 파일 선택을 초기화
		    return;
		}
		
		for(let i = 0; i < files.length; i++){
			if(checkExtension(files[i].name, files[i].size)){
				formData.append("uploadFile", files[i]);
			}
			else{
				formData = new FormData();
				break;
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
				console.log("result: " + result);
				console.log("result.uuid " + result[0].uuid);
				
				showUploadedFile(result);
				
				$(".uploadDiv").html(cloneObj.html());
			}
		});
	});

	$(".uploadResult").on("click", "span", function(e){
		let targetFile = $(this).data("file");
		let type = $(this).data("type");
		console.log(targetFile);
		
		const clickedDiv = $(this).parent();

		const index = clickedDiv.data("index");

		console.log("targetFile: " + targetFile); 
		console.log("index: " + index);
		console.log("type: " + type);
		$.ajax({
			url: '/deleteFile',
			data: {file_name: targetFile, type: type},
			dataType: 'text',
			type: 'POST',
			success: function(result){
	            clickedDiv.remove(); // Remove the span element
	            alert(result);
			}
		});
	});


	function showUploadedFile(uploadResultArr){
		let str = "";
		
		$(uploadResultArr).each(function(i, obj) {
			
			console.log("fileName" + obj.file_name);
			console.log("uuid: " + obj.uuid);
		
			str += "<div data-index='" + i + "'>";
			str += "<li>" + obj.file_name + "</li>";
			const fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.file_name);
			
			str += "<li><img src='/display?fileName="+fileCallPath+"'></li>";
			str += "<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span>";
			
			str += "<input type='hidden' name='attachList[" + i + "].file_name' value='" + obj.file_name + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + obj.uuid + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + obj.uploadPath + "'>";
			
			str += "</div>";
		});
		

		uploadResult.append(str);
	}
});

function checkExtension(fileName, fileSize){

	const regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)$", "i");

	const maxSize = 5242880;

	if(fileSize >= maxSize){
		window.alert("파일 사이즈 초과");
		return false;
	}
	
	if(!regex.test(fileName)){
		window.alert("추가 불가능한 확장자");
		return false;
	}
	
	return true;
}