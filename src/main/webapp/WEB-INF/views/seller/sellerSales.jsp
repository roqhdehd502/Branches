<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>판매자 마이페이지</title>

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
	<header>
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>
	<div class="container">
		<span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
            <h3>${mbr.mbr_name }</h3>
            <h3 style="position: relative; top: 15px;">${mbr.mbr_id }</h3>
         </span>
         <span style="margin-left: 22px; position: relative; bottom: 10px;"> <a href="/seller/mypage/myinfo/${mbr.mbr_id }">정보수정</a></span> 
          <span style="margin-left: 300px;" align="center">
            <h2 style="position: relative; top: 5px;">새 주문</h2>
            <h4 style="position: relative; top: 15px;">${newOrder.order_state_number } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">취소</h2>
            <h4 style="position: relative; top: 15px;">${cancel.order_state_number } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">교환</h2>
            <h4 style="position: relative; top: 15px;">${change.order_state_number } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">환불</h2>
            <h4 style="position: relative; top: 15px;">${refund.order_state_number } 건</h4>
         </span>
      </div>
		
		<hr>

		<div class="container">
			<div class="row">
				<div class="col-md-2 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
						<h3>마이페이지</h3>
						<hr>
						<h5>
							<a href="/seller/mypage">홈 바로가기</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>주문 관리</h3>
						<hr>
						<h5>
							<a href="/seller/mypage/order">주문확인</a>
						</h5>
						<h5>
							<a href="/seller/mypage/release">발송확인</a>
						</h5>
						<h5>
							<a href="/seller/mypage/cancel">취소</a>
						</h5>
						<h5>
							<a href="/seller/mypage/exchange">교환</a>
						</h5>
						<h5>
							<a href="/seller/mypage/refund">환불</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>상품 관리</h3>
						<hr>
						<h5>
							<a href="/seller/mypage/prdct_register">등록</a>
						</h5>
						<h5>
							<a href="/seller/mypage/prdct">조회</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>회원 관리</h3>
						<hr>
						<h5>
							<a href="/seller/mypage/prdctqna">Q&A</a>
						</h5>
						<h5>
							<a href="/seller/mypage/review">리뷰</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>매출 관리</h3>
						<hr>
						<h5>
							<a href="/seller/mypage/sales">매출</a>
						</h5>
					</div>
				</div>

				<span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 922px;">
					<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 2px;">
						<strong style="margin: 10px;">매출조회</strong><hr />
					</h3>
					<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="faq">
								<span class="single-item">
									<h4 style="color: black; margin-left: 46px;">일간</h4>
									<div class="content">
									<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/chart/dailyChart.jsp"></jsp:include>
									</div>
								</span> 
								<span class="single-item">
									<h4 style="color: black; margin-left: 46px;">주간</h4>
									<div class="content">
									<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/chart/weeklyChart.jsp"></jsp:include>
									</div>
								</span> 
								<span class="single-item">
									<h4 style="color: black; margin-left: 46px;">월간</h4>
									<div class="content">
									<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/chart/monthChart.jsp"></jsp:include>
									</div>
								</span> 
								<span class="single-item">
									<h4 style="color: black; margin-left: 46px;">연간</h4>
									<div class="content">
									<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/chart/yearChart.jsp"></jsp:include>
									</div>
								</span> 
								<span class="single-item">
									<h4 style="color: black; margin-left: 46px;">전체</h4>
									<div class="content">
									<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/chart/allChart.jsp"></jsp:include>
									</div>
								</span>
							</div>
						</div>
					</div>
				</div>

				<hr style="margin-top: 1px;">
				<h3 style="margin-top: 25px; margin-left: 15px;">
					<strong style="margin: 10px;">검색어 순위 조회</strong><hr>
				</h3>
				
				</span>
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