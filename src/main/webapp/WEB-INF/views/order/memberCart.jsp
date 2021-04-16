<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Cart List</title>

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">

$(document)
	.ready(
		//장바구니 목록 불러오기
		function() {
			//배열 선언
			var data = JSON.parse(sessionStorage.getItem("cartList"));
			for (var i =0;i<data.length;i++){
				console.log(data[i]);
			}
			var html = "";
			for(var i = 0; i < data.length; i++) {
							
				html += "<tr id='tr"+i+"'>"
				+ "<td scope='col'><input onclick='summary()' id='ck"
				+ i
				+ "' type='checkbox' name='prdct_id' value='"
				+ data[i].prdct_id
				+ "'></input></td>"
				+ "<td scope='col' class='cart-pic first-row'> <a href='${pageContext.request.contextPath}/prdct/"+data[i].prdct_id+"'> "+data[i].prdct_thumbnail+" </a></td> "
				+ "<td scope='col' class='cart-title first-row'>"
				+ "<h5>"
				+ "<a href='${pageContext.request.contextPath}/prdct/"+data[i].prdct_id+"' style='color:#000000'>"
				+ data[i].prdct_name
				+ "</h5>"
				+"<br /> <div style='color:#000000'>"+data[i].order_color+"/"+data[i].order_size
				+ "</div></a>"
				+ "</td>"
				+ "<td scope='col' class='p-price first-row' style='color:#000000'>"
				+ "<input style='border:none; text-align:right; ' type='text' id='a"+i+"' value='"+data[i].prdct_price+"' readonly size='7px' >"
				+ "원</td>"
				+ "<td scope='col' class='qua-col first-row'>"
				+ "	<div class='quantity'> <div class='pro-qty'> <span class='dec qtybtn' onclick='total"
				+ i
				+ "(-1)'>-</span><br /><input style='width:40px; text-align:center;' name='order_amount' type='number' id='b"
				+ i
				+ "' value='"+data[i].order_amount+"'><br/><span class='inc qtybtn' onclick='total"
				+ i
				+ "(1)'>+</span> </div> </div>"
				+ "</td> <td scope='col' class='total-price first-row' style='color:#000000'>"
				+ "<input style='border:none; text-align:right;' type='text' id='sum"
				+ i
				+ "' value='' readonly size='7px' name='sum' >원</td>"
				+ "<td scope='col' class='close-td first-row'><i onclick='cartDelete("
				+ i
				+ ")' >삭제<input type='hidden' name='prdct_name' value='"+data[i].prdct_name+"' ><input type='hidden' name='order_size' value='"+data[i].order_size+"' ><input type='hidden' name='order_color' value='"+data[i].order_color+"' > </td>"
				+ "</tr>"
				
				// 상품 별 합 계산() ready
				html += "<script DEFER>"
						+ "$(document).ready(function total"
						+ i
						+ "()"
						+ "{  var num1 = document.getElementById('a"
						+ i
						+ "');"
						+ "var num1s = num1.value; "
						+ "var num1b = parseInt(num1s); var num2 = document.getElementById('b"
						+ i
						+ "'); "
						+ "var num2s = num2.value; var num2b = parseInt(num2s) ;"
						+ "var num3t; var ops = 'mul'; "
						+ " switch (ops) { "
						+ " case 'plus': num3t = num1b + num2b; document.getElementById('sum"
						+ i
						+ "').value = num3t; break;"
						+ "case 'mul': num3t = num1b * num2b; document.getElementById('sum"
						+ i
						+ "').value = num3t; break; } }); "
						+ "</script"+">"
				// 상품 별 합 계산()		
				html += "<script DEFER> function total"
						+ i
						+ "(v)"
						+ "{ var num1 = document.getElementById('a"
						+ i
						+ "');"
						+ "var num1s = num1.value; "
						+ "var num1b = parseInt(num1s); var num2 = document.getElementById('b"
						+ i
						+ "'); "
						+ "var num2s = num2.value; var num2b = parseInt(num2s) + v;"
						+ "var num3t; var ops = 'mul'; "
						+ " switch (ops) { "
						+ " case 'plus': num3t = num1b + num2b; document.getElementById('sum"
						+ i
						+ "').value = num3t; break;"
						+ "case 'mul': num3t = num1b * num2b; document.getElementById('sum"
						+ i
						+ "').value = num3t;  break; } summary() }; "
						+ "</script"+">"

			}
			$("#getCart").append(html);
			
		});
// 전체 선택
$('#allCk').click(function() {
	var checked = $('#allCk').is(':checked');
	if (checked)
		$('input:checkbox').prop('checked', true);
	if (!checked)
		$('input:checkbox').prop('checked', false);
	summary();
});
// 해당 상품 삭제
function cartDelete(i) {
	var tr = '#tr' + i;
	$(tr).remove();
	cartList = JSON.parse(sessionStorage.getItem('cartList'));
	cartList.splice(i - 1, 1);
	sessionStorage.setItem('cartList', JSON.stringify(cartList));
	summary();
}
// 카트 총 합 계산
function summary() {
	var sum = 0;
	var count = this.form.prdct_id.length;
	for (var i = 0; i < count; i++) {
		if (this.form.prdct_id[i].checked == true) {
			sum += parseInt(this.form.sum[i].value);
			console.log(sum)
			console.log(typeof(sum))
		}
	}
	$('.total').html(sum + '원');
}
// 전체 카트 삭제
function allCartDelete() {
	$('#getCart').remove();
	var cartList = new Array();
	sessionStorage.setItem('cartList', JSON.stringify(cartList));
	summary();
}
// 결제 페이지 이동
function buy() {
	var order = new Array();
	var count = this.form.prdct_id.length;
	for (var i = 1; i < count; i++) {
		if (this.form.prdct_id[i].checked == true) {
			var prdct = new Object();
			prdct.prdct_id = this.form.prdct_id[i].value;
			prdct.order_amount = parseInt(this.form.order_amount[i].value);
			prdct.order_size = this.form.order_size[i].value;
			prdct.order_color = this.form.order_color[i].value;
			prdct.prdct_name = this.form.prdct_name[i].value;
			prdct.sum = parseInt(this.form.sum[i].value);
			console.log(prdct);
			//prdct.prdct_thumbnail = this.form.prdct_thumbnail[i].value;
			console.log(prdct);
			order.push(prdct);
		}
	}
	sessionStorage.setItem("order", JSON.stringify(order));
	window.location.assign("/order/cart/orderInput");
}
</script>
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
		<!-- 장바구니	 -->
		<form id="cart" name="form" method="post" action="${pageContext.request.contextPath}/order/cart/orderInput">
		
		<div class="container" style="text-align: center;">
				<br />
				<h3>Cart List</h3>
				<br />
				<table class="table cart_table" style="width:100%">
					<colgroup >
						<col width="10%">
						<col width="20%">
						<col width="30%">
						<col width="10%">
						<col width="10%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr style="text-align: center;">
							<th scope="col"><input type="checkbox" id="allCk" >
							<th scope="col">이미지</th>
							<th scope="col">상품명(옵션)</th>
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">주문금액<br></th>
							<th><i  onclick="allCartDelete()"
											style='cursor: pointer'>삭제</i></th>
						</tr>
					</thead>
					<tbody id="getCart">
						<input type="hidden" name="prdct_id" />
						<input type="hidden" name="order_amount" />
						<input type="hidden" name="order_color" />
						<input type="hidden" name="order_size" />
						<input type='hidden' name="sum" />
						<input type="hidden" name="prdct_name" />
						<input type="hidden" name="prdct_thumbnail" />
						
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

			<button type="submit" class="btn btn-primary" onclick="buy()">주문하기</button>
			<br /> <br />
	</div>
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
		</footer>
		<div class="container-fluid">
			<small style="color: black;"> <strong>상호명 :</strong> (주)브랜치스 <strong>소재지 :</strong> 서울특별시 00구 00로00길 00 00빌딩 0층 <strong>팩스 :</strong>
				000-0000-0000 <strong>사업자등록번호 :</strong> 000-00-000000 <strong>통신판매업신고 :</strong> 0000-서울종로-00000
			</small> <br /> <small style="color: black;"><strong>고객센터</strong> 0000-0000 평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무) <strong>이메일</strong>
				customer@29cm.co.kr <strong>대표이사</strong> 000 <strong>개인정보책임자</strong> 000 <strong>호스팅서비스</strong> (주)00000</small>
		</div>
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