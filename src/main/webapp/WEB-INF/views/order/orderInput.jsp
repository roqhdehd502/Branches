<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Oder Input</title>

<!-- Required CSS files -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">
<link rel="stylesheet" href="/assets/css/owl.carousel.css">
<link rel="stylesheet" href="/assets/css/barfiller.css">
<link rel="stylesheet" href="/assets/css/animate.css">
<link rel="stylesheet" href="/assets/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="/assets/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/assets/css/slicknav.css">
<link rel="stylesheet" href="/assets/css/main.css">
<link rel="stylesheet" href="/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- 결제모듈 CDN -->
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>

</head>
<script type="text/javascript">
$(document)
	.ready(
		//상품 가져오기 
		function getOrder() {
			var buy = JSON.parse(sessionStorage.getItem("order"));
			console.log(buy);
			var html = "";
			for (var i = 0; i < buy.length; i++) {
				html += "<tr id='tr"+i+"' style='text-align: center;'>"	
						+ "<td scope='col'><a href='${pageContext.request.contextPath}/prdct/"+buy[i].prdct_id+"'> "+buy[i].prdct_thumbnail+" </a>"
						+ "</td>"
						+ "<td scope='col'>"+buy[i].prdct_name+""
						+ "<br/>"+buy[i].order_color+" / "+buy[i].order_size+""
						+ "</td>"
						+ "<td scope='col'>"+buy[i].order_amount+""
						+ "<input type='hidden' name='order_amount' value='"+buy[i].order_amount+"'>"
						+ "</td>"
						+ "<td scope='col'>"+buy[i].sum+""
						+ "원</td><br/>"
						+ "<input type='hidden' name='sum' value='"+ buy[i].sum+"'>"
						+ "<input type='hidden' name='prdct_name' value='"+ buy[i].prdct_name+"'>"
						+ "<input type='hidden' name='order_size' value='"+ buy[i].order_size+"'>"
						+ "<input type='hidden' name='order_color' value='"+ buy[i].order_color+"'>"
						+ "<input type='hidden' name='prdct_id' value='"+ buy[i].prdct_id+"'>"
						+ "</tr>"
			}
			
			$('#pay').append(html);
					
			// 총 상품 금액 계산 
			var sumCount = this.form.prdct_id.length;
			var total = 0;
			for (var i = 0; i < sumCount-1; i++) {
				
				total += parseInt(this.form.sum[i].value);
				console.log(typeof(total))
			} 
			
			console.log(total);
			$('#prdctPrice1').html(total + '원');
			$('#prdctPrice').val(total);
			// 배송비 계산
			if (total < 30000) {
				$("#deliveryPay1").text(2500 + "원")
				$("#deliveryPay").val(2500)
			} else {
				$("#deliveryPay1").text(0 + "원")
				$("#deliveryPay").val(0)
			}
			// 최초 포인트 설정
			$('#payPoint').val(0);
			$('#payPoint1').text(0 + "P");
			// 최종 결제 금액 계산
			lastTotal();
		}
);

// 전체 포인트 사용
function usePoint() {
	event.preventDefault();
	var prdctPrice = parseInt($("#prdctPrice").val());
	if("${point.sum}" > prdctPrice){
	    $("#point").val(prdctPrice);
	    $('#payPoint').val("-" + $("#point").val());
		$('#payPoint1').text("-" + $("#point").val() + "P");
		lastTotal();
	} else if("${point.sum}">999){
		$("#point").val("${point.sum}");
		$('#payPoint').val("-" + $("#point").val());
		$('#payPoint1').text("-" + $("#point").val() + "P");
		lastTotal();
	} else{
		alert("1000포인트 이상부터 사용가능합니다.");
	}
	
}

// 최종 결제 금액 계산
function lastTotal() {
	var lastTotal = 0;
	lastTotal = parseInt($("#prdctPrice").val())
			+ parseInt($("#payPoint").val())
			+ parseInt($("#deliveryPay").val());
	$("#lastTotal").val(lastTotal)
	$("#lastTotal1").text(lastTotal + "원")
	// 적립 포인트 계산
	var innerPoint = Math.floor(lastTotal * 0.01);
	$("#earningPoint1").text(innerPoint + "P");
	$("#earningPoint").val(innerPoint);
}

//결제 모듈 실행
function payNow(method) {
	event.preventDefault();
	if($("#point").val() <1000 && $("#point").val() >0 ){
		alert("1000포인트 이상부터 사용가능합니다.")
		return;
	}
	
	var name = "${member.mbr_name}";
	var order_mail = $("#order_mail").val();
	var shipping_tel =  $("#shipping_tel").val();
	var shipping_address = $("#shipping_address").val();
	//결제 정보
	var lastTotal = $("#lastTotal").val();
	var nameCount = this.form.prdct_name.length - 2;
	console.log(nameCount)
	var prdct_name = this.form.prdct_name[1].value;
	var order_price = $("#lastTotal").val();
	if (nameCount > 0) {
		prdct_name += " 외 " + nameCount + "개"
	}
BootPay.request({
	price: lastTotal, //실제 결제되는 가격
	application_id: "607d15825b2948002e07b945",
	name: prdct_name, //결제창에서 보여질 이름
	pg: 'inicis',
	method: method, //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
	show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
	user_info: {
		username: name,
		email: order_mail,
		addr: shipping_address,
		phone: shipping_tel
	},
	order_id: guid(), //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
	extra: {
	  
		theme: 'purple', // [ red, purple(기본), custom ]
		custom_background: '#00a086', // [ theme가 custom 일 때 background 색상 지정 가능 ]
		custom_font_color: '#ffffff' // [ theme가 custom 일 때 font color 색상 지정 가능 ]
	}
}).error(function (data) {
	//결제 진행시 에러가 발생하면 수행됩니다.
	console.log(data);
}).cancel(function (data) {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : '+data.message;
	alert(msg);
	console.log(data);
}).ready(function (data) {
	// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
	console.log(data);
}).confirm(function (data) {
	//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
	//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
	console.log(data);
	var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
	if (enable) {
		BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
	} else {
		BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
	}
}).close(function (data) {
    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
 
}).done(function (data) {
	//결제가 정상적으로 완료되면 수행됩니다
	
	console.log(form);
	document.form.submit();
	// 유효성 체크
	$.ajax({
		url : "${pageContext.request.contextPath}/order/orderInput/check/"+data.receipt_id,
		type : "post",
		success : function(verify) {
			if(verify.status=="200"){
				console.log(verify);
				//카트 초기화 
				var cartList = new Array();
				sessionStorage.setItem("cartList", JSON.stringify(cartList));
				
				var msg = '결제가 완료되었습니다.';
				msg += '영수증ID : ' + verify.data.receipt_id;
				msg += '상점 거래ID : ' + verify.data.order_number;
				msg += '결제 금액 : ' + verify.data.price;
				$("#paydate").val(verify.data.purchased_at)
				$("#receipt_id").val(verify.data.receipt_id);
				alert(msg);
				document.form.submit();
			}
			else{
				//유효성 체크 실피시 결제취소
				alert("결제가 정상적으로 진행되지 않았습니다. 결제를 취소합니다.");
				$.ajax({
					url : "/myPage/orderList/payCancel/"+data.receipt_id,
					type : "post",
					data :{
						name : $("#memberName").val(),
						reason : "개인사유"
						
					},
					success : function(data) {
						alert("정상적으로 취소되었습니다.");
						
					},
					error : function(request, status, error){
						
						
					}
				
				})
				
				
			}
			
		},
		error : function(request, status, error){
			
			//유효성 체크 실피시 결제취소
		
		$.ajax({
			url : "/myPage/orderList/payCancel/"+data.receipt_id,
		type : "post",
		data :{
			name : $("#memberName").val(),
			reason : "개인사유"
			
		},
		success : function(data) {
			alert("정상적으로 취소되었습니다.");
			
		},
		error : function(request, status, error){
			
			
		}
	
	})
	

			
		}
	
	})
	
	
});
}

// 초기화
function reset(){
	$('#deliveryname').val("");
	$('#deliveryaddress').val("");
	$('#deliverytel').val("");
}

// 포인트 값 체인지
$("#point").on("change keyup paste", function() {
	var val = $("#point").val();
	var valInt = parseInt($("#point").val());
	var goodsprice = $("#goodsprice").val();
	
	if(valInt>goodsprice){
		 alert("포인트 사용액이 상품금액보다 큽니다.");
	     $("#point").val('');
	     $('#payPoint').val('0');
		 $('#payPoint1').text('0P');
		lastTotal();
	}
	else if(val.replace(/[0-9]/g, "").length > 0) {
        alert("숫자만 입력해 주십시오.");
        $("#point").val('');
        $('#payPoint').val('0');
		 $('#payPoint1').text('0P');
		 lastTotal();
    } else if("${point.sum}"<1000){
		 alert("1000P 이상 부터 사용가능합니다.");
		 $("#point").val('');
		 $('#payPoint').val('0');
		 $('#payPoint1').text('0P');
		 lastTotal();
	} else if(valInt < 1 || valInt > "${point.sum}") {
		console.log(val)
        alert("1~${point.sum} 사이로 사용 가능합니다.");
        $("#point").val('');
        $('#payPoint').val('0');
		 $('#payPoint1').text('0P');
		 lastTotal();
    } else{
    	$('#payPoint').val("-" + $("#point").val());
		$('#payPoint1').text("-" + $("#point").val() + "P");
		lastTotal();
    }
})

// 고유값 생성
function guid() {
function s4() {
  return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
}
return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
}


//주소 검색 팝업
function goPopup() {
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("${pageContext.request.contextPath}/popup/jusoPopup.jsp", "pop",
			"width=570,height=420, scrollbars=yes, resizable=yes");
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
// 주소 콜백 
function jusoCallBack(roadFullAddr, zipNo) {
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
	$('#shipping_address').val("(" + zipNo + ")" + roadFullAddr);
}

</script>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<form name="form" action="${pageContext.request.contextPath}/order/orderInput/insert?${_csrf.parameterName}=${_csrf.token}" method="post">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>

			<br /> <br />
			<fieldset>
				<table class="table cart_table" style="width: 100%;">
					<colgroup>
						<col width="30%">
						<col width="40%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr style="text-align: center;">
							<th scope="col">이미지</th>
							<th scope="col">상품명(옵션)</th>
							<th scope="col">수량</th>
							<th scope="col">주문금액</th>
						</tr>
					</thead>
					<tbody id="pay">
						<input type="hidden" name="prdctSum">
						<input type="hidden" name="prdct_name">
						<input type="hidden" name="order_amount">
						<input type="hidden" name="prdct_id">
						<input type="hidden" name="receipt_id" id="receipt_id">
						<!-- <input type="hidden" name="order_date" id="order_date"> -->
						<input type="hidden" name="order_size">
						<input type="hidden" name="order_color">
					</tbody>
					<tfoot class="table table-borderless " style="text-align: right;  ">
						<tr>
							<td colspan="3"></td>
							<td>총 상품 금액 <span id="prdctPrice1"></span><input type="hidden" id="prdctPrice"></td>
						<tr>
							<td colspan="3"></td>
							<td>배송비 <span id="deliveryPay1"></span><input type="hidden" id="deliveryPay"></td>
						<tr>
							<td colspan="3"></td>
							<td>포인트 사용 <span id="payPoint1"></span><input type="hidden" id="payPoint" name="usepoint"></td>
						<tr>
							<td colspan="3"></td>
							<td class="total-price">최종 결제 금액 <span id="lastTotal1"></span><input type="hidden" id="lastTotal" name="order_price"></td>
						<tr>
							<td colspan="3"></td>
							<td>적립 포인트 <span id="earningPoint1"></span><input type="hidden" id="earningPoint" name="earningpoint"></td>
					</tfoot>
				</table>
				<legend style="text-align: center;">주문 정보 입력</legend>
				<br />

				<!-- 주문자 이름 -->
				<div class="form-group row">
					<label for="orderName" class="col-sm-2 col-form-label">Order Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="orderName" placeholder="주문자의 이름을 입력하세요.">
					</div>
				</div>

				<!-- 주문자 연락처 -->
				<div class="form-group row">
					<label for="shipping_tel" class="col-sm-2 col-form-label">Phone Number</label>
					<div class="col-sm-10">
					<input type="text" class="form-control" id="shipping_tel" name="shipping_tel" placeholder="배송받을 연락처를 입력하세요.(-제외)">
					</div>
				</div>
 
				<!-- 주문자 이메일 -->
				<div class="form-group row">
					<label for="order_mail" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="order_mail" name="order_mail" placeholder="email@example.com">
					</div>
				</div>

				<!-- 배송 주소 -->
				<div class="form-group row">
					<label for="shipping_address" class="col-sm-2 col-form-label">Shipping Address</label>
					<div class="form-group row col-sm-10" style="margin-left: 1px">
						<input type="text" class="form-control col-sm-8" id="shipping_address" name="shipping_address" style="margin-bottom: 3px"> <input
							type="button" class="form-control col-sm-2" onClick="goPopup();" value="주소찾기"> 
					</div>
				</div>

				<!-- 배송 메모 -->
				<div class="form-group row">
					<label for="shipping_memo" class="col-sm-2 col-form-label">Shipping Memo</label>
					<div class="form-group col-sm-10">
						<select class="form-control" id="shipping_memo">
							<option>배송 시 요청사항을 선택해주세요.</option>
							<option>부재 시 경비실에 맡겨주세요.</option>
							<option>부재 시 택배함에 넣어주세요.</option>
							<option>부재 시 집 앞에 놔주세요.</option>
							<option>파손의 위험이 있는 상품입니다.</option>
							<option value="etc">직접입력</option>
						</select>
						<!--   직접 입력 선택 시 나타나게
					      <textarea name="etc_textarea" class="form-control" style="" value="" maxlength="50" onkeyup="return textarea_maxlength(this)" placeholder="최대 50자까지 입력 가능합니다."></textarea> -->
					</div>
				</div>

				<div class="form-group row ">
					<label for="point" class="col-sm-2 col-form-label">Point</label>
					<div class="form-group col-sm-10">

						<input type="text" class="form-control" id="point" placeholder="1000포인트 이상부터 사용가능합니다.">
						<div class="col-sm-4 ">
							<button onclick="usePoint()">전액사용</button>
							사용 가능 포인트 ${point.sum}P
						</div>
					</div>
				</div>


				<div style="text-align: center;">
					<button type="submit" class="btn btn-primary" onclick="payNow('card')">결제하기</button>
				</div>
				<br /> <br />
			</fieldset>
		</form>
		
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
		</div>
</body>
</html>