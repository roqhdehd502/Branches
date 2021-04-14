<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : My Information Modify</title>
	
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
	
	<script type="text/javascript">
	$(document).ready(function(){
		//https://m.blog.naver.com/PostView.nhn?blogId=moonv11&logNo=220605582547&proxyReferer=https:%2F%2Fwww.google.com%2F
		$("#updateForm").submit(function(event){
			
			event.preventDefault();
			
			var mbr_id = $("#mbr_id").val();
	        var mbr_pw = $("#mbr_pw").val();
	        var mbr_email = $("#mbr_email").val();
	        var contact_number = $("#contact_number").val();
	        var mbr_gender = $("#mbr_gender:checked").val();        
	        
	        console.log("mbr_id : " + mbr_id);
	        console.log("mbr_pw : " + mbr_pw);
	        console.log("mbr_email : " + mbr_email);
	        console.log("contact_number : " + contact_number);
	        console.log("mbr_gender : " + mbr_gender);
	        console.log($(this).attr("action"));
	        
	        var form = {
	        		mbr_id: mbr_id,
	        		mbr_pw: mbr_pw,
	        		mbr_email: mbr_email,
	        		contact_number: contact_number,
	        		mbr_gender: mbr_gender
	        };
		    //dataType: 'json',
	        $.ajax({
			    type : "POST",
			    url : $(this).attr("action"),
			    cache : false,
			    contentType:'application/json; charset=utf-8',
				data: JSON.stringify(form), 
			    success: function (result) {       
					if(result == "SUCCESS") {
						alert("정보 수정이 완료되었습니다.");
						//list로 
						$(location).attr('href', '${pageContext.request.contextPath}/member/mypage')				      	       
					}					        
			    },
			    error: function (e) {
			        console.log(e);
			    }
			})	       
	    }); // end submit()    
	}); // end ready() 
	</script>
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"></jsp:include>

		<hr style="margin: 15px 15px 40px 15px;">
		
		<!-- 상단 회원 정보 요약 -->
		<div class="container">
			<div class="row" style="height: 50px;">
				<div class="col-md-3 contact-info" align="left" style="padding-left: 15px; margin-top: 10px; text-align: center;">
					<h2>${mbr.mbr_name}</h2>
				</div>
				<div class="col-md-1 contact-info" style="padding-top: 20px;">
					<!-- 정보수정 페이지라 없어도 되지않나요...? -->
					<%-- <a href="${pageContext.request.contextPath}/member/mypage/myinfo">정보수정</a> --%>
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
							<a href="${pageContext.request.contextPath}/member/mypage/recently">최근 본 상품보기</a>
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
				<div class="col-md-9 contact-info">
					<h3>
						<strong>회원 등록 정보</strong>
					</h3>
					<hr>
					<form action="${pageContext.request.contextPath}/member/mypage/myinfo" method="post" id="updateForm">
						<input type="hidden" id="mbr_id" value="${mbr.mbr_id}">
						<fieldset>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">Name</label> <label for="staticEmail" class="col-sm-2 col-form-label">
									${mbr.mbr_name} </label>
							</div>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">ID</label> <label for="staticEmail" class="col-sm-2 col-form-label">
									${mbr.mbr_id} </label>
							</div>

							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">PW</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="mbr_pw" required="required" onchange="isSame()">
								</div>
							</div>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">PW 확인</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" placeholder="비밀번호를 확인하세요" id="pw_c" required="required" onchange="isSame()">
								</div>
								<span id="check"></span>
								<!-- PW 중복 체크 로직 -->
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
								<label for="staticEmail" class="col-sm-2 col-form-label">EMAIL</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" value="${mbr.mbr_email}" id="mbr_email">
								</div>
							</div>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">Phone</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" value="${mbr.contact_number}" id="contact_number">
								</div>
							</div>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">Gender</label>
								<div class="form-check" style="padding-left: 0;">
									<label class="form-check-label" style="margin: 16px;">남성 <span style="position: relative; top: 25px; right: 5px;"> <input
											style="width: 14px; height: 14px;" type="radio" class="form-check-input" name="mbr_gender" id="mbr_gender" value="M"
											<c:if test="${mbr.mbr_gender eq 'M'}"> checked="checked" </c:if>></input></span>
									</label> <label class="form-check-label" style="margin: 16px;">여성 <span style="position: relative; top: 25px; right: 5px;"> <input
											style="width: 14px; height: 14px;" type="radio" class="form-check-input" name="mbr_gender" id="mbr_gender" value="F"
											<c:if test="${mbr.mbr_gender eq 'F'}"> checked="checked" </c:if>></input></span>
									</label> <label class="form-check-label" style="margin: 16px;">논 <span style="position: relative; top: 25px; right: 5px;"> <input
											style="width: 14px; height: 14px;" type="radio" class="form-check-input" name="mbr_gender" id="mbr_gender" value="N"
											<c:if test="${mbr.mbr_gender eq 'N'}"> checked="checked" </c:if>></input></span>
									</label>
								</div>
								<br /><br />
							</div>
							<div style="text-align: center;">
								<input type="submit" class="btn btn-primary" value="저장">
							</div>
						</fieldset>
					</form>
				</div>
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