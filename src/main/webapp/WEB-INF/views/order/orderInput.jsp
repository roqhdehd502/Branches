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
</head>
<script type="text/javascript">
$(document)
.ready(
		//상품 가져오기 
		function getOrder() {
			var buy = JSON.parse(sessionStorage.getItem("buy"));
			var html = "";
			for (var i = 0; i < buy.length; i++) {
				html += "<li class='fw-normal'>"
						+ "<a href='${pageContext.request.contextPath}/prdct/"+buy[i].prdct_id+"'> "+buy[i].prdct_thumbnail+" </a>"
						+ buy[i].prdct_name
						+ "&nbsp x &nbsp "
						+ buy[i].order_amount
						+ "<input type='hidden' name='order_amount' value='"+buy[i].order_amount+"'>"
						+ " <span>"
						+ buy[i].sum
						+ "원</span> <br> "+buy[i].order_color+" / "+buy[i].order_size
						+ "<input type='hidden' name='goodsSum' value='"+ buy[i].sum+"'><input type='hidden' name='goodsName' value='"+ buy[i].name+"'>"
						+"<input type='hidden' name='psize' value='"+ buy[i].order_size+"'>"
						+"<input type='hidden' name='pcolor' value='"+ buy[i].order_color+"'>"
						+ "<input type='hidden' name='board_id' value='"+ buy[i].prdct_id+"'></li>"
			}
			html += "<li class='total-price'>총 상품 금액 <span id='goodsTotal1'></span><input type='hidden' id='goodsTotal'></li>"
					+ "<li class='fw-normal'>배송비  <span id='deliveryPay1'></span><input type='hidden' id='deliveryPay'></li>"
					+ "<li class='fw-normal'>포인트 사용  <span id='payPoint1'></span><input type='hidden' id='payPoint' name='usepoint'></li>"
					+ "<li class='total-price'>최종 결제 금액 <span id='lastTotal1'></span><input type='hidden' id='lastTotal' name='payprice'></li>"
					+ "<li class='fw-normal'>적립 포인트 <span id='earningPoint1'></span><input type='hidden' id='earningPoint' name='earningpoint'></li>"
			$('#pay').append(html);
			// 총 상품 금액 계산 
			var sumCount = this.form.goodsSum.length
			var total = 0;
			for (var i = 1; i < sumCount; i++) {
				total += parseInt(this.form.goodsSum[i].value);
			}
			$("#goodsTotal1").text(total + "원");
			$("#goodsTotal").val(total);
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

</script>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>
		
		<form>
		<br/>
			<br/>
			<fieldset>
			<table class="table cart_table" style="width:100%">
					<colgroup >
						<col width="20%">
						<col width="30%">
						<col width="15%">
						<col width="15%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr style="text-align: center;">
							<th scope="col">이미지</th>
							<th scope="col">상품명(옵션)</th>
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">주문금액<br></th>
						</tr>
					</thead>
					<tbody id="getOrder">
					
					</tbody>
					<tfoot>
						
								<tr class="gift-division">
								<td>
								</td>
								<td colspan="4">
									
								</td>
								<td colspan="2">
								<span class="cart-total">총 상품가격<span class="total">0원</span></span> 
								<span id="total-price"></span>
								</td>
							</tr>
						
					</tfoot>
				</table>
				<legend style="text-align: center;">주문 정보 입력</legend>
				<br/>
				
				<!-- 주문자 이름 -->
				<div class="form-group row">
					<label for="orderName" class="col-sm-2 col-form-label">Oder Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="orderName" placeholder="주문자의 이름을 입력하세요.">
					</div>
				</div>
				
				<!-- 주문자 연락처 -->
				<div class="form-group row">
					<label for="phoneNumber1" class="col-sm-2 col-form-label">Phone Number</label>
					<div class="form-group row col-sm-10">
						<select class="form-control col-sm-2" id="phoneNumber1" style="margin-left: 15px">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>&nbsp;-&nbsp; <input type="text" class="form-control col-sm-2" id="phoneNumber2">&nbsp;-&nbsp; <input type="text"
							class="form-control col-sm-2" id="phoneNumber3">
					</div>
				</div>
				
				<!-- 주문자 이메일 -->
				<div class="form-group row">
					<label for="orderEmail" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="orderEmail" placeholder="email@example.com">
					</div>
				</div>
				
				<!-- 배송 주소 -->
				<div class="form-group row">
					<label for="shippingAd" class="col-sm-2 col-form-label">Shipping Address</label>
					<div class="form-group row col-sm-10" style="margin-left: 1px">
						<input type="text" class="form-control col-sm-4" id="shippingAd" value="" readonly="">&nbsp; <a class="btn btn-primary" onclick="#">주소
							찾기</a> <input type="text" class="form-control" id="shippingAd" value="" readonly="" style="margin-bottom: 3px"> <input type="text"
							class="form-control" id="shippingAd" placeholder="상세 주소를 입력해주세요">
					</div>
				</div>
				
				<!-- 배송 메모 -->
				<div class="form-group row">
					<label for="shipMemo" class="col-sm-2 col-form-label">Shipping Memo</label>
					<div class="form-group col-sm-10">
						<select class="form-control" id="shipMemo">
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
				<div style="text-align: center;">
					<button type="submit" class="btn btn-primary"><a class="order-bnt" onclick="location.href='${pageContext.request.contextPath}/ej/nmcheck' ">결제하기</a></button>
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
</body>
</html>