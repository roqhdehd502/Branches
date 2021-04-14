<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Review Register</title>
	
	<!-- Required CSS files -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">
	<link rel="stylesheet" href="/assets/css/owl.carousel.css">
	<link rel="stylesheet" href="/assets/css/barfiller.css">
	<link rel="stylesheet" href="/assets/css/animate.css">
	<link rel="stylesheet" href="/assets/css/font-awesome.min.css">
	<!-- <link rel="stylesheet" href="/assets/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="/assets/css/slicknav.css">
	<link rel="stylesheet" href="/assets/css/main.css">
	<link rel="stylesheet" href="/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	
	<style>
		* {
			margin: 0;
			padding: 0;
		}
		
		.rate {
			float: left;
			height: 46px;
			padding: 0 10px;
		}
		
		.rate:not(:checked)>input {
			position: absolute;
			top: -9999px;
		}
		
		.rate:not(:checked)>label {
			float: right;
			width: 1em;
			overflow: hidden;
			white-space: nowrap;
			cursor: pointer;
			font-size: 30px;
			color: #ccc;
		}
		
		.rate:not(:checked)>label:before {
			content: '★ ';
		}
		
		.rate>input:checked ~ label {
			color: #ffc700;
		}
		
		.rate:not(:checked)>label:hover, .rate:not(:checked)>label:hover ~ label {
			color: #deb217;
		}
		
		.rate>input:checked+label:hover, .rate>input:checked+label:hover ~ label, .rate>input:checked ~ label:hover, .rate>input:checked ~ label:hover ~ label,
			.rate>label:hover ~ input:checked ~ label {
			color: #c59b08;
		}
	</style>
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"></jsp:include>

		<!-- 리뷰 등록 페이지 -->
		<form action="${pageContext.request.contextPath}/member/mypage/review/writing" method="post">
			<input type="hidden" value="${customerInfo.mbr_id}" id="mbr_id" name="mbr_id" /> < <br /> <br />
			<fieldset>
				<legend style="text-align: center;">리뷰 등록</legend>
				<br />

				<!-- 상품정보 -->
				<div class="form-group row">
					<label for="prdName" class="col-sm-2 col-form-label">상품</label>
					<div class="col-sm-10">
						<p id="prdct_id" class="font-weight-bold">p1</p>
						<input type="hidden" name="prdct_id" value="p1" />
					</div>
				</div>

				<!-- 별점 -->
				<div class="form-group row">
					<label for="prdName" class="col-sm-2 col-form-label">별점</label>
					<div class="rate">
						<input type="radio" id="star5" name="board_starrate" value="5" /> <label for="star5" title="text">5 stars</label> <input type="radio"
							id="star4" /> <label for="star4" title="text">4 stars</label> <input type="radio" id="star3" name="board_starrate" value="3" /> <label
							for="star3" title="text">3 stars</label> <input type="radio" id="star2" name="board_starrate" value="2" /> <label for="star2" title="text">2
							stars</label> <input type="radio" id="star1" name="board_starrate" value="1" /> <label for="star1" title="text">1 star</label>
					</div>
				</div>

				<!--내용 -->
				<div class="form-group row">
					<label for="orderEmail" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea id="board_content" name="board_content" class="form-control" style="" value="" maxlength="300"
							onkeyup="return textarea_maxlength(this)" placeholder="최대 300자까지 입력 가능합니다."></textarea>
					</div>
				</div>

				<!-- 사진등록 -->
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">사진등록</label>
					<div class="col-sm-10">

						<input type="file" class="form-control-file"> <small class="form-text text-muted">jpg, png, gif의 사진파일만 적용됩니다.</small>
					</div>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
				<br /> <br />
			</fieldset>
		</form>

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