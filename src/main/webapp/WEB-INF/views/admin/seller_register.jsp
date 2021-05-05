<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Seller Registration</title>
	
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
	<div style="overflow: hidden;" class="container">
		<header style="padding-top: 0px;">
			<!-- header -->
			<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
		</header>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<div class="col-md-3 contact-info" align="left" style="padding-left: 40px">
					<h2>관리자</h2>
				</div>
				<div class="col-md-1 contact-info" align="center" style="padding-top: 20px">
					<a href="#">정보수정</a>					
				</div>
				<div class="col-md-8 contact-info"></div>		
			</div>
		</div>
		
		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px;">
	                    <h3>업체관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/regist/seller">업체등록</a></h5>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/seller">업체목록 조회</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>회원관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/member">회원정보 조회</a></h5>
	               		 <h5><a href="${pageContext.request.contextPath}/admin/mypage/member/userQnA">고객Q&A 목록</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>매출관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/admintotal">매출조회</a></h5>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/adminSearchtotal">검색순위 조회</a></h5>
	                </div>
				</div>
				
				<div class="col-md-9 contact-info">
					<h3 >
					<strong>업체 등록</strong>
					</h3><hr>
					<form action="${pageContext.request.contextPath}/admin/mypage/regist/seller" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<fieldset>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">업체명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="mbr_name" name="mbr_name" placeholder="업체명을 입력해주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">ID</label>
								<div class="col-sm-10 row">
									<div class="col-sm-10">
										<input type="text" class="form-control" id="mbr_id" name="mbr_id" placeholder="아이디를 입력해주세요">
									</div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-primary" id="idChk" onclick="idCheck()">중복체크</button>
										<script type="text/javascript">
											function idCheck() {

												var isID = /^[a-zA-Z0-9-_!]{5,16}$/;
												var id = $("#mbr_id").val();

												if (!isID.test(id)) {
													alert("아이디 형식을 확인해주세요");
													$("#mbr_id").focus();
												} else {
													$.ajax({
														url : '/admin/mypage/regist/seller/idCheck',
														type : 'GET',
														data : {
															'id' : $('#mbr_id').val()
															},
															dataType : 'html',
															success : function(
																	data) {
																alert(data);
															}
														});
												}
											}
										</script>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">PW</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="mbr_pw" name="mbr_pw" placeholder="비밀번호를 입력해주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">e-mail</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="mbr_email" name="mbr_email" placeholder="이메일을 입력해주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">주소</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="shipping_address" name="shipping_address" placeholder="주소를 입력해주세요">
								</div>
							</div>
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label">연락처</label>
					      		<div class="col-sm-10">
					      			<input type="number" id="contact_number" name="contact_number" class="form-control">
					      		</div>		
					    	</div>
							<div align="center">
							<button type="submit" class="btn btn-primary">업체등록</button>
							</div>	
						</fieldset>
					</form>			
				</div>
			</div>
		</div>
		
		<hr>
			
<!-- footer -->

      <footer>
         <div class="footer-top">
            <div class="container">
               <div class="row">
                  <div class="col-md-6 col-lg-3 footer_widget">
                     <div class="inner">
                        <h4>About</h4>
                     </div>
                  </div>
                  <div class="col-md-6 col-lg-3 footer_widget">
                     <div class="inner">
                        <h4>Company</h4>

                     </div>
                  </div>
                  <div class="col-md-6 col-lg-3 footer_widget">
                     <div class="inner">
                        <h4>Recent Posts</h4>
                     </div>
                  </div>
                  <div class="col-md-6 col-lg-3 footer_widget">
                     <div class="inner">
                        <h4 style="padding-left: 100px;">Address</h4>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="footer-bottom">
            <div class="container">
               <div class="row">
                  <div class="col-lg-6">
                     <div class="copyright-txt">© 2017 Flat Pro. All Rights Reserved.</div>
                  </div>
                  <div class="col-lg-6 text-right">
                     <div class="footer-nav">
                        <a href="#">Home</a> <a href="#">Portfolio</a> <a href="#">Pages</a> <a href="#">Shortcode</a> <a href="#">Blog</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
      </footer>
      <div class="container-fluid">
         <small style="color: black;"> <strong>상호명 :</strong> (주)브랜치스 <strong>소재지 :</strong> 서울특별시 00구 00로00길 00 00빌딩 0층 <strong>팩스 :</strong>
            000-0000-0000 <strong>사업자등록번호 :</strong> 000-00-000000 <strong>통신판매업신고 :</strong> 0000-서울종로-00000
         </small> <br /> <small style="color: black;"><strong>고객센터</strong> 0000-0000 평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무) <strong>이메일</strong>
            admin@branches.co.kr <strong>대표이사</strong> 000 <strong>개인정보책임자</strong> 000 <strong>호스팅서비스</strong> (주)00000</small>
      </div><br/><br/>

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