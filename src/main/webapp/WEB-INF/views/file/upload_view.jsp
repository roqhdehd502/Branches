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
	    		var result = $("#uploadfiles").val();
	    		console.log(result);
	    		
	    		$.ajax({
	                type : "POST",
	                url : $(this).attr("action"),
	                cache : false,
	                contentType:'application/json; charset=utf-8',
	                data: JSON.stringify(form),
	                success: function (result) {       
	                  if(result != null){
	                	 console.log("UPLOAD SUCCESS!")
	  	          	  	 alert('파일 저장 성공');   
	                     $(location).attr('href', '${pageContext.request.contextPath}/file/index');                            
	                  } else {
	                	 console.log("UPLOAD FAILED")
	  	            	 alert('파일 저장 실패');
	  	            	 location.reload(); // 실패시 새로고침하기
					  }                   
	                },
	                error: function (e) {
	                    console.log(e);
	                }
	            }) 
	    	});
	    })
	</script>
</head>
<body>
	<h2>파일 업로드</h2>
	<form id="uploadForm" action="${pageContext.request.contextPath}/file/fileupload" method="post" enctype="multipart/form-data">
	    <input type="file" id="uploadfiles" name="uploadfiles" placeholder="파일 선택" multiple/><br/>
	    <input type="submit" value="업로드">
	</form>
</body>
</html>