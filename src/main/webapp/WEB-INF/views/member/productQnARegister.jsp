<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Product Q&A Register</title>

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

</head>
<style>
*{
    margin: 0;
    padding: 0;
}
.rate {
    float: left;
    height: 46px;
    padding: 0 10px;
}
.rate:not(:checked) > input {
    position:absolute;
    top:-9999px;
}
.rate:not(:checked) > label {
    float:right;
    width:1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:30px;
    color:#ccc;
}
.rate:not(:checked) > label:before {
    content: '★ ';
}
.rate > input:checked ~ label {
    color: #ffc700;    
}
.rate:not(:checked) > label:hover,
.rate:not(:checked) > label:hover ~ label {
    color: #deb217;  
}
.rate > input:checked + label:hover,
.rate > input:checked + label:hover ~ label,
.rate > input:checked ~ label:hover,
.rate > input:checked ~ label:hover ~ label,
.rate > label:hover ~ input:checked ~ label {
    color: #c59b08;
}
</style>

<body>
<div style="overflow: hidden;" class="container">
	<header style="padding-bottom: 10px; padding-top: 5px;">
		<div class="container">
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
							<a href="#" class="fa fa-facebook"></a> <a href="#" class="fa fa-twitter"></a> <a href="#" class="fa fa-github"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
			<nav id="menu" class="d-none d-lg-block">
				<ul style="padding: 10px; background-color: black;">
					<li class="current-menu-item has-child"><a href="index.html">OUTER</a>
						<ul class="sub-menu">
							<li><a href="index.html">Coat</a></li>
							<li><a href="index-2.html">Jarket</a></li>
							<li><a href="index-3.html">Jumper / Mustang</a></li>
							<li><a href="index-3.html">Cardigan</a></li>
							<li><a href="index-3.html">Padding</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">TOP</a>
						<ul class="sub-menu">
							<li><a href="index.html">T-shirt</a></li>
							<li><a href="index-2.html">Blouse / Shirt</a></li>
							<li><a href="index-3.html">Neat / Sweater</a></li>
							<li><a href="index-3.html">Hoddie</a></li>
							<li><a href="index-3.html">Sweater shirt</a></li>
							<li><a href="index-3.html">Sleeveless</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">BOTTOM</a>
						<ul class="sub-menu">
							<li><a href="index.html">Denim</a></li>
							<li><a href="index-2.html">Cotten</a></li>
							<li><a href="index-3.html">Short</a></li>
							<li><a href="index-3.html">Slacks</a></li>
							<li><a href="index-3.html">Training / Jogger</a></li>
							<li><a href="index-3.html">Leggings</a></li>
							<li><a href="index-3.html">Skirt</a></li>	
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">Dress</a>
						<ul class="sub-menu">
							<li><a href="index.html">Mini</a></li>
							<li><a href="index-2.html">Midi</a></li>
							<li><a href="index-3.html">Maxi</a></li>
							<li><a href="index-3.html">Overrall</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">Back</a>
						<ul class="sub-menu">
							<li><a href="index.html">Backpack</a></li>
							<li><a href="index-2.html">Messenger / Cross</a></li>
							<li><a href="index-3.html">Shoulder / Tod</a></li>
							<li><a href="index-2.html">Eco back</a></li>
							<li><a href="index-3.html">Clutch</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">Shoes</a>
						<ul class="sub-menu">
							<li><a href="index.html">Dress shoes</a></li>
							<li><a href="index-2.html">Boots</a></li>
							<li><a href="index-3.html">Sandal</a></li>
							<li><a href="index-2.html">slipper</a></li>
							<li><a href="index-3.html">Sneakers</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">ETC</a>
						<ul class="sub-menu">
							<li><a href="index.html">Socks</a></li>
							<li><a href="index-2.html">Cap</a></li>
							<li><a href="index-3.html">Acc</a></li>
						</ul></li>
					<li>
						<a href="index.html" style="color: white;">|</a>
					</li>
					<li class="current-menu-item has-child"><a href="index.html">BRAND</a>
						<ul class="sub-menu">
							<li><a href="index.html">Nike</a></li>
							<li><a href="index-2.html">Thisisneverthat</a></li>
							<li><a href="index-3.html">Covernat</a></li>
							<li><a href="index-3.html">AnderssonBell</a></li>
							<li><a href="index-3.html">Vans</a></li>
						</ul>
					</li>
					<li class="current-menu-item has-child"><a href="index.html">MAGAZINE</a>
						<ul class="sub-menu">
							<li><a href="index.html">바로가기</a></li>
						</ul>
					</li>
					<li class="current-menu-item has-child"><a href="index.html" style="margin-right: 38px;">NOTICE</a>
						<ul class="sub-menu">
							<li><a href="index.html">바로가기</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</header>
		
		<!-- 상품 Q&A 등록 페이지 -->
		<form action="${pageContext.request.contextPath}/member/prdct/{prdct_id}/qna/writing" method="post">
			<input type="hidden" value="${prdctQnaInfo.mbr_id}" id="mbr_id" name="mbr_id"/> 
			<fieldset>
				<legend style="text-align: center;">상품 Q&A 등록</legend>
				<br />
				
				<!-- 상품정보 -->
				<div class="form-group row">
					<label for="prdName" class="col-sm-2 col-form-label">상품</label>
					<div class="col-sm-10">
						<p id="prdct_id" class="font-weight-bold">p1</p>
						<input type="hidden" name="prdct_id" value="p1"/> 
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
						<textarea id="board_content" name="board_content" class="form-control" style="" value="" maxlength="500" onkeyup="return textarea_maxlength(this)" placeholder="최대 500자까지 입력 가능합니다."></textarea>
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
		<footer>
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-lg-3 footer_widget">
							<div class="inner">
								<h4>About</h4>
							</div>
						</div>
						<div class="col-md-6 col-lg-3 footer_widget">
							<div class="inner">
								<h4>Company</h4>

							</div>
						</div>
						<div class="col-md-6 col-lg-3 footer_widget">
							<div class="inner">
								<h4>Recent Posts</h4>
							</div>
						</div>
						<div class="col-md-6 col-lg-3 footer_widget">
							<div class="inner">
								<h4 style="padding-left: 100px;">Address</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div class="copyright-txt">© 2017 Flat Pro. All Rights Reserved.</div>
						</div>
						<div class="col-lg-6 text-right">
							<div class="footer-nav">
								<a href="#">Home</a> <a href="#">Portfolio</a> <a href="#">Pages</a> <a href="#">Shortcode</a> <a href="#">Blog</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</footer>
		<div class="container-fluid">
			<small style="color: black;"> <strong>상호명 :</strong> (주)브랜치스 <strong>소재지 :</strong> 서울특별시 00구 00로00길 00 00빌딩 0층 <strong>팩스 :</strong>
				000-0000-0000 <strong>사업자등록번호 :</strong> 000-00-000000 <strong>통신판매업신고 :</strong> 0000-서울종로-00000
			</small> <br /> <small style="color: black;"><strong>고객센터</strong> 0000-0000 평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무) <strong>이메일</strong>
				admin@branches.co.kr <strong>대표이사</strong> 000 <strong>개인정보책임자</strong> 000 <strong>호스팅서비스</strong> (주)00000</small>
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