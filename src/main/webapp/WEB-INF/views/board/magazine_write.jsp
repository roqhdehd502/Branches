<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%> --%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Magazine Board Write</title>
	
	<!-- Required CSS files -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">
	<link rel="stylesheet" href="/assets/css/owl.carousel.css">
	<link rel="stylesheet" href="/assets/css/barfiller.css">
	<link rel="stylesheet" href="/assets/css/animate.css">
	<link rel="stylesheet" href="/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/css/slicknav.css">
	<link rel="stylesheet" href="/assets/css/main.css">
	<link rel="stylesheet" href="/bootstrap.min.css">
	
	<!-- AJAX 처리용 JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- 작성 폼 스크립트 -->
	<script>
	    $(document).ready(function () {
	    	$("#writeForm").submit(function(event){
	    		event.preventDefault();
	    		
	    		var formData = new FormData();
	    		var appended = false;
	    		
	    		// 텍스트 입력 영역
	            var mbr_id = $("#mbr_id").val();
	            var board_name = $("#board_name").val();
	            var board_content = $("#board_content").val();
	            
	            console.log(mbr_id);
	            console.log(board_name);
	            console.log(board_content);    
	            console.log($(this).attr("action"));   
	            
	            formData.append("mbr_id", mbr_id);
	            formData.append("board_name", board_name);
	            formData.append("board_content", board_content);
	    		
	    		// 파일저장 영역
                var inputFile = $("#uploadfiles");
                
                function filechk(){
                	 var fileDir = inputFile;

                	 if(fileDir.substring(fileDir.lastIndexOf(".")+1,fileDir.length).search("jpg") == -1){
                	 	alert("지정된 확장자의 파일만 업로드 가능합니다!");
                	 } else if (fileDir.substring(fileDir.lastIndexOf(".")+1,fileDir.length).search("png") == -1) {
                		 alert("지정된 확장자의 파일만 업로드 가능합니다!");
					 }	 
                } 
	    		
                var files = inputFile[0].files;  
                
                for (var i = 0; i < files.length; i++) {
					console.log(files[i]);
					formData.append("uploadfiles", files[i]);
					appended = true;
				}
                
                console.log("formData: " + formData);
                
                // upload 체크(파일을 첨부 안하면 업로드를 안한다...)
                if (!appended) { return; }
                for (var value of formData.values()) {
					console.log(value);
				}
                
                
              	// 파일 넣을때 JSON.stringify()는 적용이 안된다...
	    		$.ajax({
	                type : "POST",
	                url : $(this).attr("action"),
	                cache : false,
	                contentType:'application/json; charset=utf-8', 
	                processData: false, 
		    		contentType: false, 
	                data: formData, 
	                /* beforeSend : function(xhr) {
					xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
             		}, */
	                success: function (result) {       
	                	console.log("UPLOAD SUCCESS!");
	                	alert('업로드 성공');
	                    $(location).attr('href', '${pageContext.request.contextPath}/board/magazine');                                        
	                },
	                error: function (e) {
	                    console.log(e);
	                    alert('업로드 실패');
	  	            	location.reload(); // 실패시 새로고침하기
	                }
	            }) 
	    	});
	    })
	</script>
</head>
<body>
	<div style="overflow: hidden;" class="container">
	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="container">
				<div class="row">
					<div class="col-md-6 contact-info" align="left">
						<h2>MAGAZINE</h2>
					</div>
					<div class="col-md-6 contact-info" align="right"></div>
				</div>	
			</div>
			
			<hr>
			
			<div class="container">
				<form id="writeForm" action="${pageContext.request.contextPath}/admin/board/magazine/write" method="post" enctype="multipart/form-data" >
				<!-- <s:csrfInput /> -->
				<input type="hidden" id="mbr_id" value="${mbr.mbr_id}">
				<fieldset>
					<div class="row">
						<div class="col-md-2 contact-info" align="left">
							<legend>글제목</legend>
						</div>
						<div class="col-md-10 contact-info">
							<input class="form-control" type="text" id="board_name" name="board_name" placeholder="글제목을 입력하세요">
						</div>
					</div>
					<div class="row" style="padding: 3% 0px 3% 0px">
						<div class="col-md-2 contact-info" align="left">
							<legend>글내용</legend>
						</div>
						<div class="col-md-10 contact-info">
							<textarea class="form-control" cols="3" id="board_content" name="board_content" placeholder="글내용을 입력하세요"></textarea>
						</div>
					</div>
					<div class="row" style="padding: 3% 0px 3% 0px">
						<div class="col-md-2 contact-info" align="left">
							<legend>첨부사진</legend>
						</div>
						<div class="col-md-10 contact-info">
							<input type="file" accept=".jpg, .png" id="uploadfiles" name="uploadfiles" placeholder="첨부 사진" multiple/>
							<small class="form-text text-muted">jpg, png의 사진파일만 적용됩니다.</small>
						</div>
					</div>
					<div align="center" style="padding: 3% 3% 3% 3%;">
						<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/magazine'">목록보기</button>&nbsp;
						<button type="submit" class="btn btn-primary">작성하기</button>
					</div>	
				</fieldset>
				</form>
			</div>
		</div>

		<hr>

	  	<!-- footer -->
      	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/footer.jsp"></jsp:include>

      	<!--Required JS files-->
     	<script src="/assets/js/jquery-2.2.4.min.js"></script>
      	<script src="/assets/js/vendor/popper.min.js"></script>
      	<script src="/assets/js/vendor/bootstrap.min.js"></script>
      	<script src="/assets/js/vendor/owl.carousel.min.js"></script>
      	<script src="/assets/js/vendor/isotope.pkgd.min.js"></script>
      	<script src="/assets/js/vendor/jquery.barfiller.js"></script>
      	<script src="/assets/js/vendor/loopcounter.js"></script>
      	<script src="/assets/js/vendor/slicknav.min.js"></script>
      	<script src="/assets/js/active.js"></script>
    </div>  
</body>
</html>