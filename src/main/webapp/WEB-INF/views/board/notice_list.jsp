<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Notice Board List</title>
	
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
	
	<!-- JQUERY -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
	<!-- 반응형 사이즈 조절 -->
	<link rel="stylesheet" href="/css/reactive_size.css">
	
	<!-- 검색 이벤트 -->
	<script type="text/javascript">
		var searchForm = $("#searchForm");
	
		$("#searchForm button").on("click",function(e) {
		    // 화면에서 키워드가 없다면 검색을 하지 않도록 제어
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
	
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("검색어를 입력하세요");
				return false;
			}
	
		    // 페이지 번호를 1로 처리
			searchForm.find("input[name='pageNum']").val("1");
	
		    // 폼 태그의 전송을 막음
			e.preventDefault();
	
			searchForm.submit();
		});
	</script>
	
	<!-- Board Content Hover -->
	<style type="text/css">
	a:hover {
		text-decoration: none;
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
						<h2>NOTICE</h2>
					</div>
					<!-- 권한에 따라 버튼을 달리 보이게 한다 -->
					<!-- 모든 사용자 -->
					<sec:authorize access="isAnonymous()">
						<div class="col-md-6 contact-info" align="right"></div>
					</sec:authorize>
					<!-- 관리자일 경우 -->
					<sec:authorize access="hasAuthority('ADMIN')">
						<div class="col-md-6 contact-info" align="right">
							<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/board/notice/write'">작성하기</button>
						</div>
					</sec:authorize>
				</div>
			</div>

			<hr style="margin: 15px 15px 40px 15px;">

			<div class="container">
				<table class="table table-hover" style="text-align: center;">
					<c:forEach items="${notice_list}" var="dto">
						<tr class="table-light">
							<td scope="row" align="left"><h5>
									<a href="${pageContext.request.contextPath}/board/notice/${dto.board_id}">${dto.board_name}</a>
								</h5></td>
							<td style="border-left: 1px solid #e5e5e5;" align="right">${dto.board_date}</td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<hr style="margin: 15px 15px 40px 15px;">

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

			<br style="margin: 15px 15px 40px 15px;">

			<!-- 검색 -->
			<div align="center">
				<div class="form-inline justify-content-center">
					<form id="searchForm" action="${pageContext.request.contextPath}/board/notice" method="get">
						<select class="custom-select" name="type">
							<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>전체보기</option>
							<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected' : ''}"/>>제목</option>
							<option value="C" <c:out value="${pageMaker.cri.type == 'C' ? 'selected' : ''}"/>>내용</option>
							<option value="TC" <c:out value="${pageMaker.cri.type == 'TC' ? 'selected' : ''}"/>>제목or내용</option>
						</select>
						<input class="form-control" type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' placeholder="검색어를 입력하세요">
						<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
						<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
						<button type="submit" class="btn btn-primary">검색</button>
					</form>
				</div>
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