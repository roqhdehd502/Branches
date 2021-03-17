<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Product Detail</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 선택 상품 브랜드배너 -->
	<div class="detail_brand_banner">
		<P class="brandBanner" style="BACKGROUND: url(https://image.musinsa.com/images/brand/2020071016493800000089570.png) repeat-x 0px 0px"></P>
		<!-- 무신사 코딩따라했는데 안나오네요 -->
		<img href="#" src="<c:url value="/img/brand_yale.png"/>">
		<!-- 클릭하면 브랜드 페이지로 가게, 무신사페이지에서 따왔는데 사진 안뜸.. 일단 공간만 -->
	</div>

	<!--내용-->
	<div class="container">
		<div align="left">
			<div class="product info">

				<div class="item categories">
					<a>카테고리 분류</a>
				</div>
				<!-- 상품 이미지 -->
				<div style="float: left; margin-right: 10px;">
					<img src="https://image.msscdn.net/images/goods_img/20200928/1628385/1628385_1_500.jpg" />
				</div>
				<!-- 상품 상세정보	 -->
				<h3>Yale</h3>
				<h3>2 Tone Arch Hoodie</h3>
				<h4>
					price: 62000
					</h3>
					<hr>
					<p>포인트 적립 620점
					<P>
						<!-- 옵션	 -->
					<div id="wrap">
						<div style="float: left; margin-right: 50px; margin-top: 8px; font-weight: bold;">Color</div>
						<div style="float: right; width: 500px;">
							<select class="form-control">
								<option value="">gray</option>
								<option value="">blcak</option>
								<option value="">white</option>
								<option value="">green</option>
							</select>
						</div>
					</div>
					<div style="margin-bottom: 10px;">
						<p>&nbsp;</p>
					</div>

					<div id="wrap">
						<div style="float: left; margin-right: 50px; margin-top: 8px; font-weight: bold;">Size</div>
						<div style="float: right; width: 500px;">
							<select class="form-control">
								<option value="">S</option>
								<option value="">M</option>
								<option value="">L</option>
								<option value="">XL</option>
							</select>
						</div>
					</div>
			</div>
		</div>
	</div>

</body>
</html>