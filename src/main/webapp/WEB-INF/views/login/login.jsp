<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Login</title>
	
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
	
	<!-- 반응형 사이즈 조절 -->
	<link rel="stylesheet" href="/css/reactive_size.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col side_blank"></div>

			<div class="col">
				<div align="center">
					<img src="<c:url value="/img/branches_text.png"/>" style="width: 200px;">
				</div>

				<div align="center">
					<h2>로그인</h2>
				</div>

				<br>

				<!-- 로그인 실패 시 오류 메세지 -->
				<c:if test="${error}">
					<div>
						<p class="alert alert-danger">${exception}</p>
					</div>
				</c:if>
				<form action="/login" method="POST">
					<!-- <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
					<form action="/login" method="POST" name="form1"> -->
					<div class="form-check" align="left">
						<label class="form-check-label">
							<p>
								<input type="radio" class="form-check-inline" name="optradio">회원&nbsp;&nbsp;&nbsp; <input type="radio" class="form-check-inline"
									name="optradio">비회원
							</p>
						</label>
					</div>

					<div class="form-group">
						<input type="text" class="form-control" id="mbr_id" name="mbr_id" placeholder="아이디를 입력하세요" required autofocus>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="mbr_pw" name="mbr_pw" placeholder="비밀번호를 입력하세요" required>
					</div>
					<button id="btnLogin" type="submit" class="btn btn-primary btn-block">로그인</button>
					<br>
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="checkbox" id="remember-me" name="remember-me" class="form-check-input" value="true">자동로그인
						</label>
					</div>

					<div class="form-group" align="center">
						<br> <a href="/join">회원가입</a>&nbsp;|&nbsp; <a href="/find_id_pw">ID / PW 찾기</a>
					</div>
					<div align="center">
						<br> <a href="/oauth2/authorization/kakao"><img class="social_logo" src="<c:url value="/img/kakao_circle.png"/>" style="width: 50px; height: 50px"></a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/oauth2/authorization/naver"><img class="social_logo" src="<c:url value="/img/naver-icon-file.jpg"/>" style="width: 50px; height: 50px"></a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/oauth2/authorization/google"><img class="social_logo" src="<c:url value="/img/google_logo.jpg"/>" style="width: 50px; height: 50px"></a>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>

			</div>

			<div class="col side_blank"></div>
		</div>
	</div>

	<div style="margin-bottom: 5%"></div>

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