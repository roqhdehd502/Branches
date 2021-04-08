<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Branches</title>

</head>
<body>
	<header style="padding-top: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-6 col-sm-3 logo-column">
					<a href="/member/main" class="logo" style="height: 70px;"> <img src="/img/branches_text.png" alt="logo" style="width: 160px; height: 70px;">
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
						 <sec:authorize access="isAnonymous()"> 
			            	<a href="/login" class="btn btn-primary btn-sm" style="color : white;">LOGIN</a>
						 </sec:authorize>
						 <br/>

						<sec:authorize access="hasRole('3')">
							<a class="btn btn-primary btn-sm" style="color : white;" href="${pageContext.request.contextPath}/member/mypage">MYPAGE</a>

							<form action="/logoutsuccess" method="post" id="mlogout">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
								<a  class="btn btn-primary btn-sm" style="color : white;" href="#" class="charity-strip-btn charity-bgcolor" onclick="document.getElementById('mlogout').submit();">LOGOUT</a>
							</form>
						</sec:authorize>
						
						<sec:authorize access="hasRole('2')">
							<a class="btn btn-primary btn-sm" style="color : white;" href="${pageContext.request.contextPath}/seller/mypage">MYPAGE</a>

							<form action="/logoutsuccess" method="post" id="mlogout">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
								<a class="btn btn-primary btn-sm" style="color : white;" href="#" class="charity-strip-btn charity-bgcolor" onclick="document.getElementById('mlogout').submit();">LOGOUT</a>
							</form>
						</sec:authorize>

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
				<li class="current-menu-item has-child"><a href="index.html">DRESS</a>
					<ul class="sub-menu">
						<li><a href="index.html">Mini</a></li>
						<li><a href="index-2.html">Midi</a></li>
						<li><a href="index-3.html">Maxi</a></li>
						<li><a href="index-3.html">Overrall</a></li>
					</ul></li>
				<li class="current-menu-item has-child"><a href="index.html">BAG</a>
					<ul class="sub-menu">
						<li><a href="index.html">Backpack</a></li>
						<li><a href="index-2.html">Messenger / Cross</a></li>
						<li><a href="index-3.html">Shoulder / Tod</a></li>
						<li><a href="index-2.html">Eco Bag</a></li>
						<li><a href="index-3.html">Clutch</a></li>
					</ul></li>
				<li class="current-menu-item has-child"><a href="index.html">SHOES</a>
					<ul class="sub-menu">
						<li><a href="index.html">Dress Shoes</a></li>
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
				<li><a href="index.html" style="color: white;">|</a></li>
				<li><a href="index.html" style="color: white;">BRAND</a></li>
				<li><a href="index.html" style="color: white;">MAGAZINE</a></li>
				<li><a href="index.html" style="margin-right: 38px; color: white;">NOTICE</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>