<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>마이페이지</title>

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
         <span style="margin-left: 70px;">
         </span> <span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
            <h3>닉네임</h3>
         </span>
         <span style="margin-left: 22px; position: relative; bottom: 2px;"> <a href="#">정보수정</a></span> 
         <span style="margin-left: 372px;">
            <h4 style="position: relative; top: 10px; margin-left: 10px;">포인트</h4>
            <h2 style="position: relative; top: 30px;">1000p</h2>
         </span> <span style="margin-left: 142px;">
            <h4 style="position: relative; top: 10px;">쿠폰</h4>
            <h2 style="position: relative; top: 30px; margin-left: 15px;">1</h2>
         </span>
      </div>
		
		<hr>

		<div class="container">
			<div class="row">
				<div class="col-md-2 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
	                    <h4>나의 쇼핑활동</h4><hr>
	                    <h5><a href="#">주문내역 조회</a></h5>
	                    <h5><a href="#">최근본상품보기</a></h5>
	                    <h5><a href="#">찜한 목록</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h4>매거진</h4><hr>
	                    <h5><a href="#">&nbsp;매거진</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h4>내가 쓴 글보기</h4><hr>
	                    <h5><a href="#">구매후기</a></h5>
	                    <h5><a href="#">상품문의</a></h5>
	                    <h5><a href="#">고객Q&A</a></h5>
	                </div>
				</div>

				<span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 922px;">
					<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px; border-bottom: 1px solid rgba(0, 0, 0, .1);">
						<strong style="margin: 10px;">주문내역 조회</strong>
					</h3>
					
				<div style="margin-bottom: 20px; margin-top: 20px;">
					<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">ㄱㄴㄷ순</button></span>
					<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">abc순</button></span>
					<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">날짜별순</button></span>
					<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">최근구매순</button></span>
				</div>	
					<table class="table">
						<thead style="text-align: center;">
							<tr>
								<td colspan="2"><h5>상품정보</h5></td>
								<td><h5>주문일</h5></td>
								<td><h5>주문번호</h5></td>
								<td><h5>주문금액</h5></td>
								<td><h5>상태</h5></td>
							</tr>
						</thead>
						<tbody >
							<tr>
								<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
								<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
									<h6>Covernat</h6>
									<h6>럭비 맨투맨 네이비</h6>
									<h6>네이비 (M)</h6>
								</td>
								<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
								<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
								<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
								<td>
									<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
									<h6 style="position: relative; top: 24px; margin-left: 10px;"><button class="btn btn-primary btn-sm">배송조회</button></h6>
								</td>
							</tr>
							
							<tr>
								<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
								<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
									<h6>Covernat</h6>
									<h6>럭비 맨투맨 네이비</h6>
									<h6>네이비 (M)</h6>
								</td>
								<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
								<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
								<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
								<td>
									<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
									<h6 style="position: relative; top: 24px; margin-left: 10px;"><button class="btn btn-primary btn-sm">배송조회</button></h6>
								</td>
							</tr>
							
							<tr>
								<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
								<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
									<h6>Covernat</h6>
									<h6>럭비 맨투맨 네이비</h6>
									<h6>네이비 (M)</h6>
								</td>
								<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
								<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
								<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
								<td>
									<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
									<h6 style="position: relative; top: 24px; margin-left: 10px;"><button class="btn btn-primary btn-sm">배송조회</button></h6>
								</td>
							</tr>
							
							<tr>
								<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
								<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
									<h6>Covernat</h6>
									<h6>럭비 맨투맨 네이비</h6>
									<h6>네이비 (M)</h6>
								</td>
								<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
								<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
								<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
								<td>
									<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
									<h6 style="position: relative; top: 24px; margin-left: 10px;"><button class="btn btn-primary btn-sm">배송조회</button></h6>
								</td>
							</tr>
							
							<tr>
								<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
								<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
									<h6>Covernat</h6>
									<h6>럭비 맨투맨 네이비</h6>
									<h6>네이비 (M)</h6>
								</td>
								<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
								<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
								<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
								<td>
									<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
									<h6 style="position: relative; top: 24px; margin-left: 10px;"><button class="btn btn-primary btn-sm">배송조회</button></h6>
								</td>
							</tr>
							
							
						
						</tbody>
					</table>
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
		</div>
		<br /> <br />
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