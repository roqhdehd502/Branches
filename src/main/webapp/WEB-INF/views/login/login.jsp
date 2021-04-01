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
	<title>Branches : Login</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="row">
  		<div class="col"></div>
  		<div class="col">
  			<div class="container">
				<div align="center"><img src="<c:url value="/img/branches_text.png"/>" width="200"></div>
				<h2 align="center">로그인</h2><br>
				<!-- 로그인 실패 시 오류 메세지 -->
				<c:if test="${error}">
				<div>
					<p class="alert alert-danger">${exception}</p>
				</div>
				</c:if>
				<form action="/login" method="POST">
					<div class="form-check" align="left">
						<label class="form-check-label">
							<p>
							<input type="radio" class="form-check-inline" name="optradio">회원&nbsp;&nbsp;&nbsp;
							<input type="radio" class="form-check-inline" name="optradio">비회원
							</p>
						</label>
					</div>	  	
			  	
			    	<div class="form-group">
			      		<input type="text" class="form-control" id="mbr_id" name="mbr_id" placeholder="아이디를 입력하세요" required autofocus>
			    	</div>
			    	<div class="form-group">
			      		<input type="password" class="form-control" id="mbr_pw" name="mbr_pw" placeholder="비밀번호를 입력하세요" required>
			    	</div>
			    	
			    	<button type="submit" class="btn btn-primary btn-block">로그인</button><br>
			 	
			 		<div class="form-check-inline">
					  	<label class="form-check-label">
					    	<input type="checkbox" class="form-check-input" value="">자동로그인
					  	</label>
					</div>
					
					<div class="form-group" align="center">
						<br>
			      		<a href="#">회원가입</a>&nbsp;|&nbsp;
			      		<a href="#">ID찾기</a>&nbsp;|&nbsp;
			      		<a href="#">PW찾기</a>
			    	</div>
			    	
					<div class="form-group" align="center">
						<br>
			      		<a href="/oauth2/authorization/kakao"><img src="<c:url value="/img/kakao_circle.png"/>" width="50" height="50"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			      		<a href="/oauth2/authorization/naver"><img src="<c:url value="/img/naver-icon-file.jpg"/>" width="50" height="50"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			      		<a href="/oauth2/authorization/google"><img src="<c:url value="/img/google_logo.jpg"/>" width="50" height="50"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			      		<a href="/oauth2/authorization/facebook"><img src="<c:url value="/img/facebook_logo.png"/>" width="50" height="50"></a>
			    	</div>	    	
			 	</form>
			</div>
  		</div>
  		<div class="col"></div>
	</div>
</body>
</html>