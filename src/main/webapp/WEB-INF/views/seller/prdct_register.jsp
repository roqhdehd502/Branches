<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Product Registration</title>
	
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
                     <li><a href="index-2.html">Jarcket</a></li>
                     <li><a href="index-3.html">Jumper / Mustang</a></li>
                     <li><a href="index-3.html">Cardigan</a></li>
                     <li><a href="index-3.html">Padding</a></li>
                  </ul></li>
               <li class="current-menu-item has-child"><a href="index.html">TOP</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">T-shirt</a></li>
                     <li><a href="index-2.html">Blouse / Shirt</a></li>
                     <li><a href="index-3.html">Knit / Sweater</a></li>
                     <li><a href="index-3.html">Hoddie</a></li>
                     <li><a href="index-3.html">Sweat shirt</a></li>
                     <li><a href="index-3.html">Sleeveless</a></li>
                  </ul></li>
               <li class="current-menu-item has-child"><a href="index.html">BOTTOM</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">Denim</a></li>
                     <li><a href="index-2.html">Cotton</a></li>
                     <li><a href="index-3.html">Shorts</a></li>
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
                     <li><a href="index-3.html">Overall</a></li>
                  </ul></li>
               <li class="current-menu-item has-child"><a href="index.html">Bag</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">Bagpack</a></li>
                     <li><a href="index-2.html">Messenger / Cross</a></li>
                     <li><a href="index-3.html">Shoulder / Tote</a></li>
                     <li><a href="index-2.html">Eco bag</a></li>
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
			<div class="row">
				<div class="col-md-3 contact-info" align="left" style="padding-left: 40px">
					<h2>이름(업체명)</h2>
					<h2>아이디</h2>
				</div>
				<div class="col-md-1 contact-info" align="center" style="padding-top: 20px">
					<a href="#">정보수정</a>					
				</div>
				<div class="col-md-6 contact-info"></div>
				<div class="col-md-2 contact-info" align="center" style="padding-right: 10px">
					<h2>새주문</h2>
					<h3>2건</h3>
				</div>
			</div>
		</div>
		
		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
	                    <h3>주문 관리</h3><hr>
	                    <h5><a href="#">전체</a></h5>
	                    <h5><a href="#">주문확인</a></h5>
	                    <h5><a href="#">발송확인</a></h5>
	                    <h5><a href="#">취소</a></h5>
	                    <h5><a href="#">교환</a></h5>
	                    <h5><a href="#">환불</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>상품 관리</h3><hr>
	                    <h5><a href="#">등록</a></h5>
	                    <h5><a href="#">수정</a></h5>
	                    <h5><a href="#">삭제</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>회원 관리</h3><hr>
	                    <h5><a href="#">Q&A</a></h5>
	                    <h5><a href="#">리뷰</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>매출 관리</h3><hr>
	                    <h5><a href="#">매출</a></h5>
	                </div>
				</div>	
				
				<div class="col-md-9 contact-info">
					<h3 >
					<strong>상품 등록</strong>
					</h3><hr>
					<form action="#" method="post">
						<fieldset>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">상품명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="상품명을 입력해주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">카테고리</label>
								<div class="col-sm-10">
									<select class="form-control">
										<option>아우터-코트</option>
										<option>아우터-자켓</option>
										<option>아우터-점퍼/무스탕</option>
										<option>아우터-가디건</option>
										<option>아우터-패딩</option>
										<option>상의-티셔츠</option>
										<option>상의-블라우스/셔츠</option>
										<option>상의-니트/스웨터</option>
										<option>상의-후드티</option>
										<option>상의-맨투맨</option>
										<option>상의-슬리브리스</option>
										<option>하의-데님</option>
										<option>하의-코튼</option>
										<option>하의-숏</option>
										<option>하의-슬랙스</option>
										<option>하의-트레이닝/조거</option>
										<option>하의-레깅스</option>
										<option>하의-스커트</option>
										<option>드레스-미니</option>
										<option>드레스-미디</option>
										<option>드레스-맥시</option>
										<option>드레스-오버롤</option>
										<option>가방-백팩</option>
										<option>가방-메신저/크로스</option>
										<option>가방-숄더/토트</option>
										<option>가방-에코백</option>
										<option>가방-클러치</option>
										<option>신발-구두</option>
										<option>신발-부츠</option>
										<option>신발-샌들</option>
										<option>신발-슬리퍼</option>
										<option>신발-스니커즈</option>
										<option>ETC-가방</option>
										<option>ETC-모자</option>
										<option>ETC-악세서리</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">색상</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="ex) BLOWN, DARK, NAVY">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">사이즈</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="ex) XL (혹은) 105">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">가격(원)</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" placeholder="가격을 입력해주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="3" placeholder="해당 상품에 대한 설명을 입력해주세요"></textarea>
									<input type="file" class="form-control-file">
									<small class="form-text text-muted">jpg, png, gif의 사진파일만 적용됩니다.</small>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">교환/반품</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="주소를 입력해주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">공급량</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" placeholder="공급량을 입력해주세요">
								</div>
							</div>
							<div align="center">
								<button type="submit" class="btn btn-primary">상품등록</button>
							</div>
						</fieldset>
					</form>			
				</div>
			</div>
		</div>
		
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