<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : My Product QNA Content</title>
	
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
	
	<!-- 달력으로 날짜 선택 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<!-- <script type="text/javascript">
		    $(document).ready(function () {
		            $.datepicker.setDefaults($.datepicker.regional['ko']); 
		            $( "#birthDate" ).datepicker({
		                 changeMonth: true, 
		                 changeYear: true,
		                 nextText: '다음 달',
		                 prevText: '이전 달', 
		                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                 dateFormat: "yymmdd",
		                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
		                     
		 
		            });
		             
		    });
	</script> -->
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">

		<!-- 상단 회원 정보 요약 -->
		<div class="container">
			<div class="row" style="height: 50px;">
				<div class="col-md-3 contact-info" align="left" style="padding-left: 15px; margin-top: 10px; text-align: center;">
					<h2>${mbr.mbr_name}</h2>
				</div>
				<div class="col-md-1 contact-info" style="padding-top: 20px;">
					<a href="${pageContext.request.contextPath}/member/mypage/myinfo">정보수정</a>
				</div>
				<div class="col-md-6 contact-info"></div>
				<div class="col-md-2 contact-info" align="center" style="position: relative; bottom: 10px; right: 10px;">
					<h2>Point</h2>
					<h3>${mbr.mbr_point}</h3>
				</div>
			</div>
			<span style="margin-left: 14px;"> </span> <span style="margin-left: 400px;" align="center"> </span>
		</div>

		<hr style="margin: 15px 15px 40px 15px;">


		<!-- 리뷰 페이지 tab -->
		<div class="container">
			<div class="row">
				<!-- 왼쪽 사이드 메뉴  -->
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
						<h3>나의 쇼핑활동</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/order">주문내역 조회</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/recently">최근 본 상품</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/like">찜한 목록</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>매거진</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/board/magazine">매거진</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>내가 쓴 글보기</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/review/list">구매후기</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/prdctq/list">상품문의</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/myqna/list">고객Q&A</a>
						</h5>
					</div>
				</div>

				<!-- 오른쪽 본문 -->
				<div class="col-md-9 contact-info">
					<%-- <div class="container">
						<!-- QNA 제목 -->
						<div class="container">
							<div class="row justify-content-center">
								<h3>
									<strong>상품 Q&A 제목</strong>
								</h3>
							</div>
							<div class="row justify-content-center">
								<label>
									2021-04-22&nbsp;|&nbsp;
									교환<!-- DB 데이터 넣으면 아래의 c:choose문 주석해제해서 수정 -->
									<c:choose>
										<c:when test="${list.inquiry_number eq 1}">
											교환
										</c:when>
										<c:when test="${list.inquiry_number eq 2}">
											환불
										</c:when>
										<c:when test="${list.inquiry_number eq 3}">
											배송전취소
										</c:when>
										<c:when test="${list.inquiry_number eq 4}">
											배송
										</c:when>
										<c:when test="${list.inquiry_number eq 5}">
											불량
										</c:when>
										<c:when test="${list.inquiry_number eq 6}">
											주문및결제
										</c:when>
										<c:when test="${list.inquiry_number eq 7}">
											상품및재입고
										</c:when>	
										<c:otherwise>
											기타
										</c:otherwise>
									</c:choose>	
								</label>
							</div>
						</div>
						
						<hr>
					
						<!-- QNA 본문 -->
						<div class="container">
							<div class="row" style="padding: 5% 3% 3% 5%">
								<p style="white-space: pre;">${iBoard.board_content}</p>
							</div>
						</div>
					</div> --%>

					<h3>
						<strong>내가 쓴 상품 Q&A</strong>
					</h3>
					<hr>
					Tab panes
					<div class="tab-content">
						<div id="review" class="container tab-pane active">
							<br>
							<div class="container">
								<div class="section-title" data-margin="0 0 40px">
									리뷰 틀
									<div class="card bg-light mb-3" style="max-width: 1000px;">
										<div class="card-header">
											<div class="postContents container style_est_cont">
												<div class="profile" style="text-align: left; align-content: center;">
													<p>
														<span class="gallery_lv"> <span class="notCrawlText" style="font-weight: bold;">Silver(등급)&nbsp;dododndn(아이디)</span>
														</span> <span class="date last" style="clear: left; float: right;"> 12시간 전 </span>
												</div>
												<div class="connect_review_info" style="align-content: center;">
													리뷰사진
													<div class="pContent_Img img3 photoReview" style="width: 50px; height: 50px; float: left;">
														<img class="gallery-images" src="https://image.msscdn.net/images/goods_img/20200820/1557658/1557658_2_500.jpg"
															alt="디스이즈네버댓(THISISNEVERTHAT) INTL. Logo Crewneck Black 후기">
													</div>
													상품명
													<div style="float: left;">
														<a class="list_info p_name" href="#"> &nbsp;INTL. Logo Crewneck Black </a>
													</div>
												</div>
												</p>

											</div>
										</div>
									</div>
									<div class="card-body" style="text-align: left;">
										관련 상품
										<div class="connect_product estimate-item"></div>

										<div class="pContent">
											요약보기
											<div class="summary" style="cursor: pointer;">
												<div class="cArea">

													<div class="pContent_text">
														<span class="content-review"> 재입고 언제되나요 </span>
													</div>
												</div>
											</div>
										</div>
										</br> 댓글달기 구현
										<div class="form-group row">
											<input class="text col-sm-10" id="replyInput" placeholder="댓글을 입력하세요.">
											<button type="button" class="btn btn-primary">댓글달기</button>
										</div>

									</div>

									<hr>

								</div>
							</div>
							<br>
						</div>
					</div>
				</div>

			</div>





		</div>

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