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
                console.log("inputFile: " + inputFile);
                
                var files = inputFile[0].files;  
                
                for (var i = 0; i < files.length; i++) {
					console.log("file: " + files[i]);
					formData.append("uploadfiles", files[i]);
				} 
                
                for (var key of formData.keys()) {
                	  console.log("formdata KEY: " + key);
                }

                for (var value of formData.values()) {
                	  console.log("formdata VALUE: " + value);
                }
	    		
	    		$.ajax({
	                type : "POST",
	                url : $(this).attr("action"),
	                cache : false,
	                contentType: false, 
	                processData: false, 
	                data: formData, 
	                beforeSend : function(xhr) {
	    				xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
	          		},
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
	    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	    <input type="file" id="uploadfiles" name="uploadfiles" value="uploadfiles" placeholder="파일 선택" multiple/><br/>
	    <input type="submit" value="업로드">
	</form>
</body>
</html>