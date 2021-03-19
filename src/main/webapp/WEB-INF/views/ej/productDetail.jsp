<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Product Detail</title>

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
</head>

<body>
	<div class="preloader">
		<span class="preloader-spin"></span>
	</div>
	<div class="site">

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

		<!-- 상세페이지 내용	 -->
		<div class="detail-area sp">
			<div class="container">

				<!-- 	상품 카테고리 분류  -->
				<div class="item categories">
					<a>카테고리 분류</a>
				</div>

				<!-- 상품 상세 이미지 -->
				<div class="left-container">
					<!-- 사진 슬라이딩 처리 -->
					<div style="float: left; margin-right: 20px;">
						<img src="https://image.msscdn.net/images/goods_img/20200820/1557658/1557658_2_500.jpg" />
					</div>
				</div>

				<!--  상품 정보와 옵션 선택 -->
				<div class="row">
					<div class="contrainer single-service bordered " style="height: 600px; width: 500px;">
						<div class="inner">
							<h4>thisisneverthat</h4>
							<h4>INTL. Logo Crewneck</h4>
							<h4>44,400원</h4>
							<hr>

							<!-- 색상 옵션	 -->
							<div class="form-group">
								<label for="colorSelect" class="col-sm-2 col-form-label">Color</label> <select class="form-control" id="colorSelect">
									<option value="">gray</option>
									<option value="">blcak</option>
									<option value="">white</option>
									<option value="">green</option>
								</select>
							</div>

							<!-- 사이즈 옵션 -->
							<div class="form-group">
								<label for="sizeSelect" class="col-sm-2 col-form-label">Size</label> <select class="form-control" id="sizeSelect">
									<option value="">S</option>
									<option value="">M</option>
									<option value="">L</option>
									<option value="">XL</option>
								</select>
							</div>
							<hr>
							<!--  구매 버튼 및 찜하기  -->
							<div class="row">
								<div style="float: left; width: 25%; padding-left: 20px">
									<button type="button" class="btn btn-primary">바로구매</button>
								</div>
								<div style="float: left; width: 25%; padding-left: 20px">
									<button type="button" class="btn btn-primary">장바구니</button>
								</div>
								<div class="icon" style="float: left; padding-left: 20px; padding-top: 10px;">
									<i class="fa fa-heart-o fa-2x"> 찜하기</i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!--제품 상세페이지 tab -->
			<div class="container">
				<br>
				<div align="center">
					<ul class="nav nav-tabs" role="tablist">
						<!-- 이벤트 클릭 넣어서 누르면 해당 부분으로 이동하게 구현 -->
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link active" data-toggle="tab" href="#detail">Detail</a></li>
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#review">Review</a></li>
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#qna">Q & A</a></li>
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#return">Return & Delivery</a></li>
					</ul>
				</div>
				<!-- Tab panes -->
				<div class="tab-content">
					<div id="detail" class="container tab-pane active">
						<br>
						<!-- 상품 상세정보 이미지로 등록 -->
						<div class="gallery-area spb">
							<div class="container">
								<div class="section-title" data-margin="0 0 40px">
									<h2>상품 상세 정보</h2>
									<p>아래쪽은 이미지로 생성된 상품 상세 정보를 입력하는 페이지 입니다.</p>
								</div>
								<div class="row">
									<div class="col-md-12 single-gallery">
										<div class="inner">
											<img src="/assets/img/gallery-1.jpg" alt="">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 리뷰 페이지 tab -->
			<div class="container">
				<br>
				<div align="center">
					<ul class="nav nav-tabs" role="tablist">
						<!-- 이벤트 클릭 넣어서 누르면 해당 부분으로 이동하게 구현 -->
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#detail">Detail</a></li>
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link active" data-toggle="tab" href="#review">Review</a></li>
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#qna">Q & A</a></li>
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#return">Return & Delivery</a></li>
					</ul>
				</div>
				<!-- Tab panes -->
				<div class="tab-content">
					<div id="review" class="container tab-pane active">
						<br>
						<div class="container">
							<div class="section-title" data-margin="0 0 40px">
								<h3 class="title-box font-mss">Review</h3>
								<!-- 상품 총 별점 -->
								<div class="wrap-estimate-avg">
									<span class="tit">구매 만족도</span>
									<div class="estimate-point" id="estimate_point">
										<span class="img-score"><span class="bar" style="width: 95%"> <!-- 사진자리/별점 평균 -->
										</span></span>
									</div>
								</div>
								<!-- 상품 총 별점 끝 -->
								<!--리뷰 사진/일반 모아보기 기능  -->
								<ul class="snb">
									<li class="box-tab-btn tab-btn btn active" data-for="total-estimate"><p class="text-primary">
											<span class="korSub" id="estimate_total">전체 후기 (113)</span>
										</p></li>
									<li class="box-tab-btn tab-btn btn" data-for="photo-estimate"><p class="text-primary">
											<span class="korSub" id="estimate_photo">상품 사진 후기 (63)</span>
										</p></li>
									<li class="box-tab-btn tab-btn btn" data-for="list-estimate"><p class="text-primary">
											<span class="korSub" id="estimate_goods">일반 후기 (50)</span>
										</p></li>
									<li class="box-tab-btn tab-btn btn" data-for="select-estimate">
										<!-- <div class="form-group"> --> <select class="form-control" id="review_sort">
											<option value="new" selected="selected">최신순</option>
											<option value="comment_cnt_desc">댓글 순</option>
											<option value="up_cnt_desc">추천 순</option>
											<option value="goods_est_desc">높은 평점 순</option>
											<option value="goods_est_asc">낮은 평점 순</option>
									</select>
								</ul>
								<!-- 리뷰 틀 -->
								<div class="card bg-light mb-3" style="max-width: 1000px;">
									<div class="card-header">
										<div class="postContents container style_est_cont">
											<div class="profile">
												<p>
													<span class="gallery_lv"> <span class="notCrawlText" style="font-weight: bold;">Silver(등급) dododndn(아이디)</span>
													</span> <span class="date last"> 12시간 전 </span>

												</p>
												<!-- url 복사 -->
												<div class="url-copy-btn plain-btn btn" id="url_copy">
													<span class="url">URL복사</span> <input type="hidden" name="copyUrl" value="">
												</div>
											</div>
										</div>
									</div>
									<div class="card-body">
										<!--관련 상품-->
										<div class="connect_product estimate-item">
											<div class="connect_review_info">
												<div>
													<a class="list_info p_name" href="#"> INTL. Logo Crewneck Black </a>
												</div>
												<p class="txt_option">
													L 구매 <span class="estimate-profile">남성, 177cm, 67kg</span>
												</p>
											</div>
										</div>

										<div class="pContent">
											<!-- 요약보기 -->
											<div class="summary" style="cursor: pointer;">
												<div class="cArea">
													<div class="pContent_text">
														<span>별점</span> <span class="content-review"> 옷이 탄탄해서 체형보정에도 좋을 것같고 오래입을수 있을것같아요 </span>
													</div>
													<div class="pContent_Img img3 photoReview">
														<img class="gallery-images" src="https://image.msscdn.net/images/goods_img/20200820/1557658/1557658_2_500.jpg"
															alt="디스이즈네버댓(THISISNEVERTHAT) INTL. Logo Crewneck Black 후기">
													</div>
												</div>
											</div>
										</div>
										<!--comment-->
										<!-- 댓글달기 구현 -->
										<!--//comment-->

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Q&A 페이지 tab -->
		<div class="container">
			<br>
			<div align="center">
				<ul class="nav nav-tabs" role="tablist">
					<!-- 이벤트 클릭 넣어서 누르면 해당 부분으로 이동하게 구현 -->
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#detail">Detail</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#review">Review</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link  active" data-toggle="tab" href="#qna">Q & A</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#return">Return & Delivery</a></li>
				</ul>
			</div>
			<!-- Tab panes -->
			<div class="tab-content">
				<div id="qna" class="container tab-pane active">
					<br>
					<div class="gallery-area spb">
						<div class="container">
							<div class="section-title" data-margin="0 0 40px">
								<table class="table">
									<!-- 한 페이지 글 몇개, 페이징 처리 -->
									<thead>
										<tr>
											<td>번호</td>
											<td>문의유형</td>
											<td>제목</td>
											<td>작성자</td>
											<td>등록일자</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>123</td>
											<td>상품문의</td>
											<td><a href=#>상품관련 문의 입니다.</a></td>
											<td>asdf1234</td>
											<td>2021-03-18</td>
										</tr>
										<tr>
											<td>122</td>
											<td>배송문의</td>
											<td><a href=#>배송관련 문의 입니다.</a></td>
											<td>kok12</td>
											<td>2021-03-18</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 환불 배송 안내 페이지 tab -->
		<div class="container">
			<br>
			<div align="center">
				<ul class="nav nav-tabs" role="tablist">
					<!-- 이벤트 클릭 넣어서 누르면 해당 부분으로 이동하게 구현 -->
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#detail">Detail</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#review">Review</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#qna">Q & A</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link active" data-toggle="tab" href="#rende">Return & Delivery</a></li>
				</ul>
			</div>
			<!-- Tab panes -->
			<div class="tab-content">
				<div id="rende" class="container tab-pane active">
					<br>
					<div class="pdt_contents delivery">
						<div class="title">
							<h5>배송/교환/반품/AS 관련 유의사항</h5>
							<p>상품상세설명에 배송/교환/반품/취소 관련 안내가 기재된 경우 다음 안내사항보다 우선 적용됩니다.</p>
						</div>
						<table class="table">
							<colgroup>
								<col width="270">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th>배송정보</th>
									<td>
										<ul>
											<li>상품별로 상품 특성 및 배송지에 따라 배송유형 및 소요기간이 달라집니다.</li>
											<li>일부 주문상품 또는 예약상품의 경우 기본 배송일 외에 추가 배송 소요일이 발생될 수 있습니다.</li>
											<li>동일 브랜드의 상품이라도 상품별 출고일시가 달라 각각 배송될 수 있습니다.</li>
											<li>도서 산간 지역은 별도의 배송비와 반품비가 추가될 수 있습니다.</li>
											<li>상품의 배송비는 공급업체의 정책에 따라 다르오며 공휴일 및 휴일은 배송이 불가합니다.</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th>취소/반품/교환 안내</th>
									<td>
										<ul>
											<li class="bold">상품하자 이외 사이즈, 색상교환 등 단순 변심에 의한 교환/반품 택배비 고객부담으로 왕복택배비가 발생합니다. (전자상거래 등에서의 소비자보호에 관한 법률 제18조(청약 철회등)9항에 의거 소비자의 사정에 의한
												청약 철회 시 택배비는 소비자 부담입니다.)</li>
											<li>결제완료 직후 즉시 주문취소는 "MY Page&gt; 취소/교환/반품 신청"에서 직접 처리 가능합니다.</li>
											<li>주문완료 후 재고 부족 등으로 인해 주문 취소 처리가 될 수도 있는 점 양해 부탁드립니다.</li>
											<li>주문상태가 상품준비중인 경우 이미 배송을 했거나 포장을 완료했을 수 있어 직접 처리가 불가하오니 고객센터를 통해 문의 바랍니다.</li>
											<li>교환 신청은 최초 1회에 한하며, 교환 배송 완료 후에는 추가 교환 신청은 불가합니다.</li>
											<li>반품/교환은 미사용 제품에 한해 배송완료 후 7일 이내 접수하여 주십시오.</li>
											<li>임의반품은 불가하오니 반드시 고객센터나 "MY Page&gt; 주문취소/교환/반품 신청"을 통해서 신청접수를 하시기 바랍니다.</li>
											<li>상품하자, 오배송의 경우 택배비 무료로 교환/반품이 가능하지만 모니터의 색상차이, 착용감, 사이즈의 개인의 선호도는 상품의 하자 사유가 아닙니다.</li>
											<!--<li>단 위생용품 및 가전, 가구, 귀금속 등의 경우 취소/교환/반품 요청이 제한될 수 있습니다.</li>-->
											<!--<li>주문제작 상품 및 상품의 본품박스, 택 등이 제거되어 있을 경우 반품 / 교환이 불가능합니다.</li>-->
											<li>고객 부주의로 상품이 훼손, 변경된 경우 반품 / 교환이 불가능 합니다.</li>
											<li>취소/반품 대금환불이 지연 시 전자상거래법에 의거하여 환불지연 배상처리 절차가 진행됩니다.</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th>반품/교환 불가능한 경우</th>
									<td>
										<ul>
											<li>제품을 사용 또는 훼손한 경우, 사은품 누락, 상품 TAG, 보증서, 상품 부자재가 제거 혹은 분실된 경우</li>
											<li>밀봉포장을 개봉했거나 내부 포장재를 훼손 또는 분실한 경우(단, 제품확인을 위한 개봉 제외)</li>
											<li>시간이 경과되어 재판매가 어려울 정도로 상품가치가 상실된 경우</li>
											<li>고객님의 요청에 따라 주문 제작되어 고객님 외에 사용이 어려운 경우</li>
											<li>배송된 상품이 설치가 완료된 경우(가전, 가구 등)</li>
											<li>기타 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 청약철회 제한사유에 해당하는 경우</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th>A/S 안내</th>
									<td>
										<ul>
											<li>A/S 기준이나 가능여부는 브랜드와 상품에 따라 다르므로 관련 문의는 Branches 고객센터를 통해 부탁드립니다.</li>
											<li>상품불량에 의한 반품, 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁해결기준(공정거래위원회 고시)에 따라 받으실 수 있습니다.</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>



				</div>
			</div>
		</div>
		<hr>

	</div>
	<!-- 상품컨텐츠 내용 전체 컨테이너 끝 -->
	<footer>
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-3 footer_widget">
						<div class="inner">
							<h4>About</h4>
							<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
							<p>Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, antesenectus et netus et malesuada fames ac turpis egestas.</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 footer_widget">
						<div class="inner">
							<h4>Company</h4>
							<ul>
								<li><a href="#">Company Overview</a></li>
								<li><a href="#">Meet The Team</a></li>
								<li><a href="#">Our Awesome Partners</a></li>
								<li><a href="#">Our Services</a></li>
								<li><a href="#">Frequently Asked Questions</a></li>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Terms of Use</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 footer_widget">
						<div class="inner">
							<h4>Recent Posts</h4>
							<div class="media">
								<a href="#"> <img src="/assets/img/recent1.jpg" class="d-flex mr-3" alt="">
								</a>
								<div class="media-body">
									<h5>
										<a href="#">Curling irons are as individual as the women</a>
									</h5>
									<span>June 22, 2017</span>
								</div>
							</div>
							<div class="media">
								<a href="#"> <img src="/assets/img/recent2.jpg" class="d-flex mr-3" alt="">
								</a>
								<div class="media-body">
									<h5>
										<a href="#">Curling irons are as individual as the women</a>
									</h5>
									<span>June 22, 2017</span>
								</div>
							</div>
							<div class="media">
								<a href="#"> <img src="/assets/img/recent3.jpg" class="d-flex mr-3" alt="">
								</a>
								<div class="media-body">
									<h5>
										<a href="#">Curling irons are as individual as the women</a>
									</h5>
									<span>June 22, 2017</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 footer_widget">
						<div class="inner">
							<h4>Address</h4>
							<h5>Flat Pro, Inc.</h5>
							<p>
								649 Folsom Ave, Suite 400 <br>San Francisco, CA 63105 <br>P: (123) 456-7890
							</p>
							<h4>Newsletter</h4>
							<form action="#" class="nw_form">
								<input placeholder="Enter your email" type="email">
								<button>
									<i class="fa fa-paper-plane"></i>
								</button>
							</form>
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
