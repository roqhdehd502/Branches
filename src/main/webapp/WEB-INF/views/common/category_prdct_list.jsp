<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Branches : Category Product List</title>

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
   <header style="padding-bottom: 10px; padding-top: 5px;">
      <!-- header -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"></jsp:include>
      </header>
      <div class="page-title sp">
         <div class="container text-center">
            <h2>상품 목록</h2>
            <p style="float: left;">${category.category_name}</p>
         </div>
      </div>
      <!-- 상품리스트출력 -->
      <div class="team-area sp">
         <div class="container">
            <div class="row">
               <c:forEach items="${prdct}" var="prdct">
                  <div class="col-sm-3 col-md-3 col-lg-3 single-team" onclick="location.href='${pageContext.request.contextPath}/prdct/${prdct.prdct_id}'">
                  <div class="inner">
                     <div class="team-img">
                        <img src="/prdct_img/prdct_thumbnail/${prdct.prdct_thumbnail}" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" style="width: 240; height: 240px; "  />
                     </div>
                     <div class="team-content">
                        <h4>${prdct.prdct_name}</h4>
                        <h5>${prdct.mbr_id}</h5>
                        <h5>${prdct.prdct_price}</h5>
                     </div>
                  </div>
               </div>
               </c:forEach>
               
            </div>
				<div align="center">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled" hidden="hidden"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
							<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
							<li class="page-item ${pageMaker.cri.pageNum == idx ? 'active' : '' }"><a class="page-link" href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${pageMaker.next && pageMaker.endPage <= 0}">
								<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled" hidden="hidden"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
      </div>
      <!-- footer -->
      <!-- header -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"></jsp:include>

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