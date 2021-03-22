<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Cart List</title>

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
	<header style="padding-bottom: 10px;">
		<div class="container">
			<div class="row">
				<div class="col-6 col-sm-3 logo-column">
					<a href="index.html" class="logo"> <img src="/img/branches_text.png" alt="logo">
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
				<ul style="padding: 10px;">
					<li class="current-menu-item has-child"><a href="index.html">OUTER</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">TOP</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">BOTTOM</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">SHOES</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">ACC</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">BRAND</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">SALE</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li><a href="index.html">|</a>
					</li>
					<li class="current-menu-item has-child"><a href="index.html">NOTICE</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul>
					</li>
					<li class="current-menu-item has-child"><a href="index.html">MAGAZINE</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul>
					</li>
					<li class="current-menu-item has-child"><a href="index.html" style="margin-right: 38px;">Q&A</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</header>
	<!-- 장바구니	 -->
		<div class="container" style="text-align: center;">

			<h3>Cart List</h3>
			<table class="table cart_table n-cart-table">
				<colgroup>
					<col width="5%">
					<col width="4%">
					<col width="20%">
					<col width="5%">
					<col width="16%">
					<col width="7%">
					<col width="9%">
					<col width="12%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col" style="cursor: pointer"><input type="checkbox" class="chk_all" id="chk_all" checked=""></th>
						<th scope="col">상품명(옵션)</th>
						<th scope="col">판매가</th>
						<th scope="col">수량</th>
						<th scope="col">주문금액<br></th>
						<th scope="col">주문관리</th>
						<th scope="col">배송</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${cartList}" var="cvo">
					<tr class="cart-group has_gift">
						<td colspan="9" class="cart_cont">
							<table class="table_basic cart_table">
								<colgroup>
									<col width="5%">
									<col width="4%">
									<col width="8%">
									<col width="20%">
									<col width="5%">
									<col width="16%">
									<col width="7%">
									<col width="9%">
									<col width="12%">
								</colgroup>
								<tbody>
									<tr class="cart_list_no">
										<td>1</td>
										<td><input type="checkbox" class="checked_cart" name="cart_no" value="${cvo.cart_number}" checked="checked"></td>
										<td>
											<div class="connect_img">
												<a href=# class="img-block"> <img src="//image.msscdn.net/images/goods_img/20200820/1557658/1557658_2_62.jpg"
													alt="디스이즈네버댓(THISISNEVERTHAT) INTL. Logo Crewneck Black">
												</a>
											</div>
										</td>
										<td>
											<div class="article_info connect_info">
												<p class="txt_brand"></p>
												<p class="list_info ">
													<a href="/app/goods/1557658/0"> [디스이즈네버댓] INTL. Logo Crewneck Black </a>
												</p>
												<p class="txt_option">옵션: M
											</div>
										</td>
										<td class="td_price">${cvo.cart_price}</td>
										<td>
											<!-- 수량 -->
											<div class="n-input-amount">
												<div class="form-group">
													<select class="form-control" id="exampleSelect1">
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
													</select>
												</div>
											</div>
										</td>
										<td>44,400<br>
										</td>
										<td><a href=# class="plain-btn btn">삭제하기</a></td>
										<td>택배 배송<br>
											<p>2,500</p>
										</td>
									</tr>
									<tr class="cart_list_no">
										<td>2</td>
										<td><input type="checkbox" class="checked_cart" name="cart_no" value="521779327" checked="checked"></td>
										<td>
											<div class="connect_img">
												<a href=# class="img-block"> <img src="//image.msscdn.net/images/goods_img/20200820/1557658/1557658_2_62.jpg"
													alt="디스이즈네버댓(THISISNEVERTHAT) INTL. Logo Crewneck Black">
												</a>
											</div>
										</td>
										<td>
											<div class="article_info connect_info">
												<p class="txt_brand"></p>
												<p class="list_info ">
													<a href="/app/goods/1557658/0"> [디스이즈네버댓] INTL. Logo Crewneck Black </a>
												</p>
												<p class="txt_option">옵션: M
											</div>
										</td>
										<td class="td_price">44,400</td>
										<td>
											<!-- 수량 -->
											<div class="n-input-amount">
												<div class="form-group">
													<select class="form-control" id="exampleSelect1">
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
													</select>
												</div>
											</div>
										</td>
										<td>44,400<br>
										</td>
										<td><a href="#" class="plain-btn btn">삭제하기</a></td>
										<td>택배 배송<br>
											<p>2,500</p>
										</td>
									</tr>
								</tbody>
								
							</table>
						</td>
					</tr>
					<tr class="gift-division">
						<td colspan="9"></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<button type="button" class="btn btn-primary"><a class="order-bnt" herf="#">주문하기</a></button>
			<br/>
			<br/>

		</div>

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
								<h4>Address</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
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
				customer@29cm.co.kr <strong>대표이사</strong> 000 <strong>개인정보책임자</strong> 000 <strong>호스팅서비스</strong> (주)00000</small>
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