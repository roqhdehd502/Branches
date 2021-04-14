<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : My Page</title>
	
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

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<!-- 왼쪽 사이드 메뉴  -->
				<div class="col-md-2 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
						<h3>나의</h3>
						<h3>쇼핑활동</h3>
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

				<span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 922px;">
					<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px; border-bottom: 1px solid rgba(0, 0, 0, .1);">
						<strong style="margin: 10px;">주문내역 미리보기</strong>
					</h3> <span style="margin: 20px;"> <img src="<c:url value="/hs/5.jpg"/>" width="140px" height="140px">
				</span> <span>
						<h5 style="position: relative; top: 10px;">Covernat</h5>
						<h5 style="position: relative; top: 20px;">21/22 FW 체크 셔츠 블루</h5>
				</span> <span style="float: right;">
						<h2 style="position: relative; top: 80px; float: right;">29,900₩</h2>
				</span><br /> <span style="margin-left: 20px; float: right;">
						<button class="btn btn-primary btn-sm" type="button">배송조회</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary btn-sm" type="button">상품교환</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary btn-sm" type="button">상품환불</button>
				</span><br />
				<hr style="margin-top: 34px;"> <span style="margin: 20px;"> <img src="<c:url value="/hs/5.jpg"/>" width="140px" height="140px">
				</span> <span>
						<h5 style="position: relative; top: 10px;">Covernat</h5>
						<h5 style="position: relative; top: 20px;">21/22 FW 체크 셔츠 블루</h5>
				</span> <span style="float: right;">
						<h2 style="position: relative; top: 80px; float: right;">29,900₩</h2>
				</span><br /> <span style="margin-left: 20px; float: right;">
						<button class="btn btn-primary btn-sm" type="button">배송조회</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary btn-sm" type="button">상품교환</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary btn-sm" type="button">상품환불</button>
				</span><br />
				<hr style="margin-top: 34px;"> <span style="margin: 20px;"> <img src="<c:url value="/hs/5.jpg"/>" width="140px" height="140px">
				</span> <span>
						<h5 style="position: relative; top: 10px;">Covernat</h5>
						<h5 style="position: relative; top: 20px;">21/22 FW 체크 셔츠 블루</h5>
				</span> <span style="float: right;">
						<h2 style="position: relative; top: 80px; float: right;">29,900₩</h2>
				</span><br /> <span style="margin-left: 20px; float: right;">
						<button class="btn btn-primary btn-sm" type="button">배송조회</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary btn-sm" type="button">상품교환</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary btn-sm" type="button">상품환불</button>
				</span><br />

					<hr style="margin-top: 34px;">
					<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px; border-bottom: 1px solid rgba(0, 0, 0, .1);">
						<strong style="margin: 20px;">장바구니</strong>
					</h3>
					<br />
					<form action="#" method="post">
						<span style="margin: 20px;"> <img src="<c:url value="/hs/5.jpg"/>" width="140px" height="140px">
						</span> <span>
							<h5 style="position: relative; top: 10px;">Balenciaga</h5>
							<h5 style="position: relative; top: 20px;">[단독]Denim Jaket & Pants</h5>
						</span> <span style="margin-left: 250px;">
							<h2 style="position: relative; top: 10px;">
								<input type="checkbox">&nbsp;&nbsp;&nbsp;30,000₩
							</h2>
						</span><br /> <span style="margin: 20px;"> <img src="<c:url value="/hs/5.jpg"/>" width="140px" height="140px">
						</span> <span>
							<h5 style="position: relative; top: 10px;">Balenciaga</h5>
							<h5 style="position: relative; top: 20px;">[단독]Denim Jaket & Pants</h5>
						</span> <span style="margin-left: 250px;">
							<h2 style="position: relative; top: 10px;">
								<input type="checkbox">&nbsp;&nbsp;&nbsp;29,000₩
							</h2>
						</span><br /> <span style="margin: 20px;"> <img src="<c:url value="/hs/5.jpg"/>" width="140px" height="140px">
						</span> <span>
							<h5 style="position: relative; top: 10px;">Balenciaga</h5>
							<h5 style="position: relative; top: 20px;">[단독]Denim Jaket & Pants</h5>
						</span> <span style="margin-left: 250px;">
							<h2 style="position: relative; top: 10px;">
								<input type="checkbox">&nbsp;&nbsp;&nbsp;29,000₩
							</h2>
						</span><br />

						<hr>
						<span> <span style="float: left; margin-left: 20px; margin-top: 14px;"><button class="btn btn-primary" type="submit">바로구매</button></span>
							<span style="margin-left: 640px"><h5>Total</h5>
								<h3>59,000₩</h3></span>
						</span>
					</form>
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
	</div>
</body>
</html>