<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : My Review List</title>
	
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
	
	<!-- 달력으로 날짜 선택 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
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

ul {
	list-style: none;
}

.accordion-box {
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
}

p.title {
	width: 100%;
	padding: 0 10px;
}

.con {
	padding: 20px;
	display: none;
}
</style>
<script>
	$(document).ready(function() {
		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$.fn.generateStars = function() {
			return this.each(function(i, e) {
				$(e).html($('<span/>').width($(e).text() * 16));
			});
		};
		$('.star-prototype').generateStars();
	});
</script>
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">
		
		<!-- 상단 회원 정보 요약 -->
		<div class="container">
			<div class="row" style="height: 50px;">
				<div class="col-md-3 contact-info" align="left" style="padding-left: 15px; margin-top: 10px; text-align: center;">
					<h2>${mbr.mbr_name}</h2>
				</div>
				<div class="col-md-1 contact-info" style="padding-top: 20px;">
					<a href="${pageContext.request.contextPath}/member/mypage/myinfo">정보수정</a>
				</div>
				<div class="col-md-6 contact-info"></div>
				<div class="col-md-2 contact-info" align="center" style="padding-right: 10px">
					<h2>Point</h2>
					<h3>${mbr.mbr_point}</h3>
				</div>
			</div>
			<span style="margin-left: 14px;"> </span> <span style="margin-left: 400px;" align="center"> </span>
		</div>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<!-- 왼쪽 사이드 메뉴  -->
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
						<h3>나의 쇼핑활동</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/order">주문내역 조회</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/recently">최근 본 상품</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/like">찜한 목록</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>매거진</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/board/magazine">매거진</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>내가 쓴 리뷰보기</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/review/list">구매후기</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/prdctq/list">상품문의</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/myqna/list">고객Q&A</a>
						</h5>
					</div>
				</div>


				<div class="col-md-9 contact-info" style="border-left: 1px solid rgba(0, 0, 0, .1);">
					<h3>
						<strong>내가 쓴 구매후기</strong>
					</h3>
					<hr>

					<table id="report" class="table">
						<thead>
							<tr>
								<th><h5>문의유형</h5></th>
								<th><h5>별점</h5></th>
								<th><h5>작성일자</h5></th>
								<th><h5>답변확인</h5></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${prdct_myr_list}" var="list">
							<tr>
								<td>
									<c:choose>
									<c:when test="${list.inquiry_number eq 1}">
										교환
									</c:when>
									<c:when test="${list.inquiry_number eq 2}">
										환불
									</c:when>
									<c:when test="${list.inquiry_number eq 3}">
										배송전취소
									</c:when>
									<c:when test="${list.inquiry_number eq 4}">
										배송
									</c:when>
									<c:when test="${list.inquiry_number eq 5}">
										불량
									</c:when>
									<c:when test="${list.inquiry_number eq 6}">
										주문및결제
									</c:when>
									<c:when test="${list.inquiry_number eq 7}">
										상품및재입고
									</c:when>	
									<c:otherwise>
										리뷰
									</c:otherwise>
								</c:choose>
								</td>
								<td><span class="star-prototype">${list.board_starrate}</span></td>
								<td>${list.board_date}</td>
								<td>${prdctr_cmnt_stat.comment_count > 0 ?  '답변완료' : '답변대기'}</td>
							</tr>
							<tr>
								<td colspan="4">
									<input type="hidden" id="board_id" name="board_id" value="${list.board_id }">
									<div style="text-align: center;">${list.board_content }</div><hr /> 
									<div class="row" style="margin: 1% 3% 1% 3%; padding: 1% 3% 1% 3%; border: 1px solid #E5E5E5;">
									<div align="left" style="white-space: pre; overflow-x: hidden;">${list.comment_content}</div>
									<div class="col-md-12" align="right">${list.comment_date}</div>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 페이징 -->
					<div class="container">
						<ul class="pagination justify-content-center">
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
									<li class="page-item disabled"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					
				</div>
			</div>
		</div>
		<hr>

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
		
		<script>
    $(document).ready(function(){

        $("#report tr:odd").addClass("odd");
        $("#report tr:not(.odd)").hide(); 
        $("#report tr:first-child").show(); //열머리글 보여주기

        $("#report tr.odd").click(function(){
            $(this).next("tr").toggle();
            $(this).find(".arrow").toggleClass("up");

        });
       

    });

</script>
</body>
</html>