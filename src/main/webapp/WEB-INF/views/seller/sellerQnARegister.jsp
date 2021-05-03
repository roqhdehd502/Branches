<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>판매자 상품Q&A 답변등록페이지</title>

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
<script src="/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 상품qna 판매자 댓글 작성 -->
	<script type="text/javascript">
	   	$(document).ready(function(){
	      $("#commentWriteForm").submit(function(event){         
	           event.preventDefault();
	           
	       	   // FormData 불러오기
	           var formData = new FormData();
	        
	           var mbr_id = $("#mbr_id").val();
	           var board_id = $("#board_id").val();
	           var comment_content = $("#comment_content").val();
	           
	           console.log(mbr_id);
	           console.log(board_id);
	           console.log(comment_content);
	           console.log($(this).attr("action"));    
	           
	        	// 해당 텍스트들을 FormData에 append
	           formData.append("mbr_id", mbr_id);
	           formData.append("board_id", board_id);
	           formData.append("comment_content", comment_content);
	
	           $.ajax({
	             type : "POST",
	             url : $(this).attr("action"),
	             cache : false,
	             contentType:'application/json; charset=utf-8',
	             contentType: false,
	             processData: false, 
	             data: formData, 
	             beforeSend : function(xhr) {
						xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
	             },
	             success: function (result) {       
	            	 if (confirm("댓글을 작성하시겠습니까??") == true) {
		        			console.log("SUCCESS!")  
		        			$(location).attr('href', '${pageContext.request.contextPath}/seller/mypage/prdctqna');
		        		}else {
							return;
						}                     
	             },
	             error: function (e) {
	                 console.log(e);
	                 alert('댓글 업로드에 실패하였습니다.');
	                 location.reload(); // 실패시 새로고침하기
	             }
	         })            
	       });       
	   	});
	</script>
</head>
<body>
<div style="overflow: hidden;" class="container">
	<header>
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>
		<div class="container">
			<span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
				<h3>${mbr.mbr_name }</h3>
            	<h3 style="position: relative; top: 15px;">${mbr.mbr_id }</h3>
			</span>
			<span style="margin-left: 22px; position: relative; bottom: 10px;">
				<a href="/seller/mypage/myinfo/${mbr.mbr_id }">정보수정</a>
			</span>
			 <span style="margin-left: 300px;" align="center">
            <h2 style="position: relative; top: 5px;">새 주문</h2>
            <h4 style="position: relative; top: 15px;">${orderCount } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">취소</h2>
            <h4 style="position: relative; top: 15px;">${cancelCount } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">교환</h2>
            <h4 style="position: relative; top: 15px;">${exchangeCount } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">환불</h2>
            <h4 style="position: relative; top: 15px;">${refundCount } 건</h4>
         </span>
		</div>
		
		<hr style="margin: 15px 15px 24px 15px;">

		<div class="container">
			<div class="row">
				<div class="col-md-2 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
	                    <h3>마이페이지</h3><hr>
	                    <h5><a href="/seller/mypage">홈 바로가기</a></h5>
	                </div>
					<div class="single-info" style="margin-bottom: 40px">
	                    <h3>주문 관리</h3><hr>
	                    <h5><a href="/seller/mypage/order">주문확인</a></h5>
	                    <h5><a href="/seller/mypage/release">발송확인</a></h5>
	                    <h5><a href="/seller/mypage/cancel">취소</a></h5>
	                    <h5><a href="/seller/mypage/exchange">교환</a></h5>
	                    <h5><a href="/seller/mypage/refund">환불</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>상품 관리</h3><hr>
	                    <h5><a href="/seller/mypage/${mbr.mbr_id}/prdct_register">등록</a></h5>
	                    <h5><a href="/seller/mypage/prdct">조회</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>회원 관리</h3><hr>
	                    <h5><a href="/seller/mypage/prdctqna">Q&A</a></h5>
	                    <h5><a href="/seller/mypage/review">리뷰</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>매출 관리</h3><hr>
	                    <h5><a href="/seller/mypage/sales">매출</a></h5>
	                </div>
				</div>
					
				<!-- 등록한 상품 리스트	 -->
				<div class="col-md-10 contact-info" style="border-left: 1px solid rgba(0,0,0,.1) ;">
					<h3 >
					<strong>상품 Q&A 답변등록</strong>
					</h3><hr>
					<h4> 문의사항 </h4><hr />
					<input type="hidden" name="board_id" id="board_id" value="${board.board_id }">
						<div class="form-group row">
							<label class="col-sm-2 col-form-label"><h5>제목</h5></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="board_name" id="board_name" value="${board.board_name }" disabled="disabled">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label"><h5>작성자</h5></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="board_name" id="board_name" value="${board.mbr_id }" disabled="disabled">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label"><h5>작성일</h5></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="board_name" id="board_name" value="${board.board_date }" disabled="disabled">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label"><h5>문의유형</h5></label>
							<div class="col-sm-10">
								<c:choose>
									<c:when test="${board.inquiry_number eq 1}">
										<input type="text" class="form-control" name="inquiry_name" id="inquiry_name" value="교환" disabled="disabled">
									</c:when>
									<c:when test="${board.inquiry_number eq 2}">
										<input type="text" class="form-control" name="inquiry_name" id="inquiry_name" value="환불" disabled="disabled">
									</c:when>
									<c:when test="${board.inquiry_number eq 3}">
										<input type="text" class="form-control" name="inquiry_name" id="inquiry_name" value="배송전취소" disabled="disabled">
									</c:when>
									<c:when test="${board.inquiry_number eq 4}">
										<input type="text" class="form-control" name="inquiry_name" id="inquiry_name" value="배송" disabled="disabled">
									</c:when>
									<c:when test="${board.inquiry_number eq 5}">
										<input type="text" class="form-control" name="inquiry_name" id="inquiry_name" value="불량" disabled="disabled">
									</c:when>
									<c:when test="${board.inquiry_number eq 6}">
										<input type="text" class="form-control" name="inquiry_name" id="inquiry_name" value="주문 및 결제" disabled="disabled">
									</c:when>
									<c:when test="${board.inquiry_number eq 7}">
										<input type="text" class="form-control" name="inquiry_name" id="inquiry_name" value="상품 및 재입고" disabled="disabled">
									</c:when>	
									<c:otherwise>
										<input type="text" class="form-control" name="inquiry_name" id="inquiry_name" value="기타" disabled="disabled">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label"><h5>내용</h5></label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="5" name="board_content" id="board_content" disabled="disabled">${board.board_content }</textarea>
								<script>
										//id가 description인 태그에 ckeditor를 적용시킴
										//CKEDITOR.replace("description"); //이미지 업로드 안됨
										
										var editor2 = CKEDITOR.replace("board_content", {
											filebrowserUploadUrl : "${pageContext.request.contextPath}/seller/imageUpload.do",
											height : 500
										});	
										
								</script>
							</div>
						</div><hr />
					<c:if test="${prdctq_cmnt_stat.comment_count eq 0 }">	
					<div class="form-group row">
						<label class="col-sm-2 col-form-label"><h5>답변등록</h5></label>
						<form id="commentWriteForm" method="post" action="${pageContext.request.contextPath}/seller/mypage/prdctqna/${board.board_id}/register">
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" /> 
							<input type="hidden" id="mbr_id" name="mbr_id" value="${mbr.mbr_id}"> 
							<input type="hidden" id="board_id" name="board_id" value="${board.board_id}">

							<div class="container">
								<div class="row" style="padding: 5% 3% 3% 5%">
									<div class="col-md-10" align="left">
										<textarea class="form-control" cols="100" id="comment_content" name="comment_content" placeholder="댓글을 남겨주세요"></textarea>
									</div>
									<div class="col-md-2" align="center">
										<button type="submit" class="btn btn-primary">등록</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					</c:if>
					<c:if test="${prdctq_cmnt_stat.comment_count eq 1 }">	
					<!-- 댓글 불러오기 -->
					<div class="container">
						<c:forEach items="${comment}" var="comment" varStatus="cmnt_status">
							<div style="margin: 1% 3% 1% 3%; padding: 1% 3% 1% 3%; border: 1px solid #E5E5E5;">
								<div style="white-space: pre; overflow-x: hidden;">${comment.comment_content}</div>
								<div class="col-md-12" align="right">
									${comment.comment_date}
								</div><br/>
								<span align="left">
									<button type="button" class="btn btn-danger btn-sm cmnt_del" data-rno="${comment.comment_id}">삭제하기</button>
								</span>
								
													<%-- 댓글 삭제 --%>
													<script type="text/javascript">
														$(document).ready(function (){
															$('.cmnt_del').click(function(event){
																event.preventDefault();
																
																if (confirm("댓글을 삭제하시겠습니까?")) {
																	// FormData 객체 생성
																	var formData = new FormData(); 
														     		
																	// button의 data-rno 값을 가져온다
														     		var cmntInfo = $(this).attr("data-rno");		
														     		console.log("cmntInfo: " + cmntInfo);
														     		
														 			// formData에 해당 값을 append한다
														 			formData.append("comment_id", cmntInfo);
														     		console.log("formData: " + formData);
														 
																	$.ajax({
																		type : 'DELETE', 
																		url : $(this).attr("href"), 
																		cache : false, 
														                processData: false, 
															    		contentType: false, 
														                data: formData, 
														                beforeSend : function(xhr) {
																			xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
														             	},
																		success: function(result){
																			console.log(result);
																			$(location).attr('href', '${pageContext.request.contextPath}/seller/mypage/prdctqna/${board.board_id}')
																			console.log("COMMENT_REMOVED!")
																		},
																		error:function(e){
																			console.log(e);
																		}
																	})
																} else {
																	location.reload();
																}
															});	
														});	
													</script>
											
									</div>
							</c:forEach>
						</div>
					</c:if>
					
				</div>
			</div>
		</div>
		<br/><br/><br/>
		
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