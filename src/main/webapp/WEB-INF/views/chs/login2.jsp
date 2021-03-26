<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
</head>
<body>
	<div class="row">
  		<div class="col"></div>
  		<div class="col">
  			<div class="container">
				<div align="center"><img src="<c:url value="/img/branches_text.png"/>" width="400"></div>
				<h2 align="center">Login</h2><br>
				
			  	<form action="member/mypage">
					<div align="left">
						<span style="margin: 6px;">
							<h6>
							<input type="radio" class="form-check-inline" name="optradio">회원&nbsp;&nbsp;&nbsp;
							<input type="radio" class="form-check-inline" name="optradio">비회원
							</h6>
						</span>
					</div>	  	
			  	
			    	<div class="form-group">
			      		<input type="text" class="form-control" id="usr" name="username" placeholder="아이디를 입력하세요">
			    	</div>
			    	<div class="form-group">
			      		<input type="password" class="form-control" id="pwd" name="password" placeholder="비밀번호를 입력하세요">
			    	</div>
			    	
			    	<button type="submit" class="btn btn-primary btn-block">로그인</button><br>
			 	
			 		<div class="form-check-inline">
			 		<h6>
					  	<label class="form-check-label"  style="padding-left: 0px;">
					    	<input type="checkbox" class="form-check-input" value="">자동로그인
					  	</label>
					</h6>	
					</div>
					
					<div class="form-group" align="center">
						<br><h6>
			      		<a href="/member/member_register">회원가입</a>&nbsp;|&nbsp;
			      		<a href="#">ID찾기</a>&nbsp;|&nbsp;
			      		<a href="#">PW찾기</a>
			      		</h6>
			    	</div>
			    	
					<div class="form-group" align="center">
						<br>
			      		<img src="<c:url value="/img/kakao_circle.png"/>" width="50" height="50">&nbsp;&nbsp;&nbsp;&nbsp;
			      		<img src="<c:url value="/img/naver-icon-file.jpg"/>" width="50" height="50">&nbsp;&nbsp;&nbsp;&nbsp;
			      		<img src="<c:url value="/img/google_logo.jpg"/>" width="50" height="50">&nbsp;&nbsp;&nbsp;&nbsp;
			      		<img src="<c:url value="/img/facebook_logo.png"/>" width="50" height="50">
			    	</div>	    	
			 	</form>
			</div>
  		</div>
  		<div class="col"></div>
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