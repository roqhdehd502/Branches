<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Brand</title>

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
			<!-- footer -->
			<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
		</header>
			<h3 style="margin-top: 15px; margin-left: 15px; padding-bottom: 16px; border-bottom: 1px solid rgba(0, 0, 0, .1);">
				<strong style="margin: 10px;">Brand</strong>
			</h3>
			<br />
			<div class="team-area sp">
				<div class="container">
					<div class="row">
						<c:forEach var="brand" items="${brand }">
							<div class="col-sm-6 col-md-4 col-lg-3 single-team" onclick="location.href='${pageContext.request.contextPath}/brand/${brand.mbr_id}'">
								<div class="inner">
								<a href="#" style="text-decoration: none;">
									<div class="team-content">
										<h4>${brand.mbr_id }</h4>
									</div>
								</a>	
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div>
						<ul class="pagination" >
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
			
		<!-- footer -->
	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/footer.jsp"></jsp:include>
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
	<script type="text/javascript">
	var searchForm = $("#searchForm");
	$("#searchForm button").on("click", function(e) {

		if (!searchForm.find("option:selected").val()) {
			alert("검색종류를 선택하세요!");
			return false;
		}

		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요!");
			return false;
		}

		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();

		searchForm.submit();
	});
</script>
</body>
</html>