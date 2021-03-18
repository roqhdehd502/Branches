<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<header>
		<a href="/member/main"><img align="left" src="<c:url value="/img/branches_text.png"/>" width="200" height="100" style="float: left;"></a>
		<!-- 검색창 ---------------------------------------->
		<div class="col" align="center" style="clear: right; top: 40px; width: 500px; margin: auto">
			<div class="col-lg-12">
				<form id="searchForm" action="/board/list" method="get" style="top: 100px;">
					<select name="type">
						<option value="">전체보기</option>
						<option value="">상품명</option>
						<option value="">브랜드명</option>
						<option value="">상품+브랜드</option>
					</select> 
					<input type="text" name="keyword" value="${pageMaker.cri.keyword}" />
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<button class="btn btn-primary btn-sm">Search</button>
				</form>
			</div>
		</div>
		<!-- 검색창 -->
		<!-- 장바구니 아이콘 -->
		<div align="right" style="float: right; position: relative; right: 20px; top: 5px; margin: auto;">
			<a href="#"><img src="<c:url value="/img/shopping-cart.png"/>" width="40" height="40"></a>
		</div>
		<!-- 장바구니 아이콘 -->
		<!-- 로그인 버튼 -->
		<div align="right"><button class="btn btn-primary" style="margin-right: 45px; margin-top: 5px;">로그인</button></div>
		<!-- 로그인 버튼 -->

	</div>
	<div class="container-fluid" style="clear: both; padding: 0;" >
	<nav class="navbar navbar-expand-md navbar-dark bg-dark" >
		<div class="collapse navbar-collapse" id="navbarsExample04">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown col-md"><a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Outer </a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="#">Coat</a> 
						<a class="dropdown-item" href="#">Jacket</a>
						<a class="dropdown-item" href="#">Jumper/Mustang</a> 
						<a class="dropdown-item" href="#">Cardigan</a>
						<a class="dropdown-item" href="#">Padding</a>
					</div></li>

				<li class="nav-item dropdown col-md"><a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Top</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="#">T-shirt</a> 
						<a class="dropdown-item" href="#">Shirt/Blouse</a> 
						<a class="dropdown-item" href="#">Knit/Sweater</a>
						<a class="dropdown-item" href="#">Hoody</a> 
						<a class="dropdown-item" href="#">MTM</a>
						<a class="dropdown-item" href="#">Sleeveless</a>
					</div></li>

				<li class="nav-item dropdown col-md"><a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Bottom </a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="#">Denim</a> 
						<a class="dropdown-item" href="#">Cotton</a> 
						<a class="dropdown-item" href="#">Slacks</a> 
						<a class="dropdown-item" href="#">Shorts</a> 
						<a class="dropdown-item" href="#">Trainning/Jogger</a> 
						<a class="dropdown-item" href="#">Leggings</a>
						<a class="dropdown-item" href="#">Skirt</a>
					</div></li>

				<li class="nav-item dropdown col-md"><a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Dress </a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="#">Mini</a> 
						<a class="dropdown-item" href="#">Midi</a>
						 <a class="dropdown-item" href="#">Maxi</a> 
						 <a class="dropdown-item" href="#">Overall</a>
					</div></li>

				<li class="nav-item dropdown col-md"><a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Bag </a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="#">Backpack</a> 
						<a class="dropdown-item" href="#">Messenger/Cross</a> 
						<a class="dropdown-item" href="#">Shoulder/Tote</a>
						<a class="dropdown-item" href="#">Eco</a> 
						<a class="dropdown-item" href="#">Clutch</a>
					</div></li>

				<li class="nav-item dropdown col-md"><a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Shoes </a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="#">Shoes</a> 
						<a class="dropdown-item" href="#">Boots</a> 
						<a class="dropdown-item" href="#">Sandle</a> 
						<a class="dropdown-item" href="#">Slipper</a> 
						<a class="dropdown-item" href="#">Sneakers</a>
					</div></li>

				<li class="nav-item dropdown col-md"><a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">ETC </a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="#">Socks</a> 
						<a class="dropdown-item" href="#">Hat</a> 
						<a class="dropdown-item" href="#">Acc</a>
					</div></li>
				<li class="nav-item active col-md"><a class="nav-link" href="#">|</a></li>
				<li class="nav-item active col-md"><a class="nav-link" href="#">Notice <span class="sr-only" style="float: right;">(current)</span></a></li>
				<li class="nav-item active col-md"><a class="nav-link" href="#">Magazine <span class="sr-only">(current)</span></a></li>
				<li class="nav-item active col-md"><a class="nav-link" href="#">Q&A <span class="sr-only">(current)</span></a></li>
			</ul>
			<!-- <form class="form-inline my-2 my-md-0">
					<input class="form-control" type="text" placeholder="Search">
				</form> -->
			</div>
		</nav>
	</header>
	</div>
</body>
</html>