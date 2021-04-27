<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Branches : Brand Product List</title>

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
		
		<%-- <div class="container">
			<div class="row">
				<div class="col-md-3 contact-info"style="padding-left: 40px">
					<h2>${mbr.mbr_name}</h2>
					<p style="float: left;">${category.category_name}</p>
				</div>
				<hr style="margin: 15px 15px 40px 15px;">
				<div class="col-md-6 contact-info"></div>
				<div class="col-md-2 contact-info" align="center" style="padding-right: 10px">
					
				</div>
			</div>
			<span style="margin-left: 14px;"> </span> <span style="margin-left: 400px;" align="center"> </span>
		</div> --%>
		
		<!-- <div class="page-title sp">
			
		</div> -->
		
		<div class="container text-left" >
				<h4>${mbr.mbr_name }</h4>
			</div>
		<div class="team-area sp">
			<div class="container">
				<div class="row">
					<c:forEach items="${prdct}" var="prdct">
						<div class="col-sm-2 col-md-2 col-lg-2 single-team">
						<div class="inner">
							<div class="team-img">
								<img src="/prdct_img/prdct_thumbnail/${prdct.prdct_thumbnail}" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" alt="Member Photo">
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
			<div style="padding-left: 500px;">
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
					<c:when test="${pageMaker.next && pageMaker.endPage <= 0}">
						<li class="page-item disabled"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			</div>
		</div>
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
</body>
</html>