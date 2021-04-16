<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Company Intro</title>
	
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

	<!-- thumbnail image hover -->
	<style type="text/css">
		.thumbnail:hover {
			background-color: #e0e0e0;
			border: 1px solid #e0e0e0;
			border-radius: 5px;
		}
		a:hover { 
			text-decoration: none;
		}
	</style>
	
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
						<h2>회사소개</h2>
					</div>
					<div class="col-md-6 contact-info" align="right"></div>
				</div>
			</div>

			<hr>

			<div class="container" style="padding: 3% 0px 3% 0px">
				<div class="row" style="padding: 0px 3% 1% 3%">
					<p class="lead">안녕하세요. 이번 브랜치스 웹 쇼핑몰 프로젝트를 맡은 테트리프입니다.</p>
				</div>
				<hr>
				<div class="row" style="padding: 0px 3% 1% 3%">
					<h3>목차</h3>
				</div>
				<div class="row" style="padding: 0px 3% 1% 3%">
					<ol class="list-group">
						<li class="list-group-item"><a href="#grpone">1. 테트리프(Tetleaf)의 뜻</a></li>
						<li class="list-group-item"><a href="#grptwo">2. 조원</a></li>
					</ol>
				</div>	
			</div>
			
			<hr>

			<div id="grpone" class="container" style="padding: 3% 0px 3% 3px">
				<div class="row" style="padding: 0px 3% 1% 3%">
					<h3>테트리프(Tetleaf)의 뜻</h3>
				</div>
				<div class="row" style="padding: 0px 3% 1% 3%">
					<img alt="Tetleaf" src="img/Tetleaf_Logo_Background.png" width="800px" height="600px">
				</div>
				<div class="row" style="padding: 0px 3% 0px 3%">
					<p class="lead">테트리프는 숫자 4(Tetra)와 나뭇잎(Leaf)의 합성어로 4명의 조원들이 이루어짐을 의미합니다.<br>
					또한, 행운을 상징하는 네잎클로버와 같은 상징성이 있어 조별 프로젝트에 이러한 좋은요소가 이루어졌으면 좋겠다는 희망이 생기고자 작명했습니다.</p>
				</div>
			</div>
			
			<hr>
			
			<div id="grptwo" class="container" style="padding: 3% 0px 3% 3px">
				<div class="row" style="padding: 0px 3% 1% 3%">
					<h3>조원</h3>
				</div>
				<div class="row" style="padding: 0px 3% 1% 3%">
					<p class="lead">테트리프의 조원은 다음과 같습니다.</p>
				</div>
				<div class="row" style="padding: 0px 3% 0px 3%">
					<div class="col-md-3 thumbnail">
						<a href="https://github.com/pyoLeo">
							<div class="row">
								<img class="rounded" src="https://avatars.githubusercontent.com/u/74647400?v=4">
							</div>
							<div style="margin: 3% 0px 3% 0px"></div>
							<div align="center">
								<p class="lead">김성표</p>
							</div>
						</a>
					</div>
					<div class="col-md-3 thumbnail">
						<a href="https://github.com/roqhdehd502">
							<div class="row">
								<img class="rounded" src="https://avatars.githubusercontent.com/u/47406388?v=4">
							</div>
							<div style="margin: 3% 0px 3% 0px"></div>
							<div align="center">
								<p class="lead">나민우</p>
							</div>
						</a>
					</div>
					<div class="col-md-3 thumbnail">
						<a href="https://github.com/jijiel">
							<div class="row">
								<img class="rounded" src="https://avatars.githubusercontent.com/u/74961220?v=4">
							</div>
							<div style="margin: 3% 0px 3% 0px"></div>
							<div align="center">
								<p class="lead">이은지</p>
							</div>
						</a>
					</div>
					<div class="col-md-3 thumbnail">
						<a href="https://github.com/chlgudtjr">
							<div class="row">
								<img class="rounded" src="https://avatars.githubusercontent.com/u/75012998?v=4">
							</div>
							<div style="margin: 3% 0px 3% 0px"></div>
							<div align="center">
								<p class="lead">최형석</p>
							</div>
						</a>
					</div>
				</div>
			</div>
			
			<hr>
			
			<div class="container" style="padding: 3% 0px 3% 3px">
				<div class="row" style="padding: 0px 3% 1% 3%">
					<h3>SPECIAL THANKS TO</h3>
				</div>
				<div class="row" style="padding: 0px 3% 0px 3%">
					<div class="col-md-3 thumbnail">
						<a href="https://www.musinsa.com/">
							<div class="row">
								<img width="300px" height="175px" class="rounded" src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F65bb15be-6102-47c4-b642-d0ae9aadf4e1%2F01_.png?table=block&id=29dcfe35-c178-4ac6-a152-0a6dc5f960ea&width=5770&userId=&cache=v2">
							</div>
							<div style="margin: 3% 0px 3% 0px"></div>
							<div align="center">
								<p class="lead">무신사</p>
							</div>
						</a>
					</div>
					<div class="col-md-3 thumbnail">
						<a href="https://www.wconcept.co.kr/">
							<div class="row">
								<img width="300px" height="175px" class="rounded" src="https://m.dombafootwear.com/web/product/big/201905/343bf9d9885af70448b4037c6396f935.jpg">
							</div>
							<div style="margin: 3% 0px 3% 0px"></div>
							<div align="center">
								<p class="lead">W Concept</p>
							</div>
						</a>
					</div>
					<div class="col-md-3 thumbnail">
						<a href="https://covernat.net/">
							<div class="row">
								<img width="300px" height="175px" class="rounded" src="https://cdn-lfatc.bizhost.kr/files/brand/550/550.jpg">
							</div>
							<div style="margin: 3% 0px 3% 0px"></div>
							<div align="center">
								<p class="lead">커버낫</p>
							</div>
						</a>
					</div>
					<div class="col-md-3 thumbnail">
						<a href="https://whoisnerdy.com/">
							<div class="row">
								<img width="300px" height="175px" class="rounded" src="https://img.hankyung.com/photo/202009/0D.23939507.1.jpg">
							</div>
							<div style="margin: 3% 0px 3% 0px"></div>
							<div align="center">
								<p class="lead">널디</p>
							</div>
						</a>
					</div>
				</div>
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