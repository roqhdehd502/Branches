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
	<title>Branches : Find ID PW</title>
	
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

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
	
</head>
<body>
	<div class="row">
  		<div class="col"></div>
  		<div class="col">
			<div class="container">
				<div align="center">
					<img src="<c:url value="/img/branches_text.png"/>" width="200">
				</div>
				<h2 align="center">ID PW 찾기</h2>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<br>
				<div class="form-group row" >
					<input type="text" class="form-control" id="id_name" name="id_name" placeholder="이름을 입력하세요"> <br /> <br /> 
					<input type="number" class="form-control" id="id_contact" name="id_contact" placeholder="연락처를 입력하세요">
					<button type="button" class="btn btn-primary btn" onclick="getID()">ID 찾기</button>
					<script type="text/javascript">
						function getID() {
							
							var name = $("#id_name").val();
							var contact = $("#id_contact").val();
							
							 // csrf
							var token = $("meta[name='_csrf']").attr("content");
							var header = $("meta[name='_csrf_header']").attr("content");
							
							if(name != "" || contact != "") {
								$.ajax({
									url : '/find_id',
									type : 'GET',
									data : {
										name, contact
									},
									dataType : 'html',
									beforeSend: function(xhr) {
										xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
									},
									success : function(data) {
										alert(data);
									}
								});
							} else {
								alert("모든 정보를 입력해주세요");
							}
						}
					</script>
				</div>
				
				<div class="form-group row" >
					<input type="text" class="form-control" id="pw_id" name="pw_id" placeholder="ID를 입력하세요"> <br /> <br /> 
					<input type="text" class="form-control" id="pw_name" name="pw_name" placeholder="이름을 입력하세요"> <br /> <br /> 
					<input type="text" class="form-control" id="pw_email" name="pw_email" placeholder="이메일을 입력하세요">
					<button type="button" class="btn btn-primary btn" onclick="getPW()">비밀번호 찾기</button>
					<script type="text/javascript">
						function getPW() {
							
							var id = $("#pw_id").val();
							var name = $("#pw_name").val();
							var email = $("#pw_email").val();

							 // csrf
							var token = $("meta[name='_csrf']").attr("content");
							var header = $("meta[name='_csrf_header']").attr("content");
							
							if(id != "" || name != "" || email != "") {
								$.ajax({
									url : '/find_pw',
									type : 'POST',
									data : {
										id, name, email
									},
									dataType : 'html',
									beforeSend: function(xhr) {
										xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
									},
									success : function(data) {
										
										var result = data;
										
											if(result == "SUCCESS") {
												alert("임시 비밀번호를 발급완료하였습니다\n이메일을 확인하세요");
												location.href = "login"; 
											} else {
												alert("존재하지 않는 회원입니다\n입력한 정보를 확인해주세요");
											}
									}
								});
							} else {
								alert("정보를 다 입력해주세요");
							}
						}
					</script>
				</div>
			</div>
		</div>

  		<div class="col"></div>

	
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