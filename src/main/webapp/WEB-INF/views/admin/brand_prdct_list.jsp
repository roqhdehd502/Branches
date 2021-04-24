<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>브랜드 상품 리스트</title>

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

<style type="text/css">

.team-img {
	height: 60%
}

</style>
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<header>
			<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
		</header>

		<hr style="margin: 15px 15px 40px 15px;">
		
		<div class="container text-left">
			<h4>${mbr.mbr_name }</h4>
		</div>
		<div class="team-area sp">
			<div class="container">
				<div class="row" style="padding-top: 15px; padding-bottom: 15px; padding-left: 10px; padding-right: 10px;">
					<c:forEach items="${prdct}" var="prdct">
						<div class="col-sm-2 col-md-2 col-lg-2 single-team" style="height: 300px; width: 200px;" onclick="location.href='/admin/mypage/seller/${mbr.mbr_id}/prdct/${prdct.prdct_id}'">
							<div class="inner" style="height: 100%;">
								<div class="team-img" style="overflow: inherit;">
								<img src="${prdct.prdct_thumbnail }" style="width: 150px; height: 200px;"></img>
								</div>
								<div class="team-content">
									<h4>${prdct.prdct_name}</h4>
									<h5>${mbr.mbr_name}</h5>
									<h5>${prdct.prdct_price}</h5>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<br />
		<hr>

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
</body>
</html>