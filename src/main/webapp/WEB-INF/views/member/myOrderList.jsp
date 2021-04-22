<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : My Order List</title>
	
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
						<div class="row" style="padding-left: 10px">
							<h3>주문내역 조회</h3>
						</div>
						
						<hr>
						
						<div class="row" style="padding-left: 10px">
							<button class="btn btn-primary btn-sm">ㄱㄴㄷ순</button>
							<span style="margin-left: 30px;">
								<button class="btn btn-primary btn-sm">abc순</button>
							</span>
							<span style="margin-left: 30px;">
								<button class="btn btn-primary btn-sm">날짜별순</button>
							</span>
							<span style="margin-left: 30px;">
								<button class="btn btn-primary btn-sm">최근구매순</button>
							</span>
						</div>
						
						<hr>
						
						<div class="row">
							<div class="col-md-4" align="center">
								<h5>상품정보</h5>	
							</div>
							<div class="col-md-2" align="center">
								<h5>주문일</h5>	
							</div>
							<div class="col-md-2" align="center">
								<h5>주문번호</h5>	
							</div>
							<div class="col-md-2" align="center">
								<h5>주문금액</h5>	
							</div>
							<div class="col-md-2" align="center">
								<h5>상태</h5>	
							</div>
						</div>	
						
						<hr>
						
						<div class="row">
							<%-- <c:forEach items="" var=""> --%>
							<div class="col-md-2" align="center">
								<img src="/prdct_img/prdct_thumbnail/hs/5.jpg" width="100px" height="150px">	
							</div>
							<div class="col-md-2" align="center" style="padding-top: 3%; overflow: auto;">
								<h6>Covernat</h6>
								<h6>럭비 맨투맨 네이비</h6>
								<h6>네이비 (M)</h6>	
							</div>
							<div class="col-md-2" align="center" style="padding-top: 7%">
								<h6>2021-03-19</h6>	
							</div>
							<div class="col-md-2" align="left" style="padding-top: 7%; overflow: auto;">
								<h6>2021031111550001</h6>	
							</div>
							<div class="col-md-2" align="center" style="padding-top: 7%">
								<h6>29,900₩</h6>	
							</div>
							<div class="col-md-2" align="center" style="padding-top: 5%">
								<h6>배송시작</h6>
								<h6><button class="btn btn-primary btn-sm">배송조회</button></h6>
							</div>
							<%-- </c:forEach> --%>
						</div>	
					</div>
				</div>
				
				
					<!-- <span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 922px;">
						<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px; border-bottom: 1px solid rgba(0, 0, 0, .1);">
							<strong style="margin: 10px;">주문내역 조회</strong>
						</h3>
	
						<div style="margin-bottom: 20px; margin-top: 20px;">
							<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">ㄱㄴㄷ순</button></span> <span style="margin-left: 30px;"><button
									class="btn btn-primary btn-sm">abc순</button></span> <span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">날짜별순</button></span> <span
								style="margin-left: 30px;"><button class="btn btn-primary btn-sm">최근구매순</button></span>
						</div>
						
						<table class="table">
							<thead style="text-align: center;">
								<tr>
									<th colspan="2"><h5>상품정보</h5></th>
									<th><h5>주문일</h5></th>
									<th><h5>주문번호</h5></th>
									<th><h5>주문금액</h5></th>
									<th><h5>상태</h5></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
	
	
							</tbody>
						</table> -->
	
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