<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>판매자 등록 상품 리스트</title>

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
	<header>
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>
	<hr style="margin: 5px;">
	<div class="container">
         <span style="margin-left: 70px;">
         </span> <span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
            <h3>${mbr.mbr_name }</h3>
            <h3 style="position: relative; top: 15px;">${mbr.mbr_id }</h3>
         </span>
         <span style="margin-left: 22px; position: relative; bottom: 10px;"> <a href="/seller/mypage/myinfo/${mbr.mbr_id}">정보수정</a></span> 
         <span style="margin-left: 480px;" align="center">
            <h2 style="position: relative; top: 5px;">새주문</h2>
            <h4 style="position: relative; top: 15px;">2건</h4>
         </span>
      </div>
		
		<hr style="margin: 15px 15px 24px 15px;">

		<div class="container">
			<div class="row">
				<div class="col-md-2 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
						<h3>마이페이지</h3>
						<hr>
						<h5>
							<a href="/seller/mypage">홈 바로가기</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>주문 관리</h3>
						<hr>
						<h5>
							<a href="/seller/mypage/order">주문확인</a>
						</h5>
						<h5>
							<a href="/seller/mypage/release">발송확인</a>
						</h5>
						<h5>
							<a href="/seller/mypage/cancel">취소</a>
						</h5>
						<h5>
							<a href="/seller/mypage/exchange">교환</a>
						</h5>
						<h5>
							<a href="/seller/mypage/refund">환불</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>상품 관리</h3>
						<hr>
						<h5>
							<a href="/seller/mypage/prdct_register">등록</a>
						</h5>
						<h5>
							<a href="/seller/mypage/prdct">조회</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>회원 관리</h3>
						<hr>
						<h5>
							<a href="/seller/mypage/prdctqna">Q&A</a>
						</h5>
						<h5>
							<a href="/seller/mypage/review">리뷰</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>매출 관리</h3>
						<hr>
						<h5>
							<a href="/seller/mypage/sales">매출</a>
						</h5>
					</div>
				</div>

				<!-- 등록한 상품 리스트	 -->
				<div class="col-md-10 contact-info" style="border-left: 1px solid rgba(0, 0, 0, .1);">
					<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px; border-bottom: 1px solid rgba(0, 0, 0, .1);">
						<strong style="margin: 10px;">등록한 상품 리스트</strong>
					</h3>
					<div class="team-area sp">
						<div class="container">
							<div class="row">
								<table class="table" id="myTable">
									<thead>
										<tr>
											<th><h5>번호</h5></th>
											<th><h5>상품ID</h5></th>
											<th><h5>상품이름</h5></th>
											<th><h5>상품가격</h5></th>
											<th><h5>등록일</h5></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${prdct}" var="prdct" varStatus="status">
											<tr>
												<td><h5>${bId[status.index].board_id }</h5></td>
												<td><h5>${bId[status.index].prdct_id }</h5></td>
												<td><a href="/seller/mypage/prdct/${prdct.prdct_id}/${bId[status.index].board_id }">
														<h5>${prdct.prdct_name }</h5>
												</a></td>
												<td><h5>${prdct.prdct_price }</h5></td>
												<td><h5>${bId[status.index].board_date }</h5></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<form id="searchForm" action="/seller/mypage/prdct" method="get">
									<select name="type">
										<option value="" <c:out value="${pageMake.cri.type == null?'selected' : '' }" />>---</option>
										<option value="T" <c:out value="${pageMake.cri.type eq 'T' ?'selected' : '' }" />>제목</option>
										<option value="C" <c:out value="${pageMake.cri.type eq 'C' ?'selected' : '' }" />>번호</option>
										<%-- <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ?'selected' : '' }" />>작성자</option> --%>
									</select> <input type="text" name="keyword" value='<c:out value="${pageMake.cri.keyword}" />' /> <input type="hidden" class="form-control"
										name="pageNum" value='<c:out value="${pageMake.cri.pageNum}" />' /> <input type="hidden" name="amount"
										value='<c:out value="${pageMake.cri.amount}" />' />
									<button class="btn btn-primary btn-sm">검색</button>
								</form>
								<ul class="pagination justify-content-center">
									<c:if test="${pageMake.prev}">
										<a class="page-link" href="/seller/mypage/prdct${pageMake.makeQuery(pageMake.startPage - 1)}">«</a>
									</c:if>

									<c:forEach begin="${pageMake.startPage}" end="${pageMake.endPage}" var="idx">
										<c:out value="${pageMake.cri.pageNum == idx?'':''}" />
										<a class="page-link" href="/seller/mypage/prdct${pageMake.makeQuery(idx)}">${idx}</a>
									</c:forEach>

									<c:if test="${pageMake.next && pageMake.endPage > 0}">
										<a class="page-link" href="/seller/mypage/prdct${pageMake.makeQuery(pageMake.endPage +1)}">»</a>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
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


</body>
</html>