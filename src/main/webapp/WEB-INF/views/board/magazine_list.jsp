<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Magazine Board List</title>
	
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
	
	<!-- thumbnail image hover -->
	<style type="text/css">
		.thumbnail:hover {
			background-color: #e0e0e0;
		}
	</style>
</head>
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

		<hr style="margin: 15px 15px 40px 15px;">



		<div class="container">
			<div class="container">
				<h2>MAGAZINE</h2>
			</div>
			<div class="container" align="center">
				<div class="row">		
					<c:forEach items="${magazine_list}" var="dto">	
					<div class="col-md-4 contact-info">
						<div class="thumbnail">
							<a href="${pageContext.request.contextPath}/board/magazine/${dto.board_id}">
								<div style="padding-top: 7px">
									<img src="<c:url value="/img/magazine01.jpg"/>" width="318px" height="212px">
								</div>
								<div>
									<hr>
									<span><h5>${dto.board_name}</h5></span>
									<span class="badge badge-primary badge-pill">${dto.board_like}</span>
								</div>
							</a>
							<div>
								<span>${dto.board_date}</span>
								<span>&nbsp;|&nbsp;</span>
								<span>${dto.board_hit}</span>
								<hr>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>		
			</div>
				<div class="container">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
					</ul>
					<%-- <c:if test="${pageMaker.prev}">
						<li class="page-item">
							<a href="board${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
						</li>
					</c:if>
				
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
						<li class="page-item">
							<a href="board${pageMaker.makeQuery(idx)}">${idx}</a>
						</li>
					</c:forEach>
						
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item">
						 	<a href="board${pageMaker.makeQuery(pageMaker.endPage +1)}">다음</a>
						</li>
					</c:if> --%>
				</div>
			</div>	
		</div>
	<!-- </div> -->

	<hr>

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
</body>
</html>