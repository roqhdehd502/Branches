<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>판매자 마이페이지</title>

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
	<div class="container">
         <span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
           <h3>${mbr.mbr_name }</h3>
            <h3 style="position: relative; top: 15px;">${mbr.mbr_id }</h3>
         </span>
         <span style="margin-left: 22px; position: relative; bottom: 10px;"> <a href="/seller/mypage/myinfo/${mbr.mbr_id }">정보수정</a></span> 
           <span style="margin-left: 300px;" align="center">
            <h2 style="position: relative; top: 5px;">새 주문</h2>
            <h4 style="position: relative; top: 15px;">${orderCount } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">취소</h2>
            <h4 style="position: relative; top: 15px;">${cancelCount } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">교환</h2>
            <h4 style="position: relative; top: 15px;">${exchangeCount } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">환불</h2>
            <h4 style="position: relative; top: 15px;">${refundCount } 건</h4>
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

				<span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 922px;">
					<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px;">
						<strong style="margin: 10px;">Review</strong>
					</h3>
					<div class="team-area sp">
						<div class="container">
							<div class="row">
								<button class="btn btn-primary btn-sm" type="button" onclick="sortTable(0)">번호순</button>
								&nbsp;&nbsp;
								<button class="btn btn-primary btn-sm" type="button" onclick="sortTable(1)">제목순</button>
								&nbsp;&nbsp;
								<button class="btn btn-primary btn-sm" type="button" onclick="sortTable(2)">작성자순</button>
								&nbsp;&nbsp;
								<button class="btn btn-primary btn-sm" type="button" onclick="sortTable(5)">일자순</button>
								<form id="searchForm" action="/seller/mypage/prdct" method="get" style="position: relative; left: 220px;">
									<span>
										<select class="custom-select" name="type" style="width: 100px;">
											<option value="" <c:out value="${pageMaker.cri.type == null?'selected' : '' }" />>---</option>
											<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ?'selected' : '' }" />>상품명</option>
											<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ?'selected' : '' }" />>ID</option>
										</select>
									</span>&nbsp;&nbsp;
									<span>
									<input class="form-control" type="text" name="keyword" style="width: 200px;" value='<c:out value="${pageMaker.cri.keyword}" />' /> 
										<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}" />' /> 
										<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}" />' />
									</span>
									<button class="btn btn-primary">검색</button>
								</form>
								<table class="table" style="text-align: center;">
									<thead>
										<tr>
											<th><h5>No.</h5></th>
											<th><h5>제목</h5></th>
											<th><h5>작성자</h5></th>
											<th><h5>상품명</h5></th>
											<th><h5>일자</h5></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ board}" var="board" varStatus="status">
											<tr>
												<td>
													<h6>${board.board_id }</h6>
												</td>
												<td><h6>
														<a href="#">${board.board_name }</a>
													</h6></td>
												<td><h6>${board.mbr_id }</h6></td>
												<td><h6>${prdct[status.index].prdct_name }</h6></td>
												<td><h6>${board.board_date }</h6></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<hr>
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