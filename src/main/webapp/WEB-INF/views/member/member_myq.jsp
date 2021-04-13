<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : My User Q&A Content</title>
	
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
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<div class="col-md-3 contact-info" align="left" style="padding-left: 40px">
					<h2>${mbr.mbr_name}</h2>
					<h2>${mbr.mbr_id}</h2>
				</div>
				<div class="col-md-1 contact-info" align="center" style="padding-top: 20px">
					<a href="#">정보수정</a>
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
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
						<h3>나의 쇼핑활동</h3>
						<hr>
						<h5>
							<a href="#">주문내역 조회</a>
						</h5>
						<h5>
							<a href="#">최근 본 상품보기</a>
						</h5>
						<h5>
							<a href="#">찜한 목록</a>
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
							<a href="#">구매후기</a>
						</h5>
						<h5>
							<a href="#">상품문의</a>
						</h5>
						<h5>
							<a href="#">고객Q&A</a>
						</h5>
					</div>
				</div>


				<div class="col-md-9 contact-info">
					<div class="row" style="padding: 0px 2% 0px 2%">
						<div class="col-md-6" align="left">
							<h3><strong>문의 상세</strong></h3>
							<hr>
						</div>
						<div class="col-md-6" align="right"></div>
					</div>
					
					<!-- QNA 제목 -->
					<div class="container">
						<table class="table table-hover" style="text-align: center;">
							<tr class="table-primary">
								<th>번호</th>
								<th>제목</th>
								<th>문의유형</th>
								<th>등록일</th>
							</tr>
							<tr>
								<td>${iBoard.board_id}</td>
								<td>${iBoard.board_name}</td>
								<td>
								<c:choose>
								    <c:when test="${iBoard.inquiry_name eq 'POINT'}">
								        포인트
								    </c:when>
								    <c:when test="${iBoard.inquiry_name eq 'MEMBER'}">
								        회원관련
								    </c:when>
								    <c:otherwise>
								        기타
								    </c:otherwise>
								</c:choose>
								</td>
								<td>${iBoard.board_date}</td>
							</tr>
						</table>
					</div>
					
					<hr>
					
					<!-- QNA 본문 -->
					<div class="container">
						<div class="row" style="padding: 5% 3% 3% 5%">
							<p class="lead" style="white-space:pre;">${iBoard.board_content}</p>
						</div>
					</div>
					
					<hr>
					
					<!-- 페이지 이동 -->
					<div class="container">
						<div class="row" style="padding: 3% 5% 3% 5%">
							<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/mypage/myqna/list'">목록보기</button>&nbsp;
							<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/mypage/myqna/modify/${iBoard.board_id}'">수정하기</button>
						</div>
					</div>
					
					<hr>
					
					<!-- 댓글 불러오기 -->
					<div class="container">
						<c:forEach items="${comment}" var="comment" varStatus="cmnt_status">
						<div class="row" style="margin: 1% 3% 1% 3%; padding: 1% 3% 1% 3%; border: 1px solid #E5E5E5;">
							<div class="col-md-7" align="left" style="white-space:pre;">
								${comment.comment_content}
							</div>
							<div class="col-md-5" align="right">
								${comment.comment_date}
							</div>
						</div>
						</c:forEach>
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
		
		<!-- 채널 봇 챗봇 -->
		<script src="/js/channelIO.js"></script>
</body>
</html>