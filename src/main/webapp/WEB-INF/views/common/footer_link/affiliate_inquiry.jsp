<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Affiliate Inquiry</title>
	
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
	
	<!-- 반응형 사이즈 조절 -->
	<link rel="stylesheet" href="/css/reactive_size.css">
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="container">
				<div class="row">
					<div class="col-md-6 contact-info subheading_font" align="left">
						<h2>제휴문의</h2>
					</div>
					<div class="col-md-6 contact-info" align="right"></div>
				</div>
			</div>

			<hr>

			<div class="container">
				<div class="row">
					<div class="row">
						<p class="lead">브랜치스는 서브컬처, 디자이너, 하우스 브랜드 등 다양한 패션 상품을 다루는 온라인 셀렉트숍입니다. 브랜드 입점을 원하시는 분들은 아래 내용을 참고하신 후, 상담 요청을 각 항목에 맞게 작성 부탁드립니다.</p>
					</div>
					<div class="row">
						<ol class="list-group">
							<li class="list-group-item">브랜치스는 정품을 판매하고 취급하는 업체 및 브랜드만 입점이 가능합니다.</li>
							<li class="list-group-item">입점 문의 상으로 기재해주신 내용을 토대로, 내부 검토 후에 입점 가능 여부 및 절차를 안내해드립니다. (고객센터, 별도 메일을 통한 문의 및 접수 불가)</li>
							<li class="list-group-item">가품, 도매 사입품(택갈이) 등 브랜치스 사업 방향에 맞지 않는 브랜드의 입점은 진행하지 않습니다. (병행수입 상품의 경우 수입신고 필증 보유 시 가능)</li>
							<li class="list-group-item">위탁 판매 방식으로만 입점이 가능하며, 배송/CS 처리 등 자체적으로 판매 및 사후관리가 불가능한 업체의 입점은 불가합니다.</li>
							<li class="list-group-item">입점 후 MD/배송/CS 업무를 진행해 주실 담당자가 지정되어 있어야 합니다.</li>
						</ol>
					</div>
				</div>
			</div>

			<hr>

			<div class="container">
				<form method="post" action="#">
					<fieldset>
						<div class="row">
							<div class="col-md-2 contact-info" align="left">
								<p class="lead">업체명</p>
							</div>
							<div class="col-md-10 contact-info">
								<input type="text" class="form-control">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-2 contact-info" align="left">
								<p class="lead">브랜드</p>
							</div>
							<div class="col-md-10 contact-info">
								<input type="text" class="form-control">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-2 contact-info" align="left">
								<p class="lead">담당자명</p>
							</div>
							<div class="col-md-10 contact-info">
								<input type="text" class="form-control">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-2 contact-info" align="left">
								<p class="lead">이메일</p>
							</div>
							<div class="col-md-10 contact-info">
								<input type="email" class="form-control">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-2 contact-info" align="left">
								<p class="lead">전화번호</p>
							</div>
							<div class="col-md-10 contact-info">
								<input type="number" class="form-control">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-2 contact-info" align="left">
								<p class="lead">휴대전화</p>
							</div>
							<div class="col-md-10 contact-info">
								<input type="number" class="form-control">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-2 contact-info" align="left">
								<p class="lead">업체주소</p>
							</div>
							<div class="col-md-10 contact-info">
								<input type="text" class="form-control">
							</div>
						</div>
						<hr>
						<div align="center" style="padding: 3% 0px 3% 0px;">
							<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/main'">메인페이지</button>
							&nbsp;
							<button type="submit" class="btn btn-primary">작성하기</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>

		<hr>

		<!-- footer -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"></jsp:include>

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