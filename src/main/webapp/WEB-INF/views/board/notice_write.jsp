<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%> --%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Notice Board Write</title>
	
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
	
	<!-- CKEditor 적용 -->
	<script src="/ckeditor/ckeditor.js"></script>	
	
	<!-- AJAX 처리용 JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- 작성 폼 스크립트 -->
	<script type="text/javascript">
   	$(document).ready(function(){
      $("#writeForm").submit(function(event){         
           event.preventDefault();
           var mbr_id = $("#mbr_id").val();
           var board_name = $("#board_name").val();
           var board_content = CKEDITOR.instances.board_content.getData();  
           
           console.log(mbr_id);
           console.log(board_name);
           console.log(board_content);
           console.log($(this).attr("action"));    
           
           var form = {
        		 mbr_id: mbr_id,
                 board_name: board_name,
                 board_content: board_content
           };
           $.ajax({
             type : "POST",
             url : $(this).attr("action"),
             cache : false,
             contentType:'application/json; charset=utf-8',
             data: JSON.stringify(form), 
             beforeSend : function(xhr) {
				xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
      		 }, 
             success: function (result) {       
               if(result == "SUCCESS") {
            	  alert('업로드 성공'); 
                  $(location).attr('href', '${pageContext.request.contextPath}/board/notice')                            
               }                       
             },
             error: function (e) {
                 console.log(e);
                 alert('업로드 실패');
                 location.reload(); // 실패시 새로고침하기
             }
         })            
       });       
   	});
	</script>
	
	<!-- 반응형 사이즈 조절 -->
	<link rel="stylesheet" href="/css/reactive_size.css">		
</head>
<body>
	<div style="overflow: hidden;" class="container">
	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="container">
				<h2>NOTICE</h2>
			</div>
			<hr>
			<div class="container">
				<form id="writeForm" method="post" action="${pageContext.request.contextPath}/admin/board/notice/write">
					<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
					<input type="hidden" id="mbr_id" value="${mbr.mbr_id}">
					<fieldset>
						<div class="row">
							<div class="col-md-2 contact-info" align="center">
								<legend>글제목</legend>
							</div>
							<div class="col-md-10 contact-info">
								<input class="form-control" type="text" id="board_name" name="board_name" placeholder="글제목을 입력하세요">
							</div>
						</div>
						<div class="row" style="padding: 3% 0px 3% 0px">
							<div class="col-md-2 contact-info" align="center">
								<legend>글내용</legend>
							</div>
							<div class="col-md-10 contact-info">
								<textarea class="form-control" cols="3" id="board_content" name="board_content" placeholder="글내용을 입력하세요"></textarea>
								<script>
									//id가 description인 태그에 ckeditor를 적용시킴
									//CKEDITOR.replace("description"); //이미지 업로드 안됨				
									CKEDITOR.replace("board_content", {
										filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/board/boardImageUpload.do"
									});						
								</script>
							</div>
						</div>	
						<div align="center" style="padding: 3% 0px 3% 0px;">
							<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/notice'">목록보기</button>&nbsp;
							<button type="submit" class="btn btn-primary">작성하기</button>
						</div>	
					</fieldset>
				</form>
			</div>
		</div>

	  <hr>

	  <!-- footer -->
      <jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
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
</body>
</html>