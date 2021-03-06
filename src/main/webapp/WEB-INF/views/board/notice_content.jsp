<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Notice Board Content</title>
	
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
	
	<!-- AJAX용 JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- 반응형 사이즈 조절 -->
	<link rel="stylesheet" href="/css/reactive_size.css">		
</head>
<body>
	<div style="overflow: hidden;" class="container">
	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container contpadding">
			<!-- 공지사항 기본 정보 -->
			<div class="container" align="center">
				<div><h2>${notice_content.board_name}</h2></div>
				<div>
					<label>
						${notice_content.board_date}&nbsp;|&nbsp;
						조회수: ${notice_content.board_hit}
					</label>
				</div>
			</div>
			
			<hr>
			
			<!-- 공지사항 글내용 -->		
			<div class="container" style="overflow: auto;">
				<div class="row" style="padding: 3% 3% 5% 3%">		
					<div class="col-md-12 mgzcntnt" style="padding: 2% 3% 3% 3%">
						<p class="lead" style="white-space: normal;">${notice_content.board_content}</p>
					</div>
				</div>
			</div>
			
			<hr>
			
			<div class="container">		
				<!-- 권한에 따라 버튼을 달리 보이게 한다 -->
				<!-- 모든 사용자 -->
				<sec:authorize access="isAnonymous()"> 
				<div align="center" style="padding: 3% 5% 3% 5%">
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/notice'">목록보기</button>
				</div>
				</sec:authorize>
				<!-- 회원일 경우 -->
				<sec:authorize access="hasAuthority('MEMBER')">  
				<div align="center" style="padding: 3% 5% 3% 5%">
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/notice'">목록보기</button>	
				</div>
				</sec:authorize>
				<!-- 판매자일 경우 -->
				<sec:authorize access="hasAuthority('SELLER')">  
				<div align="center" style="padding: 3% 5% 3% 5%">
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/notice'">목록보기</button>	
				</div>
				</sec:authorize>
				<!-- 관리자일 경우 -->
				<sec:authorize access="hasAuthority('ADMIN')"> 
				<div align="center" style="padding: 3% 5% 3% 5%">
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/notice'">목록보기</button>&nbsp;
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/board/notice/modify/${notice_content.board_id}'">수정하기</button>
				</div>
				</sec:authorize>		
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