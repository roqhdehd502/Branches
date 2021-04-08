<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Branches</title>

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
<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
		<div class="container">
			<div class="hero-slider">
				<div class="single-slide" style="background-image: url(/hs/1.jpg)">
					<div class="inner">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-6 text-center">
									<div class="slide-content">
										<h2 style="color: white;">Balenciaga</h2>
										<p style="color: white;">
											21/22 SS 오직 Branches에서만<br /> [단독] 판매 시작!
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="single-slide" style="background-image: url(/hs/6.jpg)">
					<div class="inner">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-6 text-center">
									<div class="slide-content">
										<h2 style="color: white;">Balenciaga</h2>
										<p style="color: white;">2021.03.20.00:00</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="single-slide" style="background-image: url(/hs/7.jpg)">
					<div class="inner">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-6 text-center">
									<div class="slide-content">
										<h2 style="color: white;">Balenciaga</h2>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="single-slide" style="background-image: url(/hs/9.jpg)">
					<div class="inner">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-6 text-center">
									<div class="slide-content">
										<h2 style="color: white;"></h2>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br /> <br /> <br /> <br /> <br /> <br />

		<article>
			<!-- 상품소개 1 -->
			<div class="section-title">
				<h2>New Arrival</h2>
				<p>Branches와 함께 매주 새로운 신상품을 둘러보세요!</p>
			</div>
			<div class="team-area sp">
				<div class="container">
					<div class="row">
						<c:forEach items="${prdct }" var="prdct" varStatus="status" begin="0" end="3">
							<div class="col-sm-6 col-md-4 col-lg-3 single-team">
								<div class="inner">
									<a href="#" style="text-decoration: none;">
										<div class="team-img">
											<img src="/hs/5.jpg">
										</div>
										<div class="team-content">
											<h4>${member[status.index].mbr_name }</h4>
											<h5>${prdct.prdct_name}</h5>
											<h5>${prdct.prdct_price}₩</h5>
											<h6>
												<del>${prdct.prdct_price *2}₩</del>
											</h6>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</article>
		<br /> <br />
		<article>
			<!-- 상품소개 2 -->
			<div class="section-title">
				<h2>Best Pick!</h2>
				<p>Branches에서 가장 Hot한 상품들을 둘러보세요!</p>
			</div>
			<div class="team-area sp">
				<div class="container">
					<div class="row">
						<c:forEach items="${prdct }" var="prdct" begin="0" end="3" varStatus="status">
							<div class="col-sm-6 col-md-4 col-lg-3 single-team">
								<div class="inner">
									<a href="#" style="text-decoration: none;">
										<div class="team-img">
											<img src="/hs/8.jpg" alt="Member Photo">
										</div>
										<div class="team-content">
											<h4>${member[status.index].mbr_name }</h4>
											<h5>${prdct.prdct_name}</h5>
											<h5>${prdct.prdct_price}₩</h5>
											<h6>
												<del>${prdct.prdct_price *2}₩</del>
											</h6>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</article>
		<br /> <br />
		<div class="testimonial-area spb">
			<div class="container">
				<div class="section-title">
					<h2>Branches 2021 Spring Sale</h2>
					<p>Branches가 여러분들 위해 준비했습니다~ 남들보다 빠른 봄을 준비해보세요!</p>
				</div>
				<div class="testimonial-slider bordered">
					<c:forEach begin="0" end="5">
						<div class="single-slide">
							<div class="inner">
								<a href="#">
									<div class="client-info">
										<div class="client-data">
											<img src="/hs/10.jpg" style="width: 100%; height: 120px;">
											<h4>나이키 특별 세일!</h4>
										</div>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<br /> <br />
		<div class="portfolio-area sp">
			<div class="container">
				<div class="section-title">
					<h2>MD 추천 Pick</h2>
					<p>무엇을 입어야 할지 고민이라구요?? Branches MD분들이 매주 여러분들을 위해 Best상품을 추천해드립니다!</p>
				</div>
				<div class="row">
					<c:forEach items="${prdct }" var="prdct" begin="0" end="2" varStatus="status">
						<div class="col-md-4 single-team">
							<div class="inner">
								<a href="#" style="text-decoration: none;">
									<div class="team-img">
										<img src="/hs/7.jpg" alt="Member Photo">
									</div>
									<div class="team-content">
										<h4>${member[status.index].mbr_name }</h4>
										<h5>${prdct.prdct_name}</h5>
										<h5>${prdct.prdct_price}₩</h5>
										<h6>
											<del>${prdct.prdct_price *2}₩</del>
										</h6>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				  </div>
				</div>
			</div>
			</section>

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