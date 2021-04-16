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
       <span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
            <h3>${mbr.mbr_name }</h3>
            <h3 style="position: relative; top: 15px;">${mbr.mbr_id }</h3>
         </span>
         <span style="margin-left: 22px; position: relative; bottom: 10px;"> <a href="/seller/mypage/myinfo/${mbr.mbr_id}">정보수정</a></span> 
         <span style="margin-left: 300px;" align="center">
            <h2 style="position: relative; top: 5px;">새 주문</h2>
            <h4 style="position: relative; top: 15px;">2건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">취소</h2>
            <h4 style="position: relative; top: 15px;">2건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">교환</h2>
            <h4 style="position: relative; top: 15px;">2건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">환불</h2>
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
						<strong style="margin: 10px;">등록한 상품 리스트</strong><br/>
					</h3>
					<div class="team-area sp">
						<div class="container">
							<div class="row">
								<button class="btn btn-primary btn-sm" type="button" onclick="sortTable(0)">ID순</button>&nbsp;&nbsp;
								<button class="btn btn-primary btn-sm" type="button" onclick="sortTable(4)">일자순</button>&nbsp;&nbsp;
								<form id="searchForm" action="/seller/mypage/prdct" method="get" style="position: relative; left: 390px;">
									<span>
										<select name="type" style="width: 100px; border: 3px solid black;">
											<option value="" <c:out value="${pageMaker.cri.type == null?'selected' : '' }" />>---</option>
											<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ?'selected' : '' }" />>상품명</option>
											<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ?'selected' : '' }" />>ID</option>
										</select>
									</span>&nbsp;&nbsp;
									<span>
									<input type="text" name="keyword" style="width: 200px; border: 3px solid black;" value='<c:out value="${pageMaker.cri.keyword}" />' /> 
										<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}" />' /> 
										<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}" />' />
									</span>
									<button class="btn btn-primary btn-sm">검색</button>
								</form>
								<table class="table" id="myTable" style="text-align: center;">
									<thead>
										<tr>
											
											<th><h5>상품ID</h5></th>
											<th><h5>상품명</h5></th>
											<th><h5>가격</h5></th>
											<th><h5>등록일</h5></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${bId}" var="bId" varStatus="status">
											<tr>
												<td><h5>${bId.prdct_id }</h5></td>
												
												<td><a href="/seller/mypage/prdct/${bId.prdct_id}">
													<h5>${bId.prdct_name }</h5>
													</a>	
												</td>
												<td><h5>${bId.prdct_price }</h5></td>
												<td><h5>${bId.board_date }</h5></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
									
								<ul class="pagination" style="margin: auto;">
									<c:if test="${pageMaker.prev}">
										<a class="page-link" href="/seller/mypage/prdct${pageMaker.makeQuery(pageMaker.startPage - 1)}">PREV</a>
									</c:if>

									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
										<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
										<a class="page-link" href="/seller/mypage/prdct${pageMaker.makeQuery(idx)}">${idx}</a>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<a class="page-link" href="/seller/mypage/prdct${pageMaker.makeQuery(pageMaker.endPage +1)}">NEXT</a>
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
	<script>
		function sortTable(n) {
			var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
			table = document.getElementById("myTable");
			switching = true;
			// Set the sorting direction to ascending:
			dir = "asc";
			/* Make a loop that will continue until
			no switching has been done: */
			while (switching) {
				// Start by saying: no switching is done:
				switching = false;
				rows = table.rows;
				/* Loop through all table rows (except the
				first, which contains table headers): */
				for (i = 1; i < (rows.length - 1); i++) {
					// Start by saying there should be no switching:
					shouldSwitch = false;
					/* Get the two elements you want to compare,
					one from current row and one from the next: */
					x = rows[i].getElementsByTagName("TD")[n];
					y = rows[i + 1].getElementsByTagName("TD")[n];
					/* Check if the two rows should switch place,
					based on the direction, asc or desc: */
					if (dir == "asc") {
						if (x.innerHTML.toLowerCase() > y.innerHTML
								.toLowerCase()) {
							// If so, mark as a switch and break the loop:
							shouldSwitch = true;
							break;
						}
					} else if (dir == "desc") {
						if (x.innerHTML.toLowerCase() < y.innerHTML
								.toLowerCase()) {
							// If so, mark as a switch and break the loop:
							shouldSwitch = true;
							break;
						}
					}
				}
				if (shouldSwitch) {
					/* If a switch has been marked, make the switch
					and mark that a switch has been done: */
					rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
					switching = true;
					// Each time a switch is done, increase this count by 1:
					switchcount++;
				} else {
					/* If no switching has been done AND the direction is "asc",
					set the direction to "desc" and run the while loop again. */
					if (switchcount == 0 && dir == "asc") {
						dir = "desc";
						switching = true;
					}
				}
			}
		}
	</script>


</body>
</html>