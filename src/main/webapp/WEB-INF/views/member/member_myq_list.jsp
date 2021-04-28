<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : My User Q&A List</title>
	
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
	
	<!-- 달력으로 날짜 선택 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<style type="text/css">
		a:hover { text-decoration: none;}
	</style>
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">
		
		<!-- 상단 회원 정보 요약 -->
		<div class="container">
			<div class="row" style="height: 50px;">
				<div class="col-md-3 contact-info" align="left" style="padding-left: 15px; margin-top: 10px; text-align: center;">
					<h2>${mbr.mbr_name}</h2>
				</div>
				<div class="col-md-1 contact-info" style="padding-top: 20px;">
					<a href="${pageContext.request.contextPath}/member/mypage/myinfo">정보수정</a>
				</div>
				<div class="col-md-6 contact-info"></div>
				<div class="col-md-2 contact-info" align="center" style="padding-right: 10px">
					<h2>Point</h2>
					<h3>${mbr.mbr_point}</h3>
				</div>
			</div>
			<span style="margin-left: 14px;"> </span> <span style="margin-left: 400px;" align="center"> </span>
		</div>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<!-- 왼쪽 사이드 메뉴  -->
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
						<h3>나의 쇼핑활동</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/order">주문내역 조회</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/recently">최근 본 상품</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/like">찜한 목록</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>매거진</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/board/magazine">매거진</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>내가 쓴 글보기</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/review/list">구매후기</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/prdctq/list">상품문의</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/myqna/list">고객Q&A</a>
						</h5>
					</div>
				</div>

				<!-- 오른쪽 본문 -->
				<div class="col-md-9 contact-info" style="border-left: 1px solid rgba(0, 0, 0, .1);">
					<div class="container">
						<div class="row" style="padding: 0px 2% 0px 2%">
							<div class="col-md-6" align="left">
								<h3>
									<strong>내가 쓴 고객 Q&A</strong>
								</h3>
							</div>
							<div class="col-md-6" align="right">
								<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/mypage/myqna/write'">작성하기</button>
							</div>
						</div>
	
						<hr>
	
						<div class="row" style="padding: 0px 2% 0px 2%">
							<div class="col-md-3" align="center">
								<h5>문의유형</h5>	
							</div>
							<div class="col-md-3" align="center">
								<h5>Q&A제목</h5>	
							</div>
							<div class="col-md-3" align="center">
								<h5>작성일자</h5>	
							</div>
							<div class="col-md-3" align="center">
								<h5>답변확인</h5>	
							</div>
						</div>
						
						<hr>
						
						<c:forEach items="${myq_list}" var="myq_list">
						<div class="row" style="padding: 0px 2% 0px 2%">
							<div class="col-md-3" align="center" style="padding-top: 1%;">
								<c:choose>
									<c:when test="${myq_list.inquiry_number eq 8}">
										포인트
									</c:when>
									<c:when test="${myq_list.inquiry_number eq 9}">
										회원관련
									</c:when>
									<c:otherwise>
										기타
									</c:otherwise>
								</c:choose>	
							</div>
							<div class="col-md-3" align="center" style="padding-top: 1%; overflow: auto;">
								<a href="${pageContext.request.contextPath}/member/mypage/myqna/${myq_list.board_id}">${myq_list.board_name}</a>
							</div>
							<div class="col-md-3" align="center" style="padding-top: 1%;">
								${myq_list.board_date}
							</div>				
							<%-- 답변여부 확인 --%>
							<div class="col-md-3" align="center" style="padding-top: 1%;">
							    <%-- 루프 탈출 조건 변수 설정 --%>
								<c:set var="loop_flag" value="false" />
								<%-- 답변여부 확인용 루프 설정 --%>
								<c:forEach items="${myq_cmnt_stat}" var="cmnt_stat" varStatus="status">
									<%-- if문을 통해 루프 탈출 조건을 건다 --%>
									<c:if test="${not loop_flag}">
										<%-- 해당 글에 답변이 존재할 때 --%>
										<c:if test="${myq_list.board_id eq cmnt_stat.board_id}">
											답변완료
											<%-- 해당 변수값이 true로 설정되어 루프(forEach)를 탈출한다 --%>
											<c:set var="loop_flag" value="true"/>
										</c:if>
										<%-- 해당 글에 답변이 존재하지 않을때 --%>
										<c:if test="${myq_list.board_id ne cmnt_stat.board_id}">
											<%-- 다음 인덱스 값도 계속 탐색해야 하므로 출력하지 않는 빈 값만 출력한다 --%>
											<span style="display: none;"></span>
										</c:if>
										<%-- 마지막 인덱스까지 해당 글에 답변이 존재하지 않을때 --%>
										<c:if test="${(status.last) and (myq_list.board_id ne cmnt_stat.board_id)}">
											답변대기
											<c:set var="loop_flag" value="true"/>
										</c:if>
									</c:if>
								</c:forEach>
							</div>					
						</div>
						<hr>
						</c:forEach>
					</div>	

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
				</div>
				<hr>
			</div>
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
		</div>
</body>
</html>