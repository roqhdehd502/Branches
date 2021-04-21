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
					<a href="/main" class="logo" style="height: 70px;"> 
						<img src="/img/branches_text.png" alt="logo" style="width: 160px; height: 70px;">
					</a>
				</div>
				<div class="col-9 col-sm-9 nav-column clearfix">
					<div class="right-nav" >
						<span class="search-icon fa fa-search"></span>
						<form action="#" class="search-form">
							<input type="search" placeholder="search now">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>	
						 <sec:authorize access="isAnonymous()"> 
						 <span style="position: relative; top: 18px; left: 640px;">
			            	<a href="/login">LOGIN</a>&nbsp;&nbsp;
			            	<a href="/order/cart">CART</a>
			            </span>	
						 </sec:authorize>

						<sec:authorize access="hasAuthority('MEMBER')">
							<span style="position: relative; top: 18px; left: 520px;">
								<span>
									<a href="${pageContext.request.contextPath}/member/mypage">MYPAGE</a>
								</span>&nbsp;&nbsp;
								<span>
									<a href="${pageContext.request.contextPath}/order/cart">CART</a>
								</span>&nbsp;&nbsp;
								<span>
									<form action="/logoutsuccess" method="post" id="mlogout">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
										<a href="#" class="charity-strip-btn charity-bgcolor" onclick="document.getElementById('mlogout').submit();">LOGOUT</a>
									</form>
								</span>
							</span>
						</sec:authorize>
						
						<sec:authorize access="hasAuthority('SELLER')">
							<span style="position: relative; top: 18px; left: 520px;">
								<span>
									<a href="${pageContext.request.contextPath}/seller/mypage">MYPAGE</a>
								</span>&nbsp;&nbsp;
								<span>
									<a href="${pageContext.request.contextPath}/order/cart">CART</a>
								</span>&nbsp;&nbsp;
								<span>
									<form action="/logoutsuccess" method="post" id="mlogout">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
										<a href="#" class="charity-strip-btn charity-bgcolor" onclick="document.getElementById('mlogout').submit();">LOGOUT</a>
									</form>
								</span>
							</span>	
						</sec:authorize>
						
						<sec:authorize access="hasAuthority('ADMIN')">
							<span style="position: relative; top: 18px; left: 520px;">
								<span>
									<a href="${pageContext.request.contextPath}/admin/mypage">MYPAGE</a>
								</span>&nbsp;&nbsp;
								<span>
									<a href="${pageContext.request.contextPath}/order/cart">CART</a>
								</span>&nbsp;&nbsp;
								<span>
									<form action="/logoutsuccess" method="post" id="mlogout">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
										<a href="#" class="charity-strip-btn charity-bgcolor" onclick="document.getElementById('mlogout').submit();">LOGOUT</a>
									</form>
								</span>
							</span>	
						</sec:authorize>
					</div>
				</div>
			</div>
		<nav id="menu" class="d-none d-lg-block">
			<ul style="padding: 10px; background-color: black;">
				<li class="current-menu-item has-child"><a href="#" style="text-decoration: none;">OUTER</a>
					<ul class="sub-menu">
						<li><a href="/category/1">Coat</a></li>
						<li><a href="/category/2">Jarket</a></li>
						<li><a href="/category/3">Jumper / Mustang</a></li>
						<li><a href="/category/4">Cardigan</a></li>
						<li><a href="/category/5">Padding</a></li>
					</ul></li>
				<li class="current-menu-item has-child"><a href="#" style="text-decoration: none;">TOP</a>
					<ul class="sub-menu">
						<li><a href="/category/6">T-Shirt</a></li>
						<li><a href="/category/7">Blouse / Shirt</a></li>
						<li><a href="/category/8">Knit / Sweater</a></li>
						<li><a href="/category/9">Hoddie</a></li>
						<li><a href="/category/10">Sweat Shirt</a></li>
						<li><a href="/category/11">Sleeveless</a></li>
					</ul></li>
				<li class="current-menu-item has-child"><a href="#" style="text-decoration: none;">BOTTOM</a>
					<ul class="sub-menu">
						<li><a href="/category/12">Denim</a></li>
						<li><a href="/category/13">Cotten</a></li>
						<li><a href="/category/14">Short</a></li>
						<li><a href="/category/15">Slacks</a></li>
						<li><a href="/category/16">Training / Jogger</a></li>
						<li><a href="/category/17">Leggings</a></li>
						<li><a href="/category/18">Skirt</a></li>
					</ul></li>
				<li class="current-menu-item has-child"><a href="#" style="text-decoration: none;">DRESS</a>
					<ul class="sub-menu">
						<li><a href="/category/19">Mini</a></li>
						<li><a href="/category/20">Midi</a></li>
						<li><a href="/category/21">Maxi</a></li>
						<li><a href="/category/22">Overrall</a></li>
					</ul></li>
				<li class="current-menu-item has-child"><a href="#" style="text-decoration: none;">BAG</a>
					<ul class="sub-menu">
						<li><a href="/category/23">Backpack</a></li>
						<li><a href="/category/24">Messenger / Cross</a></li>
						<li><a href="/category/25">Shoulder / Tod</a></li>
						<li><a href="/category/26">Eco Bag</a></li>
						<li><a href="/category/27">Clutch</a></li>
					</ul></li>
				<li class="current-menu-item has-child"><a href="#" style="text-decoration: none;">SHOES</a>
					<ul class="sub-menu">
						<li><a href="/category/28">Dress Shoes</a></li>
						<li><a href="/category/29">Boots</a></li>
						<li><a href="/category/30">Sandal</a></li>
						<li><a href="/category/31">slipper</a></li>
						<li><a href="/category/32">Sneakers</a></li>
					</ul></li>
				<li class="current-menu-item has-child"><a href="#" style="text-decoration: none;">ETC</a>
					<ul class="sub-menu">
						<li><a href="/category/36">Socks</a></li>
						<li><a href="/category/34">Cap</a></li>
						<li><a href="/category/35">Acc</a></li>
					</ul></li>
				<li><a href="#" style="color: white;">|</a></li>
				<li><a href="index.html" style="color: white; text-decoration: none;">BRAND</a></li>
				<li><a href="${pageContext.request.contextPath}/board/magazine" style="color: white; text-decoration: none;">MAGAZINE</a></li>
				<li><a href="${pageContext.request.contextPath}/board/notice" style="margin-right: 38px; color: white; text-decoration: none;">NOTICE</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>