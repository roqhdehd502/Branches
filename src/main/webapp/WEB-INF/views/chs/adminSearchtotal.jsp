<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 마이페이지</title>

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
		<div class="container" style="border-bottom: 1px solid rgba(0, 0, 0, .1);">
			<div class="row">
				<div class="col-6 col-sm-3 logo-column">
					<a href="index.html" class="logo" style="height: 70px;"> <img src="/img/branches_text.png" alt="logo" style="width: 160px; height: 70px;">
					</a>
				</div>
				<div class="col-6 col-sm-9 nav-column clearfix">
					<div class="right-nav">
						<span class="search-icon fa fa-search"></span>
						<form action="#" class="search-form">
							<input type="search" placeholder="search now">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
						<div class="header-social">
							<a href="#">Login</a> 
							<a href="#" class="fa fa-google"></a> 
							<a href="#" class="fa fa-facebook"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<div class="container">
			<div class="row">
				<div class="col-md-2 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px; margin-top: 15px;">
	                    <h3>업체관리</h3><hr>
	                    <h5><a href="#">업체등록</a></h5>
	                    <h5><a href="#">업체목록 조회</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>회원관리</h3><hr>
	                    <h5><a href="#">회원정보 조회</a></h5>
	                    <h5><a href="#">고객Q&A 목록</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>매출관리</h3><hr>
	                    <h5><a href="#">매출조회</a></h5>
	                    <h5><a href="#">검색순위 조회</a></h5>
	                </div>
				</div>
				<span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 922px;">
					<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px;">
						<strong style="margin: 10px;">매출조회</strong><hr>
					</h3>
					<div>
						<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">일간</button></span>
						<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">주간</button></span>
						<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">월간</button></span>
						<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">연간</button></span>
						<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">전체</button></span>
						<form action="#" style="float: right;">
						<span style="margin-left: 30px;"><h6>지정</h6></span>
						<span style="margin-left: 10px;">
							<select>
								<option>대분류</option>
								<option>상의</option>
								<option>하의</option>
								<option>아우터</option>
								<option>신발</option>
								<option>가방</option>
							</select>
						</span>
						<span style="margin-left: 10px;">
							<select>
								<option>소분류</option>
							</select>
						</span>
							<span style="margin-left: 10px;"><button class="btn btn-primary btn-sm" type="submit">조회</button></span>
						</form>
					</div><hr>
				<div>
					<h5 style="text-align: center;">OUTER</h5>
              		 <div class="progress">
						<div class="progress-bar bg-success" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 45%;"></div>
					</div>
					<br />
					<h5 style="text-align: center;">TOP</h5>
					<div class="progress">
						<div class="progress-bar bg-success" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 65%;"></div>
					</div>
					<br />
					<h5 style="text-align: center;">BOTTOM</h5>
					<div class="progress">
						<div class="progress-bar bg-success" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 55%;"></div>
					</div>
					<br />
					<h5 style="text-align: center;">SHOES</h5>
					<div class="progress">
						<div class="progress-bar bg-success" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 30%;"></div>
					</div>
					<br />
					<h5 style="text-align: center;">ACC</h5>
					<div class="progress">
						<div class="progress-bar bg-success " role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 25%;"></div>
					</div>	
				</div><hr style="margin-top: 30px;">
				<div style="margin-bottom: 20px;">
					<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">ㄱㄴㄷ순</button></span>
					<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">abc순</button></span>
					<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">매출순</button></span>
					<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">최근등록순</button></span>
				</div>
				<table class="table">
					<thead>
						<tr>
							<td><h5>순위</h5></td>
							<td><h5>상품명</h5></td>
							<td><h5>등록일</h5></td>
							<td><h5>가격</h5></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><h5>1</h5></td>
							<td><h5>Black Shadow Hoodie</h5></td>
							<td><h5>2021.01.13</h5></td>
							<td><h5>57,000₩</h5></td>
						</tr>
						
						<tr>
							<td><h5>1</h5></td>
							<td><h5>Black Shadow Hoodie</h5></td>
							<td><h5>2021.01.13</h5></td>
							<td><h5>57,000₩</h5></td>
						</tr>
						
						<tr>
							<td><h5>1</h5></td>
							<td><h5>Black Shadow Hoodie</h5></td>
							<td><h5>2021.01.13</h5></td>
							<td><h5>57,000₩</h5></td>
						</tr>
						
						<tr>
							<td><h5>1</h5></td>
							<td><h5>Black Shadow Hoodie</h5></td>
							<td><h5>2021.01.13</h5></td>
							<td><h5>57,000₩</h5></td>
						</tr>
						
						<tr>
							<td><h5>1</h5></td>
							<td><h5>Black Shadow Hoodie</h5></td>
							<td><h5>2021.01.13</h5></td>
							<td><h5>57,000₩</h5></td>
						</tr>
						
					</tbody>
				</table>
         		</span>
			</div>
		</div>
	
	<hr>
	<!-- footer -->
		<footer>
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>회사소개</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>제휴문의</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>채용정보</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>고객센터</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>이용약관</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>개인정보처리</h5></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div class="copyright-txt">Copyright© 2021 Branches. All Rights Reserved.</div>
						</div>
						<div class="col-lg-6 text-right">
							<div class="footer-nav">
								<a href="/member/main">Home</a> <a href="#">Q&A</a> <a href="#">Notice</a> <a href="#">Magazine</a> <a href="#">Blog</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<div class="container">
			<small style="color: black;"> <strong>상호명 :</strong> (주)브랜치스 | <strong>소재지 :</strong> 서울특별시 00구 00로00길 00 00빌딩 0층 | <strong>팩스 :</strong>
				000-0000-0000 |<strong>사업자등록번호 :</strong> 000-00-000000 | <strong>통신판매업신고 :</strong> 0000-서울종로-00000 | 
			</small> <br /> <small style="color: black;"><strong>고객센터</strong> 0000-0000 | 평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무) | <strong>이메일</strong>
				admin@branches.co.kr | <strong>개인정보책임자</strong> 000 | <strong>호스팅서비스</strong> (주)00000 | </small>
		</div><br/><br/>
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