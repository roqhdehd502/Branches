<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Product Q&A Register</title>
	
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

		<!-- 상품 Q&A 등록 페이지 -->
		<form action="${pageContext.request.contextPath}/member/prdct/{prdct_id}/qna/writing" method="post">
			<input type="hidden" value="${prdctQnaInfo.mbr_id}" id="mbr_id" name="mbr_id" />
			<fieldset>
				<legend style="text-align: center;">상품 Q&A 등록</legend>
				<br />

				<!-- 상품정보 -->
				<div class="form-group row">
					<label for="prdName" class="col-sm-2 col-form-label">상품</label>
					<div class="col-sm-10">
						<p id="prdct_id" class="font-weight-bold">p1</p>
						<input type="hidden" name="prdct_id" value="p1" />
					</div>
				</div>

				<!-- 문의유형 -->
				<div class="form-group row">
					<label for="PrdQNA" class="col-sm-2 col-form-label">문의 유형</label>
					<div class="form-group col-sm-10">
						<select class="form-control" id="inquiry_number" name="inquiry_number">
							<option id="inquiry_number" value="1">EXCHANGE</option>
							<option id="inquiry_number" value="2">REFUND</option>
							<option id="inquiry_number" value="3">CANCEL</option>
							<option id="inquiry_number" value="4">SHIPPING</option>
							<option id="inquiry_number" value="5">FAULTY</option>
							<option id="inquiry_number" value="6">ORDER</option>
							<option id="inquiry_number" value="7">PRODUCT</option>
							<option id="inquiry_number" value="8">POINT</option>
							<option id="inquiry_number" value="9">MEMBER</option>
							<option id="inquiry_number" value="10">ETC</option>
						</select>
					</div>
				</div>

				<!-- 제목 -->
				<div class="form-group row">
					<label for="pqnatitle" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="board_name" name="board_name" placeholder="제목을 입력해 주세요.">
					</div>
				</div>

				<!--내용 -->
				<div class="form-group row">
					<label for="orderEmail" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea id="board_content" name="board_content" class="form-control" style="" value="" maxlength="500"
							onkeyup="return textarea_maxlength(this)" placeholder="최대 500자까지 입력 가능합니다."></textarea>
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
		<!-- 채널 봇 챗봇 -->
		<script src="/js/channelIO.js"></script>
	</div>
</body>
</html>