<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원정보</title>

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
        
        console.log(mbr_id);
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
		    type : "PUT",
		    url : $(this).attr("action"),
		    cache : false,
		    contentType:'application/json; charset=utf-8',
			    data: JSON.stringify(form), 
		    success: function (result) {       
				if(result == "SUCCESS"){
					//list로 
					$(location).attr('href', '${pageContext.request.contextPath}/rest_ksp/member/${mbr.mbr_id}/mypage/myinfo')				      	       
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
		<header style="padding-bottom: 10px; padding-top: 5px;">
			<div class="container">
				<div class="row">
					<div class="col-6 col-sm-3 logo-column">
						<a href="index.html" class="logo" style="height: 70px;"> <img src="/img/branches_text.png" alt="logo" style="width: 160px; height: 70px;">
						</a>
					</div>
					<div class="col-6 col-sm-9 nav-column clearfix">
						<div class="right-nav">
							<span class="search-icon fa fa-search"></span>
							<form action="#" class="search-form">
								<input type="search" placeholder="search now">
								<button type="submit">
									<i class="fa fa-search"></i>
								</button>
							</form>
							<div class="header-social">
								<a href="#" class="fa fa-facebook"></a> <a href="#" class="fa fa-twitter"></a> <a href="#" class="fa fa-github"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<nav id="menu" class="d-none d-lg-block">
				<ul style="padding: 10px; background-color: black;">
					<li class="current-menu-item has-child"><a href="index.html">OUTER</a>
						<ul class="sub-menu">
							<li><a href="index.html">Coat</a></li>
							<li><a href="index-2.html">Jarcket</a></li>
							<li><a href="index-3.html">Jumper / Mustang</a></li>
							<li><a href="index-3.html">Cardigan</a></li>
							<li><a href="index-3.html">Padding</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">TOP</a>
						<ul class="sub-menu">
							<li><a href="index.html">T-shirt</a></li>
							<li><a href="index-2.html">Blouse / Shirt</a></li>
							<li><a href="index-3.html">Knit / Sweater</a></li>
							<li><a href="index-3.html">Hoddie</a></li>
							<li><a href="index-3.html">Sweat shirt</a></li>
							<li><a href="index-3.html">Sleeveless</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">BOTTOM</a>
						<ul class="sub-menu">
							<li><a href="index.html">Denim</a></li>
							<li><a href="index-2.html">Cotton</a></li>
							<li><a href="index-3.html">Shorts</a></li>
							<li><a href="index-3.html">Slacks</a></li>
							<li><a href="index-3.html">Training / Jogger</a></li>
							<li><a href="index-3.html">Leggings</a></li>
							<li><a href="index-3.html">Skirt</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">Dress</a>
						<ul class="sub-menu">
							<li><a href="index.html">Mini</a></li>
							<li><a href="index-2.html">Midi</a></li>
							<li><a href="index-3.html">Maxi</a></li>
							<li><a href="index-3.html">Overall</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">Bag</a>
						<ul class="sub-menu">
							<li><a href="index.html">Bagpack</a></li>
							<li><a href="index-2.html">Messenger / Cross</a></li>
							<li><a href="index-3.html">Shoulder / Tote</a></li>
							<li><a href="index-2.html">Eco bag</a></li>
							<li><a href="index-3.html">Clutch</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">Shoes</a>
						<ul class="sub-menu">
							<li><a href="index.html">Dress shoes</a></li>
							<li><a href="index-2.html">Boots</a></li>
							<li><a href="index-3.html">Sandal</a></li>
							<li><a href="index-2.html">Slipper</a></li>
							<li><a href="index-3.html">Sneakers</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">ETC</a>
						<ul class="sub-menu">
							<li><a href="index.html">Socks</a></li>
							<li><a href="index-2.html">Cap</a></li>
							<li><a href="index-3.html">Acc</a></li>
						</ul></li>
					<li><a href="index.html" style="color: white;">|</a></li>
					<li class="current-menu-item has-child"><a href="index.html">BRAND</a>
						<ul class="sub-menu">
							<li><a href="index.html">Nike</a></li>
							<li><a href="index-2.html">Thisisneverthat</a></li>
							<li><a href="index-3.html">Covernat</a></li>
							<li><a href="index-3.html">AnderssonBell</a></li>
							<li><a href="index-3.html">Vans</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">MAGAZINE</a>
						<ul class="sub-menu">
							<li><a href="index.html">바로가기</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html" style="margin-right: 38px;">NOTICE</a>
						<ul class="sub-menu">
							<li><a href="index.html">바로가기</a></li>
						</ul></li>
				</ul>
			</nav>
		</header>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row" style="height: 50px;">
				<div class="col-md-3 contact-info" align="left" style="padding-left: 15px; margin-top: 10px; text-align: center;">
					<h2>${mbr.mbr_name}</h2>
				</div>
				<div class="col-md-1 contact-info" style="padding-top: 20px;">
					<a href="#">정보수정</a>
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
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
						<h3>나의 쇼핑활동</h3>
						<hr>
						<h5>
							<a href="#">주문내역 조회</a>
						</h5>
						<h5>
							<a href="#">최근 본 상품보기</a>
						</h5>
						<h5>
							<a href="#">찜한 목록</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>매거진</h3>
						<hr>
						<h5>
							<a href="#">매거진</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>내가 쓴 글보기</h3>
						<hr>
						<h5>
							<a href="#">구매후기</a>
						</h5>
						<h5>
							<a href="#">상품문의</a>
						</h5>
						<h5>
							<a href="#">고객Q&A</a>
						</h5>
					</div>
				</div>


				<div class="col-md-9 contact-info">
					<h3>
						<strong>회원 등록 정보</strong>
					</h3>
					<hr>
					<form action="${pageContext.request.contextPath}/member/${mbr.mbr_id}/mypage/myinfo" method="post" id="updateForm">
						<input type="hidden" id="mbr_id" value="${mbr.mbr_id}">
						<fieldset>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">Name</label> 
								<label for="staticEmail" class="col-sm-2 col-form-label">
									${mbr.mbr_name} </label>
							</div>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">ID</label> 
								<label for="staticEmail" class="col-sm-2 col-form-label">
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
								<span id="check" ></span>
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
									<label class="form-check-label" style="margin: 16px;">남성 <span style="position: relative; top: 25px; right: 5px;"> 
									<input style="width: 14px; height: 14px;" type="radio" class="form-check-input" name="mbr_gender" id="mbr_gender" value="M"
											<c:if test="${mbr.mbr_gender eq 'M'}"> checked="checked" </c:if>></input></span>
									</label> 
									<label class="form-check-label" style="margin: 16px;">여성 <span style="position: relative; top: 25px; right: 5px;"> 
									<input style="width: 14px; height: 14px;" type="radio" class="form-check-input" name="mbr_gender" id="mbr_gender" value="F"
											<c:if test="${mbr.mbr_gender eq 'F'}"> checked="checked" </c:if>></input></span>
									</label>
									<label class="form-check-label" style="margin: 16px;">논 <span style="position: relative; top: 25px; right: 5px;"> 
									<input style="width: 14px; height: 14px;" type="radio" class="form-check-input" name="mbr_gender" id="mbr_gender" value="N"
											<c:if test="${mbr.mbr_gender eq 'N'}"> checked="checked" </c:if>></input></span>
									</label>
								</div>
								<br />
								<br />
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
		<div>
			<div class="footer-top">
				<div class="container" align="center">
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
								<h4>Address</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
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
		</div>


		<div class="container-fluid">
			<small style="color: black;"> <strong>상호명 :</strong> (주)브랜치스 <strong>소재지 :</strong> 서울특별시 00구 00로00길 00 00빌딩 0층 <strong>팩스 :</strong>
				000-0000-0000 <strong>사업자등록번호 :</strong> 000-00-000000 <strong>통신판매업신고 :</strong> 0000-서울종로-00000
			</small> <br /> <small style="color: black;"><strong>고객센터</strong> 0000-0000 평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무) <strong>이메일</strong>
				customer@29cm.co.kr <strong>대표이사</strong> 000 <strong>개인정보책임자</strong> 000 <strong>호스팅서비스</strong> (주)00000</small>
		</div>
		<br />
		<br />
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