<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
				
			  	<form action="member/mypage">
					<div class="form-check" align="left">
						<label class="form-check-label">
							<p>
							<input type="radio" class="form-check-inline" name="optradio">회원&nbsp;&nbsp;&nbsp;
							<input type="radio" class="form-check-inline" name="optradio">비회원
							</p>
						</label>
					</div>	  	
			  	
			    	<div class="form-group">
			      		<input type="text" class="form-control" id="usr" name="username" placeholder="아이디를 입력하세요">
			    	</div>
			    	<div class="form-group">
			      		<input type="password" class="form-control" id="pwd" name="password" placeholder="비밀번호를 입력하세요">
			    	</div>
			    	
			    	<button type="submit" class="btn btn-primary btn-block">로그인</button><br>
			 	
			 		<div class="form-check-inline">
					  	<label class="form-check-label">
					    	<input type="checkbox" class="form-check-input" value="">자동로그인
					  	</label>
					</div>
					
					<div class="form-group" align="center">
						<br>
			      		<a href="/member/member_register">회원가입</a>&nbsp;|&nbsp;
			      		<a href="#">ID찾기</a>&nbsp;|&nbsp;
			      		<a href="#">PW찾기</a>
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
</body>
</html>