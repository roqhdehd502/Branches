<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Notice Board Modify</title>
	
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
	
	<!-- 수정 폼 스크립트 -->
	<script type="text/javascript">
	   	$(document).ready(function(){
	      $("#updateForm").submit(function(event){         
	           event.preventDefault();     
	           var board_id = $("#board_id").val();
	           var board_name = $("#board_name").val();
	           var board_content = $("#board_content").val();              
	           
	           console.log(board_id);
	           console.log(board_name);
	           console.log(board_content);
	           console.log($(this).attr("action"));    
	           
	           var form = {
	        		 board_id: board_id,
	        		 board_name: board_name,
	        		 board_content: board_content
	           };
	           $.ajax({
	             type : "POST",
	             url : $(this).attr("action"),
	             cache : false,
	             contentType:'application/json; charset=utf-8', // 인코딩 데이터 변환
	             data: JSON.stringify(form), // 보안 문제 해결을 위해 stringify 메소드를 사용
	             success: function (result) {       
	               if(result == "SUCCESS"){
	                  // update가 완료되었으면 리스트 페이지로 이동        
	                  $(location).attr('href', '${pageContext.request.contextPath}/board/notice')                            
	               }                       
	             },
	             error: function (e) {
	                 console.log(e);
	                 alert('수정에 실패하였습니다.');
	                 location.reload(); // 실패시 새로고침하기
	             }
	         })            
	       }); // end submit()       
	   	}); // end ready()
	</script>
	
	<!-- 게시글 삭제 -->
	<script type="text/javascript">
		$(document).ready(function (){
			$('#delete').click(function(event){
				event.preventDefault();
				console.log("ajax 호출전");		
	 
				$.ajax({
					type : 'DELETE',
					url : $(this).attr("href"),
					cache : false,
					success: function(result){
						console.log(result);
						if(result == "SUCCESS"){
							$(location).attr('href', '${pageContext.request.contextPath}/board/notice') 
						}
					},
					error:function(e){
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
			<div class="container" style="padding-bottom: 1%">
				<h2>NOTICE</h2>
			</div>
			<hr>
			<form id="updateForm" action="${pageContext.request.contextPath}/board/notice/modify/${notice_modify.board_id}" method="post">
				<input type="hidden" id="board_id" value="${notice_modify.board_id}">
				<fieldset>
					<div class="row">
						<div class="col-md-2 contact-info" align="center">
							<legend>글번호</legend>
						</div>
						<div class="col-md-10 contact-info">
							<legend>${notice_modify.board_id}</legend>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 contact-info" align="center">
							<legend>등록일</legend>
						</div>
						<div class="col-md-10 contact-info">
							<legend>${notice_modify.board_date}</legend>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-2 contact-info" align="center">
							<legend>제목</legend>
						</div>
						<div class="col-md-10 contact-info">
							<input class="form-control" type="text" id="board_name" value="${notice_modify.board_name}">
						</div>
					</div>
					<div class="row" style="padding: 3% 0px 3% 0px">
						<div class="col-md-2 contact-info" align="center">
							<legend>글내용</legend>
						</div>
						<div class="col-md-10 contact-info">
							<textarea class="form-control" cols="50%" rows="10" id="board_content">${notice_modify.board_content}</textarea>
						</div>
					</div>
					<hr>
					<div align="center" style="padding: 3% 0px 3% 0px;">
						<button type="button" id="delete" class="btn btn-danger">삭제하기</button>&nbsp;
						<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/notice'">목록보기</button>&nbsp;
						<button type="submit" class="btn btn-primary">수정하기</button>
					</div>
				</fieldset>
			</form>
			
		</div>
	<!-- </div> -->

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