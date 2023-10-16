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
				showUploadedFile(result);
				
				$(".uploadDiv").html(cloneObj.html());
			}
		});
	});

	$(".uploadResult").on("click", "span", function(e){
		let targetFile = $(this).data("file");
		let type = $(this).data("type");
		console.log(targetFile);
		
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type: type},
			dataType: 'text',
			type: 'POST',
			success: function(result){
				alert(result);
			}
		});
	});


	function showUploadedFile(uploadResultArr){
		let str = "";
		
		$(uploadResultArr).each(function(i, obj) {
			str += "<li>" + obj.fileName + "</li>"
			const fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
			
			str += "<li><img src='/display?fileName="+fileCallPath+"'></li>";
			str += "<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span>"
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