<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Magazine Board List</title>
	
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
	</style>
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="container">
				<div class="row">
					<div class="col-md-6 contact-info" align="left">
						<h2>MAGAZINE</h2>
					</div>
					<div class="col-md-6 contact-info" align="right">
						<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/magazine/write'">작성하기</button>
					</div>
				</div>
			</div>

			<hr>

			<div class="container" align="center">
				<div class="row">
					<c:forEach items="${magazine_list}" var="dto">
						<div class="col-md-4 contact-info">
							<div class="thumbnail">
								<a href="${pageContext.request.contextPath}/board/magazine/${dto.board_id}">
									<div style="padding-top: 7px">
										<img class="rounded" src="/board_img/${dto.image_name eq null ? 'none-thumbnail.jpg' : dto.image_name}" width="225px" height="350px">
									</div>
									<div>
										<hr>
										<span><h5>${dto.board_name}</h5></span>
										<span class="badge badge-primary badge-pill">${dto.board_like}</span>
									</div>
								</a>
								<div>
									<span>${dto.board_date}</span>
									<span>&nbsp;|&nbsp;</span>
									<span>${dto.board_hit}</span>
									<!-- <hr> -->
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<hr>

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
		<!-- </div> -->
		<!-- </div> -->

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
		
		<!-- 채널 봇 챗봇 -->
		<script src="/js/channelIO.js"></script>
	</div>
</body>
</html>