<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>File Upload Test</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script>
	    $(document).ready(function () {
	    	$("#uploadForm").submit(function(event){
	    		event.preventDefault();
	    		
	    		// 파일저장 영역
                var formData = new FormData();
	    		
                var inputFile = $("#uploadfiles");
                var files = inputFile[0].files;  
                
                for (var i = 0; i < files.length; i++) {
					console.log(files[i]);
					formData.append("uploadfiles", files[i]);
				}     
	    		
              	// 파일 넣을때 JSON.stringify()는 하지마...
	    		$.ajax({
	                type : "POST",
	                url : $(this).attr("action"),
	                cache : false,
	                contentType:'application/json; charset=utf-8', 
	                processData: false, 
		    		contentType: false, 
	                data: formData, 
	                success: function (result) {       
	                	console.log("UPLOAD SUCCESS!")
	  	          	  	alert('파일 저장 성공');   
	                    $(location).attr('href', '${pageContext.request.contextPath}/file/index');                                        
	                },
	                error: function (e) {
	                    console.log(e);
	                    alert('파일 저장 실패');
	  	            	location.reload(); // 실패시 새로고침하기
	                }
	            }) 
	    	});
	    })
	</script>
</head>
<body>
	<h2>파일 업로드</h2>
	<form id="uploadForm" action="${pageContext.request.contextPath}/file/fileupload" method="post" enctype="multipart/form-data">
	    <input type="hidden" id="board_id" value="49">
	    <input type="file" id="uploadfiles" name="uploadfiles" placeholder="파일 선택" multiple/><br/>
	    <input type="submit" value="업로드">
	</form>
</body>
</html>