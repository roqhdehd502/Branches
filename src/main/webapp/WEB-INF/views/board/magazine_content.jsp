<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%-- <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%> --%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Magazine Board Content</title>
	
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
	
	<!-- AJAX용 JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- 매거진 게시글 추천 -->
	<script type="text/javascript">
		$(document).ready(function () {
			$('#magazine_uplike').click(function(event) {
				event.preventDefault();
	 
				$.ajax({
					type : 'PUT',
					url : $(this).attr("href"),
					cache : false,
					success: function(result) {
						console.log(result);
						if(result == "SUCCESS") {
							$(location).attr('href', '${pageContext.request.contextPath}/board/magazine/${magazine_content.board_id}'); 
						}
					},
					error:function(e){
						console.log(e);
						alert('추천할 수 없습니다.');
		                location.reload(); // 실패시 새로고침하기
					}
				})
			});	
		});	
	</script>
	
	<!-- 매거진 댓글 작성 -->
	<script type="text/javascript">
	   	$(document).ready(function(){
	      $("#commentWriteForm").submit(function(event){         
	           event.preventDefault();
	           var mbr_id = $("#mbr_id").val();
	           var board_id = $("#board_id").val();
	           var comment_content = $("#comment_content").val();
	           
	           console.log(mbr_id);
	           console.log(board_id);
	           console.log(comment_content);
	           console.log($(this).attr("action"));    
	           
	           var form = {
	        		board_id: board_id,
	        		mbr_id: mbr_id, 
	        		comment_content: comment_content
	           };
	
	           $.ajax({
	             type : "POST",
	             url : $(this).attr("action"),
	             cache : false,
	             contentType:'application/json; charset=utf-8',
	             data: JSON.stringify(form), 
	             /* beforeSend : function(xhr) {
						xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
	             }, */
	             success: function (result) {       
	               if(result == "SUCCESS"){     
	                  $(location).attr('href', '${pageContext.request.contextPath}/board/magazine/${magazine_content.board_id}')                            
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
	
	<!-- content image hover -->
	<style type="text/css">
		.con_img:hover {
			background-color: #e0e0e0;
			border: 15px solid #e0e0e0;
			border-radius: 5px;
		}
	</style>	
</head>
<body>
	<div style="overflow: hidden;" class="container">
	<!-- header -->
	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<!-- 매거진 기본 정보 -->
			<div class="container" align="center">
				<div><h2>${magazine_content.board_name}</h2></div>
				<div>
					<label>
						${magazine_content.board_date}&nbsp;|&nbsp;
						조회수: ${magazine_content.board_hit}&nbsp;|&nbsp;
						추천수: ${magazine_content.board_like}
					</label>
				</div>
			</div>
			
			<hr>
			
			<!-- 매거진 글내용 -->	
			<div class="container">
				<div class="row" style="padding: 3% 3% 5% 3%">		
					<div class="col-md-12" style="padding: 2% 3% 3% 3%">
						<p class="lead" style="white-space:pre;">${magazine_content.board_content}</p>
					</div>
				</div>
			</div>
					
			<hr>
			
			<!-- 권한에 따라 버튼을 달리 보이게 한다 -->
			<!-- 모든 사용자 -->
			<sec:authorize access="isAnonymous()"> 
			<div align="center" style="padding: 3% 5% 3% 5%">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/magazine'">목록보기</button>&nbsp;
				<button type="button" id="magazine_uplike" class="btn btn-primary">추천하기</button>
			</div>
			</sec:authorize>
			<!-- 회원일 경우 -->
			<sec:authorize access="hasAuthority('MEMBER')">  
			<div align="center" style="padding: 3% 5% 3% 5%">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/magazine'">목록보기</button>&nbsp;
				<button type="button" id="magazine_uplike" class="btn btn-primary">추천하기</button>	
			</div>
			</sec:authorize>
			<!-- 판매자일 경우 -->
			<sec:authorize access="hasAuthority('SELLER')">  
			<div align="center" style="padding: 3% 5% 3% 5%">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/magazine'">목록보기</button>&nbsp;
				<button type="button" id="magazine_uplike" class="btn btn-primary">추천하기</button>	
			</div>
			</sec:authorize>
			<!-- 관리자일 경우 -->
			<sec:authorize access="hasAuthority('ADMIN')">  
			<div align="center" style="padding: 3% 5% 3% 5%">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/magazine'">목록보기</button>&nbsp;
				<button type="button" id="magazine_uplike" class="btn btn-primary">추천하기</button>&nbsp;
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/board/magazine/modify/${magazine_content.board_id}'">수정하기</button>	
			</div>
			</sec:authorize>	
			
			<hr>
			
			<!-- 댓글 작성 -->
			<!-- 로그인을 하지 않았을 경우 -->
			<sec:authorize access="isAnonymous()">
			<c:choose>
				<%-- View에서도 null값 이중체크를 한다 --%>
				<c:when test="${empty mbr.mbr_id}">
					<form method="post" action="#">		
						<div class="container">
							<div class="row" style="padding: 5% 3% 3% 5%">
								<div class="col-md-10" align="left">
									<textarea class="form-control" cols="3" placeholder="로그인한 회원만 작성 가능합니다" disabled></textarea>		
								</div>
								<div class="col-md-2" align="center">
									<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
								</div>
							</div>
						</div>
					</form>
			 	</c:when>
			</c:choose>
			</sec:authorize>	 
			<!-- 로그인을 했을 경우 -->
			<sec:authorize access="isAuthenticated()"> 
			<form id="commentWriteForm" method="post" action="${pageContext.request.contextPath}/board/magazine/${magazine_content.board_id}">		
				<!-- <s:csrfInput /> -->
				<input type="hidden" id="mbr_id" value="${mbr.mbr_id}">
				<input type="hidden" id="board_id" value="${magazine_content.board_id}">
				
				<div class="container">
					<div class="row" style="padding: 5% 3% 3% 5%">
						<div class="col-md-10" align="left">
							<textarea class="form-control" cols="3" id="comment_content" name="comment_content" placeholder="댓글을 남겨주세요"></textarea>		
						</div>
						<div class="col-md-2" align="center">
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</div>
				</div>
			</form>
			</sec:authorize>
			
			<hr>
			
			<!-- 댓글 불러오기 -->
			<div class="container">
				<div class="container">
					<div class="row" style="padding: 3% 3% 3% 3%">
						<div class="col-md-5" align="center">
						</div>
						<div class="col-md-2" align="center" style="border: 1px solid #e5e5e5; padding-top: 1%">
							<h4>댓글</h4>
							<h4>${magazine_comment_cnt.comment_count}</h4>
						</div>
						<div class="col-md-5" align="center">
						</div>
					</div>
				</div>
				
				<!-- 댓글 리스트 -->
				<c:forEach items="${magazine_comment}" var="comment" varStatus="cmnt_status">
				<div class="row" style="margin: 1% 3% 1% 3%; padding: 1% 3% 1% 3%; border: 1px solid #E5E5E5;">
					<div class="col-md-7" align="left">
						<p>${comment.mbr_nickname}</p>
						<p class="lead" style="white-space:pre;">${comment.comment_content}</p>
					</div>
					<div class="col-md-4" align="right">
						<div class="lead">${comment.comment_date}</div>				
					</div>
					
					<div class="col-md-1" align="right">
						<c:choose>
							<%-- 댓글 작성자가 로그인 한 회원과 일치하지 않을 때 --%> 
						    <c:when test="${mbr.mbr_id ne comment.mbr_id}">
						    	<button type="button" class="btn btn-outline-primary" disabled>
									...
								</button>  
						    </c:when>
						    <%-- 댓글 작성자가 로그인 한 회원과 일치 할 때 --%> 
						    <c:otherwise>
								<%-- 모달을 열기 위한 버튼 --%> 
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdal${comment.comment_id}">
									...
								</button>
								<%-- 모달 영역 --%> 
								<div class="modal fade myModal" id="mdal${comment.comment_id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&#88;</span></button>
											</div>
											<div class="modal-body">
												<p class="lead" align="left">${comment.comment_content}</p>
											</div>
											<div class="modal-footer">
												<div align="left">
													<button type="button" class="btn btn-danger cmnt_del" data-rno="${comment.comment_id}">삭제하기</button>
													<%-- 매거진 댓글 삭제 --%>
													<script type="text/javascript">
														$(document).ready(function (){
															$('.cmnt_del').click(function(event){
																event.preventDefault();
																
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
																	success: function(result){
																		console.log(result);
																		$(location).attr('href', '${pageContext.request.contextPath}/board/magazine/${magazine_content.board_id}')
																		console.log("COMMENT_REMOVED!")
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
										</div>
									</div>
								</div>
						    </c:otherwise>
						</c:choose>	    
					</div>
				</div>
				</c:forEach>		
			</div>
			
			<!-- 페이징 -->	
			<div class="container">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
						<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
						<li class="page-item ${pageMaker.cri.pageNum == idx ? 'active' : '' }"><a class="page-link" href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item disabled"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
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
      
	  <!-- 채널 봇 챗봇 -->
	  <script src="/js/channelIO.js"></script>      
    </div>
</body>
</html>