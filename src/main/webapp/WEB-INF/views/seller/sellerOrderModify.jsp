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
<title>판매자 주문 상품 수정</title>

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
<script src="/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#stateUpdate").submit(function(event){
		event.preventDefault();
		
		var order_number = $("#order_number").val();
		var order_state_number = $("#order_state_number").val();
		var order_color = $("#order_color").val();
		var order_size = $("#order_size").val();

		console.log(order_number);
        console.log(order_state_number);
        console.log(order_color);
        console.log(order_size);
        
        var form = {
        		order_state_number: order_state_number,
        		order_number: order_number,
        		order_color: order_color,
        		order_size: order_size
       	 };
        console.log(form);

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
					if (confirm("정말 수정하시겠습니까??") == true) { //확인
						//(게시글 수정)
						console.log("Modify!")
						$(location).attr('href', '${pageContext.request.contextPath}/seller/mypage')
					} else { //취소
						return;
					}			      	       
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
	<header>
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>
		<div class="container">
			<span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
				<h3>${mbr.mbr_name }</h3>
            	<h3 style="position: relative; top: 15px;">${mbr.mbr_id }</h3>
			</span>
			<span style="margin-left: 22px; position: relative; bottom: 10px;">
				<a href="/seller/mypage/myinfo/${mbr.mbr_id }">정보수정</a>
			</span>
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
		
		<hr style="margin: 15px 15px 24px 15px;">

		<div class="container">
			<div class="row">
				<div class="col-md-2 contact-info" align="center">
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
					
				<!-- 등록한 상품 리스트	 -->
			<div class="col-md-10 contact-info" style="border-left: 1px solid rgba(0,0,0,.1) ;">
					<h3 >
					<strong>주문 상세 정보</strong>
					</h3><hr>
					<h4> 배송지 정보 </h4><hr />
					<form id="stateUpdate" action="/seller/mypage/order/${info.prdct_id }/${info.order_number }/modify" method="PUT">
						<input type="hidden" name="order_number" id="order_number" value="${info.order_number }">
						<input type="hidden" name="prdct_id" id="prdct_id" value="${info.prdct_id }">
						<input type="hidden" name="mbr_id" id="mbr_id" value="${info.mbr_id }">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<fieldset>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">아이디</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="mbr_id" id="mbr_id" value="${info.mbr_id }" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="shipping_name" id="shipping_name" value="${mbrInfo.order_name }" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">연락처</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="shipping_tel" id="shipping_tel" value="${mbrInfo.order_tel }" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">주소</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="shipping_address" id="shipping_address" value="${mbrInfo.shipping_address }" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">색상</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="order_color" id="order_color" value="${info.order_color }" disabled="disabled">
									
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">사이즈</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="order_size" id="order_size" value="${info.order_size }" disabled="disabled">
									<input class="btn btn-primary btn-sm" type='button' value='활성화' onclick='textActive()' />
									<input class="btn btn-primary btn-sm" type='button' value='비활성화' onclick='textDisabled()' />&nbsp;&nbsp;&nbsp; 
									<span><h6>교환 요청시 활성화하여 정보를 수정해주세요</h6></span>
									<script type="text/javascript">
									function textActive()  {
										  const target = document.getElementById('order_size');
										  const target1 = document.getElementById('order_color');
										  target.disabled = false;
										  target1.disabled = false;
										}

										function textDisabled()  {
										  const target = document.getElementById('order_size');
										  const target1 = document.getElementById('order_color');
										  target.disabled = true;
										  target1.disabled = true;
										}

									</script>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">상태</label>
								<div class="col-sm-10">
									<select class="form-control" name="order_state_number" id="order_state_number">
										<option value="1" <c:if test="${info.order_state_number == 1 }">selected</c:if>>결제대기</option>
										<option value="2" <c:if test="${info.order_state_number == 2 }">selected</c:if>>결제완료</option>
										<option value="3" <c:if test="${info.order_state_number == 3 }">selected</c:if>>주문요청</option>
										<option value="4" <c:if test="${info.order_state_number == 4 }">selected</c:if>>배송대기</option>
										<option value="5" <c:if test="${info.order_state_number == 5 }">selected</c:if>>배송중</option>
										<option value="6" <c:if test="${info.order_state_number == 6 }">selected</c:if>>배송완료</option>
										<option value="7" <c:if test="${info.order_state_number == 7 }">selected</c:if>>주문확정</option>
										<option value="8" <c:if test="${info.order_state_number == 8 }">selected</c:if>>주문취소</option>
										<option value="9" <c:if test="${info.order_state_number == 9 }">selected</c:if>>교환요청</option>
										<option value="10" <c:if test="${info.order_state_number == 10 }">selected</c:if>>환불요청</option>
										<option value="11" <c:if test="${info.order_state_number == 11}">selected</c:if>>환불완료</option>
									</select>
								</div>
							</div>
							<hr/>
							<h4>운송장 등록</h4><hr/>								
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">택배키</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="t_key" id="t_key" value="${info.t_key }" disabled="disabled">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">운송장번호</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" name="t_invoice" id="t_invoice" value="${info.t_invoice }" disabled="disabled">
								</div>
							</div>
							<input class="btn btn-primary btn-sm" type='button' value='활성화' onclick='shippingActive()' />
									<input class="btn btn-primary btn-sm" type='button' value='비활성화' onclick='shippingDisabled()' />&nbsp;&nbsp;&nbsp; 
									<span><h6>운송장 등록시 활성화 버튼을 눌러 정보를 입력해주세요</h6></span>
									<script type="text/javascript">
									function shippingActive()  {
										  const target = document.getElementById('t_key');
										  const target1 = document.getElementById('t_invoice');
										  target.disabled = false;
										  target1.disabled = false;
										}

										function shippingDisabled()  {
										  const target = document.getElementById('t_key');
										  const target1 = document.getElementById('t_invoice');
										  target.disabled = true;
										  target1.disabled = true;
										}

									</script>
							<br/><br/><br/>
							<div align="center">
								<button type="submit" class="btn btn-primary">수정</button>
								<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/seller/mypage/order'">
								<!-- 나중에 수정하기 -->
									목록보기
								</button>
							</div>
						</fieldset>
					</form>			
				</div>
			</div>
		</div>
		<br/><br/><br/>
		
		<!-- footer -->
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/footer.jsp"></jsp:include>
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