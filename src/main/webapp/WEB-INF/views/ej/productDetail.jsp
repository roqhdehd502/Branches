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

<link rel="stylesheet" href="/ej/star-rating-svg.css">
<!-- AJAX용 JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<style>
span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
}
 
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
}
body {
  font-family: Arial;
  margin: 0;
}

* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}


.active,
.demo:hover {
  opacity: 1;
}
</style>
<script>
$.fn.generateStars = function() {
    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
};

// 숫자 평점을 별로 변환하도록 호출하는 함수
$('.star-prototype').generateStars();

</script>
	<script type="text/javascript">
		$(document).ready(function (){
			$('#detailForm').sbmit(function(event){
				event.preventDefault();
				console.log("ajax 호출전");
				var prdct_id = $("#prdct_id").val();
		        var prdct_name = $("#prdct_name").val();
		        var prdct_price = $("#prdct_price").val();
		        var category_number = $("#category_number").val(); 
				
		        var form = {
		        		prdct_id: prdct_id,
		        		prdct_name: prdct_name,
		        		prdct_price: prdct_price,
		        		category_number: category_number
		        };
	 
				$.ajax({
					type : 'PUT',
					url : $(this).attr("action"),
					cache : false,
					contentType:'application/json; charset=utf-8', 
					success: function(result){
						console.log(result);
						if(result=="SUCCESS"){
							if(result == "SUCCESS"){     
	                  					$(location).attr('href', '${pageContext.request.contextPath}/ej/productDetail')                            
	               				}  
						}
					},
					error:function(e){
						console.log(e);
					}
				})
			});	
		});	
	</script>

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

		<!-- 상세페이지 내용	 -->
		<form id="detailForm" action="${pageContext.request.contextPath}/ej/prd/${productDetail.prdct_id}" method="post">
		<div class="detail-area sp">
			<div class="container" style="align-content: center;">

				<!-- 	상품 카테고리 분류  -->
				<div class="item categories">
					<a>카테고리 분류</a>
				</div>

				<!-- 상품 상세 이미지 -->
				<div class="left-container">
					<!-- 사진 슬라이딩 처리 -->
					<div style="float: left; margin-right: 20px; margin-left: 100px; ">
						<div class="container">
							<div class="mySlides" style="width:400px; height:600px;" >
								<img src="https://image.msscdn.net/images/goods_img/20200205/1291017/1291017_1_500.jpg" style="width: 100%">
							</div>

							<div class="mySlides" style="width:400px; height:600px;">
								<img src="https://image.msscdn.net/images/goods_img/20200820/1557508/1557508_1_500.jpg" style="width: 100%">
							</div>

							<div class="mySlides" style="width:400px; height:600px;">
								<img src="https://image.msscdn.net/images/prd_img/20200820/1557508/detail_1557508_2_500.jpg" style="width: 100%">
							</div>

							<a class="prev" onclick="plusSlides(-1)">❮</a> <a class="next" onclick="plusSlides(1)">❯</a>
							<script>
							var slideIndex = 1;
							showSlides(slideIndex);

							function plusSlides(n) {
								showSlides(slideIndex += n);
							}

							function currentSlide(n) {
								showSlides(slideIndex = n);
							}

							function showSlides(n) {
								var i;
								var slides = document
										.getElementsByClassName("mySlides");
								var dots = document
										.getElementsByClassName("demo");
								var captionText = document
										.getElementById("caption");
								if (n > slides.length) {
									slideIndex = 1
								}
								if (n < 1) {
									slideIndex = slides.length
								}
								for (i = 0; i < slides.length; i++) {
									slides[i].style.display = "none";
								}
								for (i = 0; i < dots.length; i++) {
									dots[i].className = dots[i].className
											.replace(" active", "");
								}
								slides[slideIndex - 1].style.display = "block";
								dots[slideIndex - 1].className += " active";
								captionText.innerHTML = dots[slideIndex - 1].alt;
							}
						</script>
						</div>
						
					</div>
				</div>

				<!--  상품 정보와 옵션 선택 -->
					<div class="row">
						<div class="contrainer single-service bordered " style="height: 600px; width: 500px;">
							<div class="inner">
								<h4>${productDetail.mbr_id}</h4>
								<h4>${productDetail.prdct_name}</h4>
								<h4>${productDetail.prdct_price}원</h4>
								<hr>

								<!-- 색상 옵션	 -->
								<div class="form-group">
									<label for="colorSelect" class="col-sm-2 col-form-label">Color</label>
									<select class="form-control" id="colorSelect">
									<c:forEach items="${productInfo}" var="productInfo">
										<option value="${productInfo}">${productInfo.prdct_color} / ${productInfo.prdct_size}</option>
									</c:forEach>	
									</select>
								</div>

								
								<hr>
								<!--  구매 버튼 및 찜하기  -->
								<div class="row">
									<div style="float: left; width: 30%; padding-left: 20px">
										<button type="button" class="btn btn-primary">바로구매</button>
									</div>
									<div style="float: left; width: 30%; padding-left: 20px">
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
									<span class="star-prototype"></span> (4.0)	 <!-- 데이터로 별점 끌어씀 -->
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
											<div class="profile" style="text-align: left; align-content: center;">
												<p>
													<span class="gallery_lv"> <span class="notCrawlText" style="font-weight: bold;">Silver(등급) dododndn(아이디)</span>
													</span> <span class="date last" style="clear: left; float: right;"> 12시간 전 </span>
												</p>
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
														<span class="content-review"> 옷이 탄탄해서 체형보정에도 좋을 것같고 오래입을수 있을것같아요 </span>
													</div>

													<!-- 개인 별점 --> 
													 <span class="star-prototype"></span> (4.5) <!-- 데이터로 별점 끌어씀 -->							

													<!-- 리뷰사진 -->
													<div class="pContent_Img img3 photoReview">
														<img class="gallery-images" src="https://image.msscdn.net/images/goods_img/20200820/1557658/1557658_2_500.jpg"
															alt="디스이즈네버댓(THISISNEVERTHAT) INTL. Logo Crewneck Black 후기">
													</div>
												</div>
											</div>
										</div>
										
										<!-- 댓글달기 구현 -->
										<div  class="form-group row"  > 
											<input class="text col-sm-10" id="replyInput" placeholder="댓글을 입력하세요." >
											<button type="button" class="btn btn-primary">댓글달기</button>
										</div>

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
      </form>
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
