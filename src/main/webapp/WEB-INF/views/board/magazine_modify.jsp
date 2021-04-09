<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%> --%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Magazine Board Modify</title>
	
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

	<!-- CKEditor로 작성 모듈 불러오기 -->
	<script src="/ckeditor/ckeditor.js"></script>
	
	<!-- AJAX 처리용 JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- 수정 폼 스크립트 -->
	<script type="text/javascript">
	   	$(document).ready(function(){
	      $("#updateForm").submit(function(event){         
	           event.preventDefault();
	           
	           // FormData 불러오기
	           var formData = new FormData();
	           
	           // 게시글 텍스트 사항
	           var board_id = $("#board_id").val();
	           var board_name = $("#board_name").val();
	           var board_content = $("#board_content").val();              
	           
	           console.log(board_id);
	           console.log(board_name);
	           console.log(board_content);
	           console.log($(this).attr("action"));    
	           
	           // 해당 텍스트들을 FormData에 append
	           formData.append("board_id", board_id);
	           formData.append("board_name", board_name);
	           formData.append("board_content", board_content);           
               
	           
               // 파일 업로드 체크(게시글 내용만 수정하는 것 대비...)
               var inputFile = $("#uploadfiles");
               var files = inputFile[0].files;
	           
               // 파일을 담는 배열이 비어 있지 않으면(파일 업로드 시) FormData에 파일 정보를 추가한다
               if (files != null) {    
            	   for (var i = 0; i < files.length; i++) {
   				       console.log(files[i]);
   				       formData.append("uploadfiles", files[i]);
   				       appended = true;
   			   	   }
			   }
               
               console.log("formData: " + formData); 
	           
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
	                	alert('수정 성공');
	                    $(location).attr('href', '${pageContext.request.contextPath}/board/magazine');                                        
	                },
	                error: function (e) {
	                    console.log(e);
	                    alert('수정 실패');
	  	            	location.reload(); // 실패시 새로고침하기
	               }
	           })            
	       });     
	   	});
	</script>
	
	<!-- 매거진 게시글 삭제 -->
	<script type="text/javascript">
		$(document).ready(function () {
			$('#magazine_delete').click(function(event) {
				event.preventDefault();
				
	    		var formData = new FormData(); // FormData 객체 생성
	    		
	    		// 이미지 파일
	    		var fileNoArry = new Array(); // 여러 파일번호를 담을 배열 생성
	     		var fileNameArry = new Array(); // 여러 파일명을 담을 배열 생성
	     		
	     		// uploadimagenumber 키워드가 붙은 class의 개수를 가져온다
	     		var imageCnt = $("[class*='uploadimagenumber']").length;
	     		console.log("imageCnt: " + imageCnt);
	     		
	     		// 이미지 개수만큼 해당 태그내의 요소 값을 배열안에 push한다
	     		for (var i = 0; i < imageCnt; i++) {
	     			var temp = i.toString();
	     			fileNoArry.push($('.uploadimagenumber'.concat(temp)).html());
		     		fileNameArry.push($('.deletefiles'.concat(temp)).html());
				}
	     		
	     		// push한 데이터 확인
	     		console.log("fileNoArry: " + fileNoArry);
     			console.log("fileNameArry: " + fileNameArry);
	     		
     			// 배열 길이만큼 formData에 해당 인덱스 값을 append한다
	     		for (var i = 0; i < fileNoArry.length; i++) {		
	     			formData.append("image_number", fileNoArry[i]);
	     			formData.append("deletefiles", fileNameArry[i]);
				}
	     		
	     		console.log("formData: " + formData);
	 
				$.ajax({
					type : 'DELETE', 
					url : $(this).attr("href"), 
					cache : false, 
	                processData: false, 
		    		contentType: false, 
	                data: formData, 
					success: function(result) {
						console.log(result);
						if(result == "SUCCESS") {
							alert("게시글을 삭제합니다.");
							$(location).attr('href', '${pageContext.request.contextPath}/board/magazine')
						}
					},
					error:function(e) {
						alert("게시글을 삭제할 수 없습니다.");
						console.log(e);
					}
				})
			});	
		});
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
			
			<form id="updateForm" action="${pageContext.request.contextPath}/admin/board/magazine/modify/${magazine_modify.board_id}" method="post">
				<!-- <s:csrfInput /> -->
				<input type="hidden" id="board_id" value="${magazine_modify.board_id}">
				<fieldset>
					<div class="row">
						<div class="col-md-2 contact-info" align="center">
							<legend>글번호</legend>
						</div>
						<div class="col-md-10 contact-info">
							<legend>${magazine_modify.board_id}</legend>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 contact-info" align="center">
							<legend>등록일</legend>
						</div>
						<div class="col-md-10 contact-info">
							<legend>${magazine_modify.board_date}</legend>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-2 contact-info" align="center">
							<legend>제목</legend>
						</div>
						<div class="col-md-10 contact-info">
							<input class="form-control" type="text" id="board_name" value="${magazine_modify.board_name}">
						</div>
					</div>
					<div class="row" style="padding: 3% 0px 3% 0px">
						<div class="col-md-2 contact-info" align="center">
							<legend>글내용</legend>
						</div>
						<div class="col-md-10 contact-info">
							<textarea class="form-control" cols="50%" rows="10" id="board_content">${magazine_modify.board_content}</textarea>
						</div>
					</div>
					<hr>
					<!-- 수정페이지에서 새로 추가되는 사진 -->
					<div class="row" style="padding: 5% 3% 3% 5%">
						<input type="file" accept=".jpg, .png" id="uploadfiles" name="uploadfiles" placeholder="첨부 사진" multiple/>
						<small class="form-text text-muted">jpg, png의 사진파일만 적용됩니다.</small>
					</div>
					<hr>
					<div class="container">
					<div id="image_container" class="row" style="padding: 5% 3% 3% 5%">
						<c:forEach items="${magazine_image}" var="image" varStatus="image_status">
							<!-- 이미지 컨테이너 -->
							<div class="col-md-2" align="center">
								<!-- 게시글을 삭제할 때 이미지도 삭제하기 위한 이미지 정보 -->
								<!-- varStatus="image_status"를 통해 해당 리스트의 인덱스를 class 이름 뒤에 붙인다 -->
								<span class="uploadimagenumber${image_status.index}" style="display: none;">${image.image_number}</span>
								<span class="deletefiles${image_status.index}" style="display: none;">${image.image_name}</span>				
								<div>
									<img src="/board_img/${image.image_name}" width="100px" height="140px">
									<button type="button" class="btn btn-danger img_del_only" data-rno="${image.image_name}">&#88;</button>					
									<!-- 매거진 사진만 삭제 -->
									<script type="text/javascript">
									$(document).ready(function (){
										$('.img_del_only').click(function(event){
											event.preventDefault();
											
											// FormData 객체 생성
											var formData = new FormData(); 
											
											// 해당 이미지를 감싸는 태그를 불러온다
											var trObj = $(this).parent().parent(); 
											console.log(trObj);
											
											// button의 data-rno 값을 가져온다
								     		var imageInfo = $(this).attr("data-rno");		
								     		console.log("imageInfo: " + imageInfo);
								     		
								 			// formData에 해당 값을 append한다
								 			formData.append("onedeletefiles", imageInfo);
								     		console.log("formData: " + formData);
								 
											$.ajax({
												type : 'DELETE', 
												url : $(this).attr("href"), 
												cache : false, 
								                processData: false, 
									    		contentType: false, 
								                data: formData, 
												success: function(result){
													console.log(result);
													$(trObj).remove(); // 해당 이미지 컨테이너 삭제
													console.log("IMAGE_REMOVED!")
												},
												error:function(e){
													console.log(e);
												}
											})
										});	
									});	
									</script>
								</div>
							</div>
						</c:forEach>	
					</div>
				</div>
				<hr>
				<div align="center" style="padding: 3% 0px 3% 0px;">
					<button type="button" id="magazine_delete" class="btn btn-danger">삭제하기</button>&nbsp;
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/magazine'">목록보기</button>&nbsp;
					<button type="submit" class="btn btn-primary">수정하기</button>
				</div>
				</fieldset>
			</form>
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