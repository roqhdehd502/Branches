<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Like Product</title>
	
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
				<div class="col-md-2 contact-info" align="center" style="padding-right: 10px">
					<h2>Point</h2>
					<h3>${mbr.mbr_point}</h3>
				</div>
			</div>
			<span style="margin-left: 14px;"> </span> <span style="margin-left: 400px;" align="center"> </span>
		</div>
		<!-- <div class="container">
			<span style="margin-left: 70px;"> </span> <span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
				<h3>닉네임</h3>
			</span>
			<span style="margin-left: 22px; position: relative; bottom: 2px;"> <a href="#">정보수정</a></span> <span style="margin-left: 372px;">
				<h4 style="position: relative; top: 10px; margin-left: 10px;">포인트</h4>
				<h2 style="position: relative; top: 30px;">1000p</h2>
			</span> <span style="margin-left: 142px;">
				<h4 style="position: relative; top: 10px;">쿠폰</h4>
				<h2 style="position: relative; top: 30px; margin-left: 15px;">1</h2>
			</span>
		</div> -->

		<hr style="margin: 15px 15px 40px 15px;">
	
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
							<a href="${pageContext.request.contextPath}/member/mypage/recently">최근 본 상품보기</a>
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

				<!-- 오른쪽 컨텐츠 내용 -->
				<span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 822px;">
					<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px; border-bottom: 1px solid rgba(0, 0, 0, .1);">
						<strong style="margin: 10px;">찜한 목록</strong>
					</h3>
					<div class="team-area sp">
						<div class="container">
							<div class="row">
								<%-- <c:forEach var="${like_prdct_list}" items="like"> --%>
								<div class="col-sm-6 col-md-4 col-lg-3 single-team">
									<div class="inner">
										<div class="team-img">
											<img src="/ksp/th-ex.jpg" alt="Member Photo">
										</div>
										<div class="team-content">
											<h4>상품명</h4>
											<h5>브랜드</h5>
											<h5>$100</h5>
										</div>
									</div>
								</div>
								<%-- </c:forEach> --%>
								
								<!-- <div class="col-sm-6 col-md-4 col-lg-3 single-team">
									<div class="inner">
										<div class="team-img">
											<img src="/ksp/th-ex.jpg" alt="Member Photo">
										</div>
										<div class="team-content">
											<h4>상품명</h4>
											<h5>브랜드</h5>
											<h5>$100</h5>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-3 single-team">
									<div class="inner">
										<div class="team-img">
											<img src="/ksp/th-ex.jpg" alt="Member Photo">
										</div>
										<div class="team-content">
											<h4>상품명</h4>
											<h5>브랜드</h5>
											<h5>$100</h5>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-3 single-team">
									<div class="inner">
										<div class="team-img">
											<img src="/ksp/th-ex.jpg" alt="Member Photo">
										</div>
										<div class="team-content">
											<h4>상품명</h4>
											<h5>브랜드</h5>
											<h5>$100</h5>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-3 single-team">
									<div class="inner">
										<div class="team-img">
											<img src="/ksp/th-ex.jpg" alt="Member Photo">
										</div>
										<div class="team-content">
											<h4>상품명</h4>
											<h5>브랜드</h5>
											<h5>$100</h5>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-3 single-team">
									<div class="inner">
										<div class="team-img">
											<img src="/ksp/th-ex.jpg" alt="Member Photo">
										</div>
										<div class="team-content">
											<h4>상품명</h4>
											<h5>브랜드</h5>
											<h5>$100</h5>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-3 single-team">
									<div class="inner">
										<div class="team-img">
											<img src="/ksp/th-ex.jpg" alt="Member Photo">
										</div>
										<div class="team-content">
											<h4>상품명</h4>
											<h5>브랜드</h5>
											<h5>$100</h5>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-3 single-team">
									<div class="inner">
										<div class="team-img">
											<img src="/ksp/th-ex.jpg" alt="Member Photo">
										</div>
										<div class="team-content">
											<h4>상품명</h4>
											<h5>브랜드</h5>
											<h5>$100</h5>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-3 single-team">
									<div class="inner">
										<div class="team-img">
											<img src="/ksp/th-ex.jpg" alt="Member Photo">
										</div>
										<div class="team-content">
											<h4>상품명</h4>
											<h5>브랜드</h5>
											<h5>$100</h5>
										</div>
									</div>
								</div> -->
							</div>
						</div>
					</div>
				</span>
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
</body>
</html>