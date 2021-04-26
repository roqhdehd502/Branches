<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : My Page</title>
	
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
			border: 1px solid #e0e0e0;
			border-radius: 5px;
		}
		
		a:hover { 
			text-decoration: none;
		}
	</style>
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
						<h3>내가 쓴 글보기</h3>
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
				
				<!-- 오른쪽 컨텐츠 내용 -->
				<div class="col-md-9 contact-info" style="border-left: 1px solid rgba(0, 0, 0, .1);">
					<div class="container">
						<div class="row">
							<div class="col-md-6" align="left" style="padding-left: 10px">
								<h3>최근 주문내역</h3>
							</div>
							<div class="col-md-6" align="right" style="padding-right: 0px">
								<button class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/order/cart'">장바구니</button>
							</div>
						</div>
						<div class="row" style="padding-left: 15px">
							<small>최근 주문내역 중 3개만 보여집니다.</small>
						</div>
						
						<hr>
						
						<!-- 최근 주문내역 3개만 보여주기 -->
						<c:forEach items="${order_list}" var="order" end="2">
						<div class="row">	
							<div class="col-md-3 thumbnail" align="center">
								<a href="${pageContext.request.contextPath}/prdct/${order.prdct_id}"><img src="<c:url value="/prdct_img/prdct_thumbnail/${order.prdct_thumbnail}"/>" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="150px" height="200px"></a>
							</div>
							<div class="col-md-5" align="left" style="padding: 3% 0px 0px 0px">
								<br>
								<h5>${order.brand_id}</h5>
								<h5>${order.prdct_name}</h5>
							</div>
							<div class="col-md-4" align="right" style="padding: 3% 0px 0px 0px">
								<br>
								<h2>${order.order_price}원</h2>
								<!-- 배송조회페이지 URI 설정할것 -->
								<c:choose>
									<c:when test="${order.order_state_number eq 1}">
										<h4>결제대기</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 2}">
										<h4>결제완료</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 3}">
										<h4>주문요청</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 4}">
										<h4>배송대기</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 5}">
										<h4>배송중</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 6}">
										<h4>배송완료</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">배송조회</button>&nbsp;
										<button type="button" class="btn btn-success btn" onclick="location.href='${pageContext.request.contextPath}/'">주문확정</button><br>
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">교환요청</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">환불요청</button>
									</c:when>
									<c:when test="${order.order_state_number eq 7}">
										<h4>주문확정</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">리뷰쓰기</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">교환요청</button><br>
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">환불요청</button>
									</c:when>
									<c:when test="${order.order_state_number eq 8}">
										<h4>주문취소</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소조회</button>
									</c:when>
									<c:when test="${order.order_state_number eq 9}">
										<h4>교환요청</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">교환조회</button>
									</c:when>
									<c:when test="${order.order_state_number eq 10}">
										<h4>환불요청</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">환불조회</button>
									</c:when>
									<c:otherwise>
										<h4>환불완료</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<hr>
						</c:forEach>
						
						<br style="padding: 0px 0px 5% 0px">
						
						<div class="row" style="padding-left: 15px">
							<h3>최근 본 상품</h3>
						</div>
						<div class="row" style="padding: 15px 0px 0px 15px">
							<small>최근 본 상품 중 3개만 보여집니다.</small>	
						</div>
						
						<hr>
						
						<!-- 최근 본 상품내역 3개만 보여주기 -->
						<div class="row">
							<c:forEach items="${view_list}" var="watch" end="2">	
							<div class="col-md-4 thumbnail" align="center">
								<div>
									<!-- 경로 prdct_img/prdct_thumbnail로 바뀌면 수정하자... -->
									<a href="${pageContext.request.contextPath}/prdct/${watch.prdct_id}"><img src="<c:url value="/prdct_img/prdct_thumbnail/${watch.prdct_thumbnail}"/>" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="150px" height="200px"></a>
								</div>
								<div style="padding-top: 3%">
									<h5>${watch.brand_id}</h5>
									<h5>${watch.prdct_name}</h5>
								</div>
							</div>
							</c:forEach>
						</div>
						
						<hr style="padding: 0px 0px 5% 0px">
						
						<div class="row" style="padding-left: 15px">
							<h3>최근 찜한 목록</h3>
						</div>
						<div class="row" style="padding: 15px 0px 0px 15px">
							<small>최근 찜한 목록 중 3개만 보여집니다.</small>	
						</div>
						
						<hr>
						
						<!-- 최근 찜한 목록내역 3개만 보여주기 -->
						<div class="row">
							<c:forEach items="${like_prdct_list}" var="like" end="2">
							<div class="col-md-4 thumbnail" align="center">
								<div>
									<!-- 경로 prdct_img/prdct_thumbnail로 바뀌면 수정하자... -->
									<a href="${pageContext.request.contextPath}/prdct/${like.prdct_id}"><img src="<c:url value="/prdct_img/prdct_thumbnail/${like.prdct_thumbnail}"/>" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="150px" height="200px"></a>
								</div>
								<div style="padding-top: 3%">
									<h5>${like.mbr_id}</h5>
									<h5>${like.prdct_name}</h5>
								</div>
							</div>
							</c:forEach>
						</div>
						
					</div>
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
	</div>
</body>
</html>