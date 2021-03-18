<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원정보</title>

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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#birthDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                     
 
            });
             
    });
</script>

</head>


<body>
	<header>
		<div class="container">
			<div class="row">
				<div class="col-6 col-sm-3 logo-column">
					<a href="index.html" class="logo"> <img src="/assets/img/logo.png" alt="logo">
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
							<a href="#" class="fa fa-facebook"></a> <a href="#" class="fa fa-twitter"></a> <a href="#" class="fa fa-github"></a>
						</div>
					</div>
					<nav id="menu" class="d-none d-lg-block">
						<ul>
							<li class="current-menu-item has-child"><a href="index.html">Home</a>
								<ul class="sub-menu">
									<li><a href="index.html">Home - 01</a></li>
									<li><a href="index-2.html">Home - 02</a></li>
									<li><a href="index-3.html">Home - 03</a></li>
								</ul></li>
							<li><a href="about.html">About</a></li>
							<li><a href="portfolio.html">Portfolio</a></li>
							<li class="has-child"><a href="#">Pages</a>
								<ul class="sub-menu">
									<li><a href="404.html">404</a></li>
									<li><a href="about.html">About</a></li>
									<li><a href="career.html">Career</a></li>
									<li><a href="coming-soon.html">Coming Soon</a></li>
									<li><a href="contact.html">Contact</a></li>
									<li><a href="faq.html">Faq</a></li>
									<li><a href="portfolio.html">Portfolio</a></li>
									<li><a href="pricing.html">Pricing</a></li>
									<li><a href="service.html">Service</a></li>
									<li><a href="team.html">Team</a></li>
									<li><a href="testimonial.html">Testimonial</a></li>
								</ul></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<div class="page-title sp" >
		<div class="container text-center">
			<h2>회원정보</h2>
			<p>수정 후 저장해주세요</p>
		</div>
	</div>
	<div class="contact-area sp">
		<div class="container">
			<div class="row">
				<div class="col-md-3 contact-info">
					<div class="single-info">
						<h5>나의 쇼핑 활동</h5>
						<p>주문내역조회</p>
						<p>내가 찜한 상품</p>
						<p>최근 본 상품</p>
					</div>
					<div class="single-info">
						<h5>내가 쓴 글</h5>
						<p>고객 Q&A</p>
						<p>상품 Q&A</p>
						<p>상품 리뷰</p>
					</div>
					<div class="single-info">
						<h5>매거진</h5>
					</div>
				</div>
				<div class="col-lg-8">
					<form action="#" class="contact-form">
						<div class="row">
							<div class="col-lg-12">
								ID <input type="text" placeholder="ID">
							</div>
							<div class="col-lg-12">
								PW <input type="password" placeholder="PW">
							</div>
							<div class="col-lg-12">
								PW 확인 <input type="password" placeholder="PW">
							</div>
							<div class="col-lg-12">
								이름 <input type="text" placeholder="Name">
							</div>
							<div class="col-lg-12">
								생년월일 <input type="text" id="birthDate">
							</div>
							<div class="col-lg-12">
								<div>성별</div>
								<div class="form-check" style="padding-left: 0;">
									<label class="form-check-label" style="margin: 16px;">남성 
									<span style="position: relative; top: 16px; right: 5px;"><input style="width: 14px; height: 14px;" type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1"
										value="option1" checked=""></span> 
									</label> 
									<label class="form-check-label" style="margin: 16px;">여성
									<span style="position: relative; top: 16px; right: 5px;"><input style="width: 14px; height: 14px;" type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1"
										value="option1" checked=""></span> 
									</label> 
								</div>
								</br></br>
							</div>
							<div class="col-lg-12">
								연락처 <input type="number" placeholder="number">
							</div>
							<div class="col-lg-12">
								닉네임 <input type="text" placeholder="Nickname">
							</div>
							<div class="col-lg-12">
								가입일
							</div>
							<div class="col-lg-12">
								등급 
							</div>
						</div>
						<button type="button" class="btn btn-primary btn-lg btn-block">수정</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>