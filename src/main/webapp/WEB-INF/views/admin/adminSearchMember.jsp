<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 마이페이지</title>

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
		<div class="container" style="border-bottom: 1px solid rgba(0, 0, 0, .1);">
			<div class="row">
				<div class="col-6 col-sm-3 logo-column">
					<a href="index.html" class="logo" style="height: 70px;"> <img src="/img/branches_text.png" alt="logo" style="width: 160px; height: 70px;">
					</a>
				</div>
				<div class="col-6 col-sm-9 nav-column clearfix">
					<div class="right-nav">
						<span class="search-icon fa fa-search"></span>
						<form action="#" class="search-form">
							<input type="search" placeholder="search now">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
						<div class="header-social">
							<a href="#">Login</a> 
							<a href="#" class="fa fa-google"></a> 
							<a href="#" class="fa fa-facebook"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<div class="container">
			<div class="row">
				<div class="col-md-2 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px;">
	                    <h3>업체관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/regist/seller">업체등록</a></h5>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/seller">업체목록 조회</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>회원관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/member">회원정보 조회</a></h5>
	               		 <h5><a href="${pageContext.request.contextPath}/admin/mypage/member/adminQnA">고객Q&A 목록</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>매출관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/admintotal">매출조회</a></h5>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/adminSearchtotal">검색순위 조회</a></h5>
	                </div>
				</div>
				<span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 922px;">
					<h3 style="margin-top: 18px; margin-left: 15px; padding-bottom: 16px;">
						<strong style="margin: 10px;">회원정보 조회</strong>
					</h3>
					<div style="margin-bottom: 20px;">
						<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">ㄱㄴㄷ순</button></span>
						<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">abc순</button></span>
						<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">매출순</button></span>
						<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">최근등록순</button></span>
						<form id="searchForm" action="/member/adminSearchMember" method="get" style="float: right;">
							<select name="type">
								<option value="" <c:out value="${pageMaker.cri.type == null?'selected' : '' }" />>---</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ?'selected' : '' }" />>아이디</option>
								<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ?'selected' : '' }" />>이름</option>
								<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ?'selected' : '' }" />>이메일</option>
							</select> <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}" />' /> <input type="hidden" name="pageNum"
								value='<c:out value="${pageMaker.cri.pageNum}" />' /> <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}" />' />
							<button class="btn btn-primary btn-sm">검색</button>
						</form>
					</div>
					<table class="table" style="text-align: center;">
						<thead>
							<tr>
								<th><h5>No.</h5></th>
								<th><h5>아이디</h5></th>
								<th><h5>이름</h5></th>
								<th><h5>전화번호</h5></th>
								<th><h5>이메일</h5></th>
								<th><h5>가입일</h5></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${mem}" var="mem">
							<tr>
								<td>
									<h6>1</h6>
								</td>
								<td><h6><a href="#">${mem.mbr_id }</a></h6></td>
								<td><h6>${mem.mbr_name }</h6></td>
								<td><h6>${mem.contact_number }</h6></td>
								<td><h6>${mem.mbr_email }</h6></td>
								<td><h6>${mem.jdate }</h6></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev}">
							<a class="page-link" href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">«</a>
						</c:if> <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
							<a class="page-link" href="list${pageMaker.makeQuery(idx)}">${idx}</a>
						</c:forEach> <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a class="page-link" href="list${pageMaker.makeQuery(pageMaker.endPage +1)}">»</a>
						</c:if>
					</ul>
				</span>
			</div>
		</div>
		
	
	<hr>
	<!-- footer -->
		<footer>
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>회사소개</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>제휴문의</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>채용정보</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>고객센터</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>이용약관</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>개인정보처리</h5></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div class="copyright-txt">Copyright© 2021 Branches. All Rights Reserved.</div>
						</div>
						<div class="col-lg-6 text-right">
							<div class="footer-nav">
								<a href="/member/main">Home</a> <a href="#">Q&A</a> <a href="#">Notice</a> <a href="#">Magazine</a> <a href="#">Blog</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<div class="container">
			<small style="color: black;"> <strong>상호명 :</strong> (주)브랜치스 | <strong>소재지 :</strong> 서울특별시 00구 00로00길 00 00빌딩 0층 | <strong>팩스 :</strong>
				000-0000-0000 |<strong>사업자등록번호 :</strong> 000-00-000000 | <strong>통신판매업신고 :</strong> 0000-서울종로-00000 | 
			</small> <br /> <small style="color: black;"><strong>고객센터</strong> 0000-0000 | 평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무) | <strong>이메일</strong>
				admin@branches.co.kr | <strong>개인정보책임자</strong> 000 | <strong>호스팅서비스</strong> (주)00000 | </small>
		</div><br/><br/>
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

	</div>
</body>
</html>