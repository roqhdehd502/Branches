<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Member Registration</title>
	
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
	
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
</head>
<body>
	<div class="row">
  		<div class="col"></div>
  		<div class="col">
  			<div class="container">
				<div align="center"><img src="<c:url value="/img/branches_text.png"/>" width="200"></div>
				<h2 align="center">회원가입</h2><br>
				
			  	<form action="/join" method="post">	  	
			    	<div class="form-group row">
			    		<label class="col-sm-3 col-form-label">ID</label>
			      		<div class="col-sm-7">
			      			<input type="text" class="form-control" id="mbr_id" name="mbr_id" maxlength="20" placeholder="영문 + 숫자 조합 5~11자" required="required">
			      		</div>
			      		<button type="button" class="btn btn-primary btn-sm">중복확인</button>
			      		<!-- 이부분은 추후 스크립트상에서 alert으로 알림띄울것
						<div class="col-sm-2" style="padding-left: 0px">
							<button type="button" class="btn btn-primary">중복체크</button>
						</div>	 -->
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-3 col-form-label">PW</label>
			      		<div class="col-sm-9">
			      			<input type="password" class="form-control" id="mbr_pw" name="mbr_pw" placeholder="영문 + 숫자 + 특수문자 조합 8~16자" required="required" onchange="isSame()">
			      		</div>	
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-3 col-form-label">PW확인</label>
			    		<!-- 이부분은 추후 스크립트상에서 ajax로 알림띄울것 -->
			      		<div class="col-sm-5">
			      			<input type="password" class="form-control" id="pw_c" name="pw_c" placeholder="비밀번호 확인" required="required" onchange="isSame()">
			      		</div>
			      		
								<script type="text/javascript">

									function isSame() {
										
										var pw = $("mbr_pw").val();
										var pw_c = $("pw_c").val();
									    
									    if(pw !="" || pw_c != "") {
									    	if(document.getElementById('mbr_pw').value == document.getElementById('pw_c').value) {
									    		document.getElementById('check').innerHTML='비밀번호 일치';
									    		document.getElementById('check').style.color='blue';
									    	} else {
									        	document.getElementById('check').innerHTML='비밀번호 불일치';
									        	document.getElementById('check').style.color='red';
									        }
									    }
									    
									}
								</script>
								
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-3 col-form-label">닉네임</label>
			      		<div class="col-sm-9">
			      			<input type="text" class="form-control" id="mbr_nickname" name="mbr_nickname" placeholder="닉네임을 입력해주세요 (필수)">
			      		</div>	
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-3 col-form-label">이메일</label>
			      		<div class="col-sm-9">
			      			<input type="text" class="form-control" id="mbr_email" name="mbr_email" placeholder="이메일">
			      		</div>
						<!-- <div class="col-sm-4">
							<select class="form-control" name="selectEmail" id="selectEmail">
								<option value="1" selected>직접입력</option>
						    	<option value="naver.com">naver.com</option>
						    	<option value="gmail.com">gmail.com</option>
						    	<option value="hanmail.com">hanmail.com</option>
						    	<option value="nate.com">nate.com</option>
						    	<option value="daum.net">daum.net</option>
						    </select>
						    <script type="text/javascript"></script>
						</div>	 -->	
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-3 col-form-label">이름</label>
			      		<div class="col-sm-9">
			      			<input type="text" class="form-control" id="mbr_name" name="mbr_name" placeholder="실명을 입력해주세요 (필수)" required="required">
			      		</div>	
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-3 col-form-label">연락처</label>
			      		<div class="col-sm-9">
			      			<input type="number" id="contact_number" name="contact_number" class="form-control" placeholder="숫자만 입력하세요">
			      		</div>	
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-3 col-form-label">생년월일</label>
			      		<div class="col-sm-9">
			      			<input type="date" id="mbr_birth" name="mbr_birth" class="form-control">
			      		</div>	
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-3 col-form-label">성별</label>
			      		<div class="col-sm-3" align="center">
			      			<input type="radio" class="form-check-input" name="mbr_gender" id="mbr_gender" value="M"
			      			>&nbsp;M
			      		</div>
			      		<div class="col-sm-3" align="center">
			      			<input type="radio" class="form-check-input"  name="mbr_gender" id="mbr_gender" value="F"
			      			>&nbsp;F
			      		</div>	
			      		<div class="col-sm-3" align="center">
			      			<input type="radio" class="form-check-input"  name="mbr_gender" id="mbr_gender" value="N"
			      			>&nbsp;N
			      		</div>		
			    	</div>
			    	<hr>
			    	<div class="form-group row">
			    		<div class="col-sm-12" align="center">
			      			<legend>이용약관</legend>
			      		</div>
			      		<div class="col-sm-10" align="left" style="padding-left: 8%">
			      			<input type="checkbox" class="form-check-input">&nbsp;개인정보 수집 이용동의 (필수)&nbsp;
			      		</div>	
			      		<div class="col-sm-2" align="right" style="padding-right: 5%">
			      			<button type="button" class="btn btn-primary btn-sm">약관</button>
			      		</div>
			      		<hr>
			      		<div class="col-sm-10" align="left" style="padding-left: 8%">
			      			<input type="checkbox" class="form-check-input">&nbsp;브랜치스 이용약관 (필수)&nbsp;
			      		</div>
			      		<div class="col-sm-2" align="right" style="padding-right: 5%">	
			      			<button type="button" class="btn btn-primary btn-sm">약관</button>
			      		</div>
			      		<hr>
			      		<div class="col-sm-10" align="left" style="padding-left: 8%">
			      			<input type="checkbox" class="form-check-input">&nbsp;만 14세 미만 가입 제한 (필수)&nbsp;
			      		</div>
			      		<div class="col-sm-2" align="right" style="padding-right: 5%">	
			      		</div>
			    	</div>
			    	<hr>
			    	<button type="submit" class="btn btn-primary btn-block">회원 가입</button><br>  	
			 	</form>
			</div>
  		</div>
  		<div class="col"></div>
	</div>
</body>
</html>