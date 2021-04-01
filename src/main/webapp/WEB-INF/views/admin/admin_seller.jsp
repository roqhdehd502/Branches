<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>업체정보</title>

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
        var mbr_name = $("#mbr_name").val();
        var mbr_email = $("#mbr_email").val();
        var contact_number = $("#contact_number").val(); 
        var shipping_address = $("#shipping_address").val();
        
        console.log(mbr_id);
        console.log($(this).attr("action"));
        
        var form = {
        		mbr_id: mbr_id,
        		mbr_pw: mbr_pw,
        		mbr_name: mbr_name,
        		mbr_email: mbr_email,
        		contact_number: contact_number,
        		shipping_address: shipping_address
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
					$(location).attr('href', '${pageContext.request.contextPath}/admin/mypage/seller/${mbr.mbr_id}')				      	       
				}					        
		    },
		    error: function (e) {
		        console.log(e);
		    }
		})	       

    }); // end submit()
    
}); // end ready() 
</script>
<script type="text/javascript">
	$(document).ready(function (){
		$('#delete').click(function(event){
			event.preventDefault();
			console.log("ajax 호출전");		
			//var trObj = $(this).parent().parent(); 
 
			$.ajax({
				type : 'DELETE',
				url : $(this).attr("href"),
				cache : false,
				success: function(result){
					console.log(result);
					if(result=="SUCCESS"){
						if(result == "SUCCESS"){     
                  					$(location).attr('href', '${pageContext.request.contextPath}/admin/mypage/seller')                            
               				}  
					}
				},
				error:function(e){
					console.log(e);
				}
			})
		});	
	});	
	</script>
</head>
<body>
<div style="overflow: hidden;" class="container">
	<header>
			<div class="container">
				<div class="row">
					<div class="col-6 col-sm-3 logo-column">
						<a href="index.html" class="logo"> <img src="/img/branches_text.png" alt="logo" style="width: 70px; height: 200px;">
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
		</header>
						
		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container" style="text-align: center; margin: 25px;">
			<h3>
			<strong>관리자 페이지</strong>
			</h3>
		</div>

		
		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<div class="col-md-3 contact-info" align="center">
				<div class="single-info" style="margin-bottom: 40px;">
	                    <h3>업체관리</h3><hr>
	                    <h5><a href="#">업체등록</a></h5>
	                    <h5><a href="#">업체목록 조회</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>회원관리</h3><hr>
	                    <h5><a href="#">회원정보 조회</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>고객 Q&A 목록</h3><hr>
	                    <h5><a href="#">통계</a></h5>
	                    <h5><a href="#">매출조회</a></h5>
	                    <h5><a href="#">검색순위 조회</a></h5>
	                </div>
				</div>
				
				<div class="col-md-9 contact-info">
					<h3 >
					<strong>판매자 등록 정보</strong>
					</h3><hr>
					<form action="${pageContext.request.contextPath}/admin/mypage/seller/${mbr.mbr_id}" method="post" id="updateForm">
						<input type="hidden" id="mbr_id" value="${mbr.mbr_id}">
						<fieldset>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">Name</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" value="${mbr.mbr_name}" id="mbr_name">
								</div>
									<button id="delete" type="button" class="btn btn-danger" style="float: right;">탈퇴</button>
							</div>
							<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label">ID</label>
							<label for="staticEmail" class="col-sm-2 col-form-label">
									${mbr.mbr_id}
								</label>
							</div>
							
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">PW</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" value="${mbr.mbr_pw }" id="mbr_pw" required="required" onchange="isSame()">
								</div>
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
							<label for="staticEmail" class="col-sm-2 col-form-label">Address</label>
							<div class="col-sm-10">
									<input type="text" class="form-control" value="${adr.shipping_address}" id="shipping_address">
								</div>
							</div>
							
								<div style="text-align: center;">
									<input type="submit" class="btn btn-primary" value="저장" />
									<input type="button" class="btn btn-primary" style="float: right; margin-left: 20px;" onclick="location.href='${pageContext.request.contextPath}/admin/mypage/seller'" value="목록">	
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
		<br /><br />
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