<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : 비밀번호 변경</title>

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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
	<div class="row">
  		<div class="col"></div>
  		<div class="col">
  			<div class="container">
				<div align="center"><img src="<c:url value="/img/branches_text.png"/>" width="200"></div>
				<h2 align="center">로그인</h2><br>
				<form action="/resetPW" method="POST">
  	
			  	
			    	<div class="form-group">
			      		<input type="text" class="form-control" id="mbr_id" name="mbr_id" placeholder="아이디를 입력하세요" required autofocus>
			    	</div>
			    	
			    	<div class="form-group">
			      		<input type="number" class="form-control" id="contact_number" name="contact_number" placeholder="연락처를 입력하세요" required>
			    	</div>
			    	
			    	<div class="form-group">
			      		<input type="password" class="form-control" id="mbr_pw" name="mbr_pw" placeholder="비밀번호를 입력하세요" required>
			    	</div>
			    	
			    	<div class="form-group">
			      		<input type="password" class="form-control" id="pw_check" name="pw_check" placeholder="비밀번호를 확인하세요" required>
			    	</div>
			    	
			    	<button type="submit" class="btn btn-primary btn-block" onclick="">비밀번호 변경</button><br>
					
					<div class="form-group" align="center">
						<br>
			      		<a href="/login">로그인 페이지로 이동</a>
			    	</div>
			    	
					<div class="form-group" align="center">
						<br>
			      		<a href="/oauth2/authorization/kakao"><img src="<c:url value="/img/kakao_circle.png"/>" width="50" height="50"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			      		<a href="/oauth2/authorization/naver"><img src="<c:url value="/img/naver-icon-file.jpg"/>" width="50" height="50"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			      		<a href="/oauth2/authorization/google"><img src="<c:url value="/img/google_logo.jpg"/>" width="50" height="50"></a>
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