<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
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
			beforeSend : function(xhr) {
			xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
		    }, 
		    success: function (result) {       
				if(result == "SUCCESS"){
					//list로 
					$(location).attr('href', '${pageContext.request.contextPath}/seller/mypage/myinfo/${mbr.mbr_id}')				      	       
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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<div style="overflow: hidden;" class="container">
		<header>
			<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
		</header>
		<div class="container">
         <span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
            <h3>${mbr.mbr_name }</h3>
            <h3 style="position: relative; top: 15px;">${mbr.mbr_id }</h3>
         </span>
         <span style="margin-left: 22px; position: relative; bottom: 10px;"> <a href="/seller/mypage/myinfo/${mbr.mbr_id }">정보수정</a></span> 
           <span style="margin-left: 300px;" align="center">
            <h2 style="position: relative; top: 5px;">새 주문</h2>
            <h4 style="position: relative; top: 15px;">${orderCount } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">취소</h2>
            <h4 style="position: relative; top: 15px;">${cancelCount } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">교환</h2>
            <h4 style="position: relative; top: 15px;">${exchangeCount } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">환불</h2>
            <h4 style="position: relative; top: 15px;">${refundCount } 건</h4>
         </span>
      </div>
		
		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<div class="col-md-3 contact-info" align="center">
				<div class="single-info" style="margin-bottom: 40px">
	                    <h3>마이페이지</h3><hr>
	                    <h5><a href="/seller/mypage">홈 바로가기</a></h5>
	                </div>
					<div class="single-info" style="margin-bottom: 40px">
	                    <h3>주문 관리</h3><hr>
	                    <h5><a href="/seller/mypage/order">주문확인</a></h5>
	                    <h5><a href="/seller/mypage/release">발송확인</a></h5>
	                    <h5><a href="/seller/mypage/cancel">취소</a></h5>
	                    <h5><a href="/seller/mypage/exchange">교환</a></h5>
	                    <h5><a href="/seller/mypage/refund">환불</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>상품 관리</h3><hr>
	                    <h5><a href="/seller/mypage/${mbr.mbr_id}/prdct_register">등록</a></h5>
	                    <h5><a href="/seller/mypage/prdct">조회</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>회원 관리</h3><hr>
	                    <h5><a href="/seller/mypage/prdctqna">Q&A</a></h5>
	                    <h5><a href="/seller/mypage/review">리뷰</a></h5>
	                </div>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>매출 관리</h3><hr>
	                    <h5><a href="/seller/mypage/sales">매출</a></h5>
	                </div>
				</div>

				
				<div class="col-md-9 contact-info">
					<h3 >
					<strong>판매자 등록 정보</strong>
					</h3><hr>
					<form action="${pageContext.request.contextPath}/seller/mypage/myinfo/${mbr.mbr_id}/modify" method="post" id="updateForm">
						<input type="hidden" id="mbr_id" value="${mbr.mbr_id}">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<fieldset>
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-2 col-form-label">Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" value="${mbr.mbr_name}" id="mbr_name">
								</div>
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
							<label for="staticEmail" class="col-sm-2 col-form-label">Address</label>
							<div class="col-sm-10">
									<input type="text" class="form-control" value="${adr.shipping_address}" id="shipping_address">
								</div>
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