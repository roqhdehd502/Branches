<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Site Intro</title>
	
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
						<h2>사이트소개</h2>
					</div>
					<div class="col-md-6 contact-info" align="right"></div>
				</div>
			</div>

			<hr>

			<div class="container" style="padding: 3% 0px 3% 0px">
				<div class="row" style="padding: 0px 3% 1% 3%">
					<p class="lead">브랜치스는 000만 회원과 0000개 입점 브랜드를 보유한 온라인 패션 플랫폼입니다. 고객에게 최상의 쇼핑 서비스를 제공하고, 입점 브랜드의 성장을 지원하는 것을 목표로 합니다.</p>
				</div>
				<hr>
				<div class="row" style="padding: 0px 3% 1% 3%">
					<h3>목차</h3>
				</div>
				<div class="row" style="padding: 0px 3% 1% 3%">
					<ol class="list-group">
						<li class="list-group-item"><a href="#grpone">1. History</a></li>
						<li class="list-group-item"><a href="#grptwo">2. Identity</a></li>
						<li class="list-group-item"><a href="#grpthree">3. CI</a></li>
					</ol>
				</div>	
			</div>
			
			<hr>

			<div id="grpone" class="container" style="padding: 3% 0px 3% 3px">
				<div class="row" style="padding: 0px 3% 1% 3%">
					<h3>History</h3>
				</div>
				<div class="row" style="padding: 0px 3% 0px 3%">
					<ol class="list-group">
						<li class="list-group-item">2021년 3월 기획</li>
						<li class="list-group-item">2021년 3월 요구사항 수집 및 분석</li>
						<li class="list-group-item">2021년 3월 개념적 설계</li>
						<li class="list-group-item">2021년 3월 논리적 설계</li>
						<li class="list-group-item">2021년 3월 물리적 설계</li>
						<li class="list-group-item">2021년 3월 소프트웨어 설계</li>
						<li class="list-group-item">2021년 3월 브랜치스 오픈 시작</li>
						<li class="list-group-item">2021년 4월 매거진 오픈</li>
					</ol>
				</div>
			</div>
			
			<hr>
			
			<div id="grptwo" class="container" style="padding: 3% 0px 3% 3px">
				<div class="row" style="padding: 0px 3% 1% 3%">
					<h3>Identity</h3>
				</div>
				<div class="row" style="padding: 3% 3% 3% 3%">
					<h4>많은 회원들이 선택한 패션 스토어</h4>
					<p class="lead">2021년 4월 기준, 브랜치스 회원은 000만 명을 돌파했으며, 
					매월 평균 000만 명 이상의 회원들이 브랜치스를 방문하고 있습니다. 
					브랜치스의 남녀 성비는 남성 55%, 여성 45%이며, 연령별로는 패션 타깃층인 
					10대를 포함해 20, 30대가 차지하는 비율이 80% 이상으로 매우 높습니다.</p>
				</div>
				<div class="row" style="padding: 3% 3% 3% 3%">
					<h4>패션의 모든 것을 만날 수 있는 패션 플랫폼</h4>
					<p class="lead">온라인 스토어이자 최고의 패션 콘텐츠 전문가 집단인 브랜치스는 패션 
					에디터/디자이너/PD/포토그래퍼가 만들어낸 스타일리쉬한 결과물을 선보입니다. 
					텍스트, 이미지, 영상 등을 활용한 웹 퍼블리싱으로 완성한 브랜치스 콘텐츠는 
					입점 브랜드의 브랜딩 및 매출 상승을 위한 시너지를 냅니다. 또 고객들에게 
					유용한 패션 스타일 및 정보, 상품 선택에 대한 맞춤형 큐레이팅을 제안하고 있습니다.</p>
				</div>
				<div class="row" style="padding: 3% 3% 3% 3%">
					<h4>브랜치스 만의 특별한 브랜드 마케팅</h4>
					<p class="lead">차별화된 쇼핑 경험을 제공하기 위해 힘쓰는 브랜치스는 입점 브랜드가 매력적인 
					모습으로 고객을 만날 수 있는 방법을 함께 고민합니다. 상품 기획 단계부터 판매 전략, 
					마케팅 이벤트까지 다양한 영역에 걸쳐 브랜드의 정체성과 상품의 가치를 알릴 수 있는 
					마케팅 인프라를 제공합니다. 오직 브랜치스에서만 구매 가능한 단독 상품, 이종 산업 및 
					브랜드 간의 컬래버레이션, 고객 이벤트 등의 다채로운 기획, 마케팅 툴을 활용해 온라인 
					쇼핑의 즐거움을 선사하고 있습니다.</p>					
				</div>
				<div class="row" style="padding: 3% 3% 3% 3%">
					<h4>브랜드와 함께 성장하는 브랜치스</h4>
					<p class="lead">국내 최대 패션 스토어로 성장한 브랜치스는 입점 브랜드와의 동반성장을 최우선 가치로 
					생각합니다. 상생할 수 있는 환경을 위해 생산자금부터 판매에 이르기까지 브랜치스가 보유한 
					노하우와 인프라를 적극 제공해 브랜드가 안정적으로 사업을 전개할 수 있도록 지원합니다.</p>					
				</div>
			</div>
			
			<hr>
			
			<div id="grpthree" class="container" style="padding: 3% 0px 3% 3px">
				<div class="row" style="padding: 0px 3% 1% 3%">
					<h3>CI</h3>
				</div>
				<div class="row" style="padding: 3% 3% 3% 3%">
					<img alt="Branches" src="img/branches_text.png" width="800px" height="600px">
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