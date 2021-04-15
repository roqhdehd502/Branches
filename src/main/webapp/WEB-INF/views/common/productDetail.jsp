<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- 사진 슬라이딩 처리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

</head>
<style>
span.star-prototype, span.star-prototype>* {
	height: 16px;
	background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	width: 80px;
	display: inline-block;
}

span.star-prototype>* {
	background-position: 0 0;
	max-width: 80px;
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
.prev, .next {
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
.prev:hover, .next:hover {
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

.active, .demo:hover {
	opacity: 1;
}

.swiper-container {
	height: 220px;
	border: 1px solid gray;
	border-radius: 5px;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	max-width: 100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
}

</style>
<script>
	$.fn.generateStars = function() {
		return this.each(function(i, e) {
			$(e).html($('<span/>').width($(e).text() * 16));
		});
	};

	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();
</script>
<script type="text/javascript">
	$(document)
		.ready(
			function() {
				$('#modalForm')
					.submit(
						function(event) {
						event.preventDefault();
						console.log("ajax 호출전");
						var prdct_id = $("#prdct_id").val();
						var prdct_name = $("#prdct_name")
							.val();
						var prdct_price = $("#prdct_price")
							.val();
						var category_number = $(
							"#category_number").val();

						var form = {
							prdct_id : prdct_id,
							prdct_name : prdct_name,
							prdct_price : prdct_price,
							category_number : category_number
						};

				$
				.ajax({
					type : 'PUT',
					url : $(this).attr("action"),
					cache : false,
					contentType : 'application/json; charset=utf-8',
					success : function(result) {
						console.log(result);
						if (result == "SUCCESS") {
							if (result == "SUCCESS") {
								$(location)
								.attr('href','${pageContext.request.contextPath}/ej/productDetail')
							}
						}
					},
						error : function(e) {
							console.log(e);
						}
					})
				});
		});
</script>
<script>	
	function insertCart() {
		var cart = JSON.parse(sessionStorage.getItem("cartList"));
		if (!cart) {
			console.log("카트생성");
			cart = new Array();
		}
		
		var prdct = new Object();
		prdct.prdct_id = $("#prdct_id").val();  
		prdct.order_amount = $("#order_amount").val();
		prdct.order_color = $("#order_color").val();
		prdct.order_size = $("#order_size").val();
		prdct.prdct_price = $("#prdct_price").val();
		prdct.prdct_name = $("#prdct_name").val();
		prdct.thumbnail = $("#prdct_thumbnail").val();
		
			
		console.log(prdct);
		cart.push(prdct);
		console.log(prdct);
		
		sessionStorage.setItem("cartList", JSON.stringify(cart));
		
		if (confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?") == true) { 
			window.location.assign("/order/cart");
		} else { //취소
			return false;
		}
	}
	
	function getTotal() {
		var order_amount = $("#order_amount").val();
		var prdct_price = $("#prdct_price").val();
		total = parseInt(order_amount) * parseInt(prdct_price);
		$("#total-price").html(total);
	}

	$(document).ready(function() {
		// total 가격 계산
		getTotal();
		$("#order_amount").change(function() {
			getTotal();	
		})
		
	})
</script>
<!-- 찜하기 버튼을 누를경우 이벤트 발생 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#prdct_like_dis').click(function(event) {
			event.preventDefault();
			// 비로그인 상태시 찜하기 버튼을 누르면
			if ("${mbr.mbr_id}" == "") {
				if (confirm("로그인 한 회원만 이용가능합니다. 로그인 하시겠습니까?")) {
					// 승낙하면 로그인 페이지로 이동
					location.href = '${pageContext.request.contextPath}/login';
				} else {
					// 거부하면 해당 페이지 새로고침
					location.reload();
				}
			// 로그인 상태시 찜하기 버튼을 누르면	
			} else {
				// 해당 멤버ID와 상품ID의 정보를 가져온다
				var mbr_id = "${mbr.mbr_id}";
				var prdct_id = "${prdct.prdct_id}";
				var board_id = ${prdct.board_id};

				console.log("mbr_id: " + mbr_id);
				console.log("mbr_id type: " + (typeof mbr_id));
				console.log("prdct_id: " + prdct_id);
				console.log("prdct_id type: " + (typeof prdct_id));
				console.log("board_id: " + board_id);
				console.log("board_id type: " + (typeof board_id));

				var form = {
					mbr_id : mbr_id,
					prdct_id : prdct_id,
					board_id : board_id
				};

				$.ajax({ 
					type : "POST",
					url : "${pageContext.request.contextPath}/prdct/{prdct_id}",
					cache : false,
					contentType : 'application/json; charset=utf-8',
					data : JSON.stringify(form),
					/* beforeSend : function(xhr) {
						xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
					}, */
					success : function(result) {
						console.log(result);
						if (result == "SUCCESS") {
							console.log("찜 성공!")
							if (confirm("해당 상품을 찜하셨습니다. 목록 페이지로 이동하시겠습니까?")) {
								// 승낙하면 마이페이지의 찜하기 리스트로 이동
								location.href = '${pageContext.request.contextPath}/member/mypage/like';
							} else {
								// 거부하면 해당 페이지 새로고침하여 찜한거 반영되게하기(HTTP의 속성 때문...)
								location.reload();
							}
						}
					},
					error : function(e) {
						console.log(e);
						alert('찜할 수 없습니다.');
						location.reload(); // 실패시 새로고침하기
					}
				})
			}
		});
	});
</script>
<!-- 찜취소 버튼을 누를경우 이벤트 발생 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#prdct_like_ena').click(function(event) {
			event.preventDefault();
			
			// FormData 객체 생성
			var formData = new FormData();
			
			// 정보를 가져와 FormData에 append 한다 
			var prdct_like_number = $('#prd_like_num').text();

			console.log("prdct_like_number: " + prdct_like_number);
			console.log("prdct_like_number: " + (typeof prdct_like_number));
			
			formData.append("prdct_like_number", prdct_like_number);

			$.ajax({
				type : 'DELETE', 
				url : $(this).attr("href"), 
				cache : false, 
                processData: false, 
	    		contentType: false, 
                data: formData, 
				success: function(result) {
					console.log(result);
					if (result == "SUCCESS") {
						console.log("찜 취소 성공!")
						alert('해당 상품을 찜 취소 하셨습니다.');
						location.href = '${pageContext.request.contextPath}/prdct/${prdct.prdct_id}';
					}
				},
				error : function(e) {
					console.log(e);
					alert('찜 취소 할 수 없습니다.');
					location.reload(); // 실패시 새로고침하기
				}
			})
		});
	});
</script>
<body>

	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>

		<!-- 상세페이지 내용	 -->

		<div class="detail-area sp">
			<div class="container" style="align-content: center;">

				<!-- 	상품 카테고리 분류  -->
				<div class="item categories">
					<a>카테고리 분류</a> ${prdct.category_name}
				</div>

				<!-- 상품 썸네일 -->
				<div class="left-container">
					<!-- 사진 슬라이딩 처리 -->
					<div style="float: left; margin-right: 20px; margin-left: 50px;">
						<div class="container" style="margin-top: 50px; margin-bottom: 50px; margin-right: 50px; width: 500px; height: 600px;">
							<div style="height: 100%; align-content: center;">${prdct.prdct_thumbnail}</div>
						</div>
					</div>
				</div>

	 <!--  상품 정보와 옵션 선택 -->
		<form action="${pageContext.request.contextPath}/order/insert_cart" method="POST">

		<!-- 상세페이지 내용	 -->
			<div class="detail-area sp">
				<div class="container" style="align-content: center;">

					<!-- 	상품 카테고리 분류  -->
					<div class="item categories">
						<a>카테고리 분류</a>
						${prdct.category_name}
					</div>

					<!-- 상품 썸네일 -->
					<div class="left-container">
						<!-- 사진 슬라이딩 처리 -->
						<div style="float: left; margin-right: 20px; margin-left: 50px;">
							<div class="container" style="margin-top: 50px; margin-bottom: 50px; margin-right: 50px; width: 500px; height: 600px;">
								<div style="height: 100%; align-content: center;">
								${prdct.prdct_thumbnail}
								<input type="hidden" name="prdct_thumbnail" id="prdct_thumbnail" value="${prdct.prdct_thumbnail}"/>
								</div>
							</div>
						</div>
					</div>

					<!--  상품 정보와 옵션 선택 -->
					<form action="${pageContext.request.contextPath}/order/insert_cart" method="POST">
					<div class="row">
						<div class="contrainer single-service bordered " style="height: 600px; width: 500px;">
							<div class="inner">
								<input type="hidden" id="prdct_id" value="${prdct.prdct_id}">
								<p>${prdct.prdct_id}</p>
								<input type="hidden" id="prdct_name" value="${prdct.prdct_name}">
								<h4 id="prdct_name">${prdct.prdct_name}</h4>
								<input type="hidden" id="prdct_price" value="${prdct.prdct_price}">
								<h4 id="prdct_price">${prdct.prdct_price}원</h4>
								<hr>
								<!-- 색상/사이즈 옵션	 -->
								<div class="form-group">

									<label for="colorSelect" class="col-sm-2 col-form-label">Color</label> 
									<select class="form-control" id="colorSelect">
											<c:set var="prdct_color" value="${fn:split(prdct.prdct_color, ',')}" />
											<c:forEach var="color" items="${prdct_color}">
												<option id="order_color"value="${color}">${color}</option>
											</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label for="sizeSelect" class="col-sm-2 col-form-label">Size</label> 
									<select class="form-control" id="sizeSelect">
											<c:set var="prdct_size" value="${fn:split(prdct.prdct_size, ',')}" />
											<c:forEach var="size" items="${prdct_size}">
												<option id="order_size" value="${size}">${size}</option>
											</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label for="amountSelect" class="col-sm-2 col-form-label">수량</label> <select class="form-control" id="order_amount" name="order_amount">
										<c:forEach begin="1" end="10" var="i">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>
								</div>

								<hr>
								<!--  구매 버튼 및 찜하기  -->
								<div class="row">
									<div style="float: left; width: 30%; padding-left: 20px">
										<button type="submit" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/order/orderForm'">바로구매</button>
										<!-- 회원은 주문확인페이지, 비회원은 주문정보 입력 페이지로 연결.. -->
									</div>
									<div style="float: left; width: 30%; padding-left: 20px">
										<!-- 상품정보를 저장해서 장바구니로 이동 -->
										<button type="button" class="btn btn-primary" onclick="insertCart()">장바구니</button>
									</div>
									<!-- 상품 찜 기능 -->
									<div class="icon" style="float: left; padding-left: 20px; padding-top: 10px;">
										<!-- 인증된 회원 id 가져오기(필요없으면 해당 라인 삭제 가능) -->
										<span id="prdct_like_id" style="display: none;">${mbr.mbr_id}</span>
										<!-- 찜하기 했을 경우 해당 정보 가져오기 -->
										<span id="prd_like_num" style="display: none;">${prdLikeVal.prdct_like_number}</span>
										<!-- 마이페이지 찜하기 이동/ 계속쇼핑 만들어야되나 
											 21.04.14 나민우: 해당 기능 자바 스크립트로 기능 추가했습니다-->
										<!-- 찜하기 기능은 고객(MEMBER 권한)만 이용할 수 있게 설정 -->	 
										<sec:authorize access="isAnonymous()">
											<%-- 로그인 상태가 아니므로 자동으로 로그인 comfirm창이 뜨게 설정 --%>
											<i id="prdct_like_dis" class="fa fa-heart-o fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜하기</i>
										</sec:authorize>
										<sec:authorize access="hasAuthority('ADMIN')">
											<i class="fa fa-heart-o fa-2x">찜불가</i>
										</sec:authorize>
										<sec:authorize access="hasAuthority('SELLER')">
											<i class="fa fa-heart-o fa-2x">찜불가</i>	
										</sec:authorize>	 		
										<sec:authorize access="hasAuthority('MEMBER')">
											<c:choose>
												<%-- prdct_like 테이블을 가져와 비교후 예전에 찜하기를 했었다면 찜취소로 활성화가 된다 --%>
												<c:when test="${(prdLikeVal.prdct_id eq prdct.prdct_id) and (prdLikeVal.mbr_id eq mbr.mbr_id)}">
													<i id="prdct_like_ena" class="fa fa-heart fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜취소</i>
												</c:when>
												<%-- prdct_like 테이블을 가져와 비교후 예전에 찜하기를 안했다면(혹은 찜취소를 했었다면) 찜하기로 활성화가 된다 --%>
												<c:otherwise>
													<i id="prdct_like_dis" class="fa fa-heart-o fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜하기</i>
												</c:otherwise>
											</c:choose>
										</sec:authorize>
									</div>
									
								</div>
								<input type="hidden" name="total-price" id="total-price">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!--제품 상세페이지 tab -->
		<div class="container">
			<br>
			<div align="center">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link active" data-toggle="tab" onclick="location.href = '#detail';">Detail</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#review';">Review</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#qna';">Q & A</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#return';">Return
							& Delivery</a></li>
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
										<div style="padding-top: 7px; text-align: center;">
											 <img src="<c:url value="/prdct_img/${prdDetailimg.image_name}"/>"> 
											 ${prdct.board_content} 
											${prdct.board_content }
										</div>
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
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#detail';">Detail</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link active" data-toggle="tab" onclick="location.href = '#review';">Review</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#qna';">Q & A</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#return';">Return
							& Delivery</a></li>
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
								<span class="tit">구매 만족도</span> <span class="star-prototype"></span> (4.0)
								<!-- 데이터로 별점 끌어씀 -->
								<div class="estimate-point" id="estimate_point">
									<span class="img-score"><span class="bar" style="width: 95%"> <!-- 별점 평균 -->
									</span></span>
								</div>
							</div>
							<!-- 상품 총 별점 끝 -->

							<!-- 리뷰 사진 슬라이드 -->
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<img src="/hs/1.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/2.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/3.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/4.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/5.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/6.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/7.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/8.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/9.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/1.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/2.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/3.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/4.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/5.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/6.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/7.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/8.jpg" style="width: 200px; height: 200px;">
									</div>
									<div class="swiper-slide">
										<img src="/hs/9.jpg" style="width: 200px; height: 200px;">
									</div>

								</div>

								<!-- 네비게이션 -->
								<div class="swiper-button-next"></div>
								<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
								<div class="swiper-button-prev"></div>
								<!-- 이전 버튼 -->

								<!-- 페이징 -->
								<div class="swiper-pagination"></div>
							</div>

							<script>
								new Swiper('.swiper-container', {

									slidesPerView : 7, // 동시에 보여줄 슬라이드 갯수
									spaceBetween : 1, // 슬라이드간 간격
									slidesPerGroup : 7, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

									// 그룹수가 맞지 않을 경우 빈칸으로 메우기
									// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
									loopFillGroupWithBlank : true,

									loop : true, // 무한 반복

									pagination : { // 페이징
										el : '.swiper-pagination',
										clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
									},
									navigation : { // 네비게이션
										nextEl : '.swiper-button-next', // 다음 버튼 클래스명
										prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
									},
								});
							</script>

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
							<hr>
							<!-- 리뷰 틀 -->
							<div class="gallery-area spb">
								<c:forEach items="${reviewList}" var="list" varStatus="status">
									<div class="container">
										<div class="section-title" data-margin="0 0 40px">
											<table class="table">
												<!-- 한 페이지 글 몇개, 페이징 처리 -->
												<tr>
													<td><span class="star-prototype">
															<!-- 얘 보니까 별점 평균 끌어쓰는애라 확인하기 -->
													</span></td>
													<td>사진</td>
													<%-- <c:forEach items="${상품옵션}" var="dto"> --%>
													<td>
														<div data-toggle="modal" data-target="#myModal${list.board_id}">
															구매옵션:(리뷰작성한사람의 옵션..을 끌고와야되네)
															<%-- ${list2[status.index].prdct_size}  --%>
															<p>${list.board_content}</p>
														</div>

													</td>
													<td>${list.mbr_id}</td>
													<td>${list.board_date}</td>
												</tr>
											</table>

										</div>
									</div>


									<!-- 리뷰 모달창  -->
									<form id="modalForm" action="${pageContext.request.contextPath}/common/product/${prdct.prdct_id}" method="post">
										<div class="modal fade " id="myModal${list.board_id}" role="dialog">
											<div class="modal-dialog modal-xl">
												<div class="modal-content">

													<!-- Modal Header -->
													<div class="modal-header">
														<h4 class="modal-title">리뷰 보기</h4>
														<button type="button" class="close" data-dismiss="modal">×</button>
													</div>

													<!-- Modal body -->
													<div class="modal-body">
														<!-- 모달 리뷰 컨텐츠 내용 -->
														<div style="float: left; margin-left: 10px; margin-right: 50px;">
															<img class="popup_img" style="width: 300px; height: 300px; object-fit: cover;" src="/ej/view.staff_605be555e83ad.jpg">
														</div>
														<div class="container" style="width: 100%; height: 50%;">
															<div class="row">
																<div style="margin-right: 5px; text-align: left;">
																	<span id="review_writer">${list.mbr_id}</span> <span id="writeDate">[${list.board_date}]</span>
																	<div id="review_content">${list.board_content}</div>
																</div>
															</div>

															<div class="row">
																<table class="table-sm" style="width: 100%;">
																	<colgroup>
																		<col style="width: 15%">
																		<col style="width: 70%">
																		<col style="width: 15%">
																	</colgroup>
																	<tr>
																		<td scope="col">작성자</td>
																		<td scope="col">댓글 내용</td>
																		<td scope="col">작성일자</td>
																	</tr>
																</table>
															</div>
														</div>
													</div>
													<!-- Modal footer -->
													<div class="modal-footer">
														<!-- 모달 댓글 작성 -->
														<div class="form-group row" style="width: 100%;">
															<input class="text" id="replyInput" placeholder="댓글을 입력하세요." style="width: 91%;">
															<button type="submit" class="btn btn-primary">댓글달기</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</c:forEach>


								<div>
									<ul class="pagination">
										<c:choose>
											<c:when test="${pageMaker.prev}">
												<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
											<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
											<li class="page-item ${pageMaker.cri.pageNum == idx ? 'active' : '' }"><a class="page-link" href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
										</c:forEach>

										<c:choose>
											<c:when test="${pageMaker.next && pageMaker.endPage > 0}">
												<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
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
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#detail"
							onclick="location.href = '#detail';">Detail</a></li>
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" href="#review"
							onclick="location.href = '#review';">Review</a></li>
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link  active" data-toggle="tab" onclick="location.href = '#qna';">Q
								& A</a></li>
						<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#return';">Return
								& Delivery</a></li>
					</ul>
				</div>
				<!-- Tab panes -->
				<div class="tab-content">
					<div id="qna" class="container tab-pane active">
						<br>
						<div class="gallery-area spb">
							<div class="container">
								<div class="section-title" data-margin="0 0 40px">
									<table class="table" style="width: 100%;">
										<!-- 한 페이지 글 몇개, 페이징 처리 -->
										<colgroup>
											<col style="width: 10%">
											<col style="width: 15%">
											<col style="width: 35%">
											<col style="width: 15%">
											<col style="width: 15%">
										</colgroup>
										<thead>
											<tr>
												<td scope="col">번호</td>
												<td scope="col">문의유형</td>
												<td scope="col">제목</td>
												<td scope="col">작성자</td>
												<td scope="col">등록일자</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${prdQnAList}" var="dto">
												<tr>
													<td scope="col">${dto.board_id}</td>
													<td scope="col">${dto.inquiry_number}</td>
													<td scope="col"><a href="${pageContext.request.contextPath}/ej/prdqna/${dto.board_id}">${dto.board_name}</a></td>
													<td scope="col">${dto.mbr_id}</td>
													<td scope="col">${dto.board_date}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div style="text-align: center;">
										<!-- 상품 문의 등록으로 이동 -->
										<button type="submit" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/prdct/{prdct_id}/qna/write'">상품문의</button>
									</div>
								</div>
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

				<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#detail';">Detail</a></li>
				<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#review';">Review</a></li>
				<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#qna';">Q & A</a></li>
				<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link active" data-toggle="tab" onclick="location.href = '#return';">Return
						& Delivery</a></li>
			</ul>
		</div>
		<!-- Tab panes -->
		<div class="tab-content">
			<div id="return" class="container tab-pane active">
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

	<!-- 상품컨텐츠 내용 전체 컨테이너 끝 -->

	<!-- footer -->
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/footer.jsp"></jsp:include>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#detail';">Detail</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#review';">Review</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link" data-toggle="tab" onclick="location.href = '#qna';">Q & A</a></li>
					<li class="nav-item col-sm-3" style="margin-right: 0px;"><a class="nav-link active" data-toggle="tab" onclick="location.href = '#return';">Return
							& Delivery</a></li>
				</ul>
			</div>
			<!-- Tab panes -->
			<div class="tab-content">
				<div id="return" class="container tab-pane active">
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

		<!-- 상품컨텐츠 내용 전체 컨테이너 끝 -->

		<!-- footer -->
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/footer.jsp"></jsp:include>

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
