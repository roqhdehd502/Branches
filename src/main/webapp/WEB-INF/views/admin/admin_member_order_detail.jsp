<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원목록 조회</title>

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
		<header style="padding-top: 0px;">
			<!-- header -->
			<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
		</header>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container" style="text-align: center; margin: 25px;" onclick="location.href='${pageContext.request.contextPath}/admin/mypage'">
			<h3>
			<strong>관리자 페이지</strong>
			</h3>
		</div>

		<hr style="margin: 15px 15px 40px 15px;">
		
		
		<div class="container">
			<div class="row">
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px;">
	                    <h3>업체관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/regist/seller">업체등록</a></h5>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/seller">업체목록 조회</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>회원관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/member">회원정보 조회</a></h5>
	               		 <h5><a href="${pageContext.request.contextPath}/admin/mypage/member/userQnA">고객Q&A 목록</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>매출관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/admintotal">매출조회</a></h5>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/adminSearchtotal">검색순위 조회</a></h5>
	                </div>
				</div>
				
				<div class="col-md-9 contact-info" style="align-content: center;">
					<h3 >
					<strong>${mbr.mbr_name} / ${mbr.mbr_id} 주문 상세 정보</strong>
					</h3><hr>
					
					<table class="n-table table-col" style="width: 100%; border-collapse: separate; border-spacing: 0 10px;">
						<colgroup>
							<col style="width: 25%">
							<col style="width: 25%">
							<col style="width: 25%">
							<col style="width: 25%">
						</colgroup>
						<thead>
							<tr style="text-align: center; border-bottom: 1px solid #444444;">
								<th scope="col" colspan="2"><h5><strong>상품 정보</strong></h5></th>
								<th scope="col"><h5><strong>주문금액</strong></h5></th>
								<th scope="col"><h5><strong>주문날짜</strong></h5></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${order}" var="order">
							<tr style="text-align: center;">
								<td scope="col"><img src="/prdct_img/prdct_thumbnail/${order.prdct_thumbnail}" style="width: 50px; height: 50px; float: left; padding-left: 10px;"></td>
								<td scope="col" style="float: left;">${order.prdct_name} <br/>${order.order_size} / ${order.order_color}</td>
								<td scope="col">${order.prdct_price}</td>
								<td scope="col">${order.order_date}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<br/>
					<hr>
					
					<input type="button" class="btn btn-primary" value="회원목록" onclick="location.href='${pageContext.request.contextPath}/admin/mypage/member'" />
				</div>
			</div>
		</div>
		<hr>
		
		
		<!-- footer -->
		<footer>
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/footer.jsp"></jsp:include>
		</footer>
		
		<div class="container-fluid">
			<small style="color: black;"> <strong>상호명 :</strong> (주)브랜치스 <strong>소재지 :</strong> 서울특별시 00구 00로00길 00 00빌딩 0층 <strong>팩스 :</strong>
				000-0000-0000 <strong>사업자등록번호 :</strong> 000-00-000000 <strong>통신판매업신고 :</strong> 0000-서울종로-00000
			</small> <br /> <small style="color: black;"><strong>고객센터</strong> 0000-0000 평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무) <strong>이메일</strong>
				customer@29cm.co.kr <strong>대표이사</strong> 000 <strong>개인정보책임자</strong> 000 <strong>호스팅서비스</strong> (주)00000</small>
		</div>
		<br /><br />
		
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
</body>
</html>