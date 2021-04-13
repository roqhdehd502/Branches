<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>상품 리스트</title>

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
	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
	
		<div class="page-title sp">
			<div class="container text-center">
				<h4>상품 목록</h4>
				<p style="float: left;">내용 뭐 넣을지</p>
			</div>
		</div>
		<!-- 상품리스트출력 -->
		<div class="team-area sp">
			<div class="container">
				<div class="row">
					<c:forEach items="${prdct}" var="prdct">
						<div class="col-sm-2 col-md-2 col-lg-2 single-team">
						<div class="inner">
							<div class="team-img">
								<img src="/ksp/th-ex.jpg" alt="Member Photo">
							</div>
							<div class="team-content">
								<h5>${prdct.prdct_name}</h5>
								<h6>${prdct.mbr_id}</h6>
								<h6>${prdct.prdct_price}</h6>
							</div>
						</div>
					</div>
					</c:forEach>
					
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
</body>
</html>