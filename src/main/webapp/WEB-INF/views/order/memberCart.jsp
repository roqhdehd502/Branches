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
	//삭제
	function removeSelected() {
		$("input:checkbox[name=select-product]").each(function() {
			if($(this).is(":checked")) {
				var prdct_id = $(this).parent().parent().parent().attr("id");
				remove(prdct_id);
			}
		})
	}
	
	function remove(prdct_id) {
		var data = {
				prdct_id : prdct_id
		}
		$.ajax({
			type : "DELETE",
			url : "/cart",
			data : JSON.stringify(data),
			contentType : "application/json",
			cache : false,
			beforeSend : function(xhr){
  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				if(result == "SUCCESS") {
					$("#" + prdct_id).remove();
					getTotal();
				}
			},
			error : function(e) {
				console.log(e);
				alert("에러가 발생했습니다.");
			}
		});
	}
	//
	//선택된 상품 금액 총 합 구하기
	function getTotal() {
		var totalPrice = 0
		$("input:checkbox[name=select-product]").each(function() {
			if($(this).is(":checked")) {
				var prdct_id = $(this).parent().parent().parent().attr("id");
				var prdct_price = $("#" + prdct_id + " .prdct_price").text();
				var order_amount = $("#" + prdct_id + " .order_amount").val();
				totalPrice += prdct_price * order_amount;
			}
		})
		$("#total-price").html(totalPrice);
	}
	//
	//주문하기
	function buy() {
		console.log("buy");
		
		var prdct_id_arr = [];
		var order_amount_arr = [];
		var prdct_price_arr = [];
		var prdct_name_arr = [];
		
		$("input:checkbox[name=select-product]").each(function() {
			if($(this).is(":checked")) {
	            var prdct_id = $(this).parent().parent().parent().attr("id");
	            var order_amount = $("#" + prdct_id + " .order_amount").val();
	            var prdct_price = $("#" + prdct_id + " .prdct_price").text();
	            var prdct_name = $("#" + prdct_id + " .prdct_name").text();
	            
	            prdct_id_arr.push(prdct_id);
	            order_amount_arr.push(order_amount);
	            prdct_price_arr.push(prdct_price);
	            prdct_name_arr.push(prdct_name);
			};
		});
		if(!prdct_id_arr.length) {
			return alert("선택된 상품이 없습니다.");
		}
		var form = document.createElement("form");
		form.method = "get";
		form.action = "/order";
		
		var inputId = document.createElement("input");
		inputId.setAttribute("name", "prdct_id");
		inputId.setAttribute("value", prdct_id_arr);
		
		var inputQuantity = document.createElement("input");
		inputQuantity.setAttribute("name", "order_amount");
		inputQuantity.setAttribute("value", order_amount_arr);
		
		var inputPrice = document.createElement("input");
		inputPrice.setAttribute("name", "prdct_price");
		inputPrice.setAttribute("value", prdct_price_arr);
		
		var inputName = document.createElement("input");
		inputName.setAttribute("name", "prdct_name");
		inputName.setAttribute("value", prdct_name_arr);
		
		form.appendChild(inputId);
		form.appendChild(inputQuantity);
		form.appendChild(inputPrice);
		form.appendChild(inputName);
		
		document.body.appendChild(form);
		form.submit();
	}
	//
	$(document).ready(function() {
		//상품 금액 표시
		$(".prdct").each(function() {
			var prdct_id = $(this).attr("id");
			var prdct_price = $("#" + prdct_id + " .prdct_price").text();
			var order_amount = $("#" + prdct_id + " .order_amount").val();
			var mulPrice = prdct_price * order_amount;
			$("#" + prdct_id + " .mul-price").html(mulPrice);
		});
		//
		//상품 갯수 변경 금액 표시
		$(".order_amount").change(function () {
			var prdct_id = $(this).parent().parent().parent().parent().attr("id");
			var prdct_price = $("#" + prdct_id + " .prdct_price").text();
			var order_amount = $("#" + prdct_id + " .order_amount").val();
			var mulPrice = prdct_price * order_amount;
			$("#" + prdct_id + " .mul-price").html(mulPrice);
		})
		//
		//전체 선택
		$("#select-whole-product").change(function() {
			if($("#select-whole-product").is(":checked")) {
				$(".select-product").prop("checked", true);
				getTotal();
			} else {
				$(".select-product").prop("checked", false);
				getTotal();
			}
		});
		//
		//선택시 전체 가격 변경
		$(".select-product").change(function() {
			
			$("input:checkbox[name=select-product]").each(function() {
				if(!$(this).is(":checked")) {
					$("#select-whole-product").prop("checked", false);
				}
			});
			getTotal();
		});
		//개수 변경시 전체 가격 변경
		$(".order_amount").change(function() {
			getTotal();
		})
		//
		$(".select-product").prop("checked", true);
		getTotal();
		
		if($("tbody").children("tr").length == 1) {
			var content = ""
			content += "<tr>";
			content += "<td colspan='7'>";
			content += "<p class='cart-empty'>장바구니가 비어있습니다.</p";
			content += "</td>";
			content += "</tr>";
			$("tbody").children("tr").before(content);
		}
	})
	
</script>
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<header style="padding-bottom: 10px;">
			<div class="container">
				<div class="row">
					<div class="col-6 col-sm-3 logo-column">
						<a href="index.html" class="logo"> <img src="/img/branches_text.png" alt="logo">
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
				<ul style="padding: 10px;">
					<li class="current-menu-item has-child"><a href="index.html">OUTER</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">TOP</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">BOTTOM</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">SHOES</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">ACC</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">BRAND</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">SALE</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li><a href="index.html">|</a></li>
					<li class="current-menu-item has-child"><a href="index.html">NOTICE</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html">MAGAZINE</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
					<li class="current-menu-item has-child"><a href="index.html" style="margin-right: 38px;">Q&A</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home - 01</a></li>
							<li><a href="index-2.html">Home - 02</a></li>
							<li><a href="index-3.html">Home - 03</a></li>
						</ul></li>
				</ul>
			</nav>
		</header>
		<!-- 장바구니	 -->
		<form id="cart" name="form" method="post" action="${pageContext.request.contextPath}/order/cart/orderInput">
		
		<div class="container" style="text-align: center;">

				<h3>Cart List</h3>

				<table class="table cart_table" style="width:100%">
					<colgroup >
						<col width="10%">
						<col width="20%">
						<col width="30%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr style="text-align: center;">
							<th scope="col"><input type="checkbox" id="select-whole-product"/>
							<th scope="col">이미지</th>
							<th scope="col">상품명(옵션)</th>
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">주문금액<br></th>
							<th scope="col">&nbsp;&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="30%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<c:forEach items="${cart}" var="cart">
							<tr id="${cart.key.prdct_id}" class="product">
							
								<td><input type="checkbox" class="select-product" name="select-product" value="${cart.key.prdct_price}"></td>
								<td>
									<div class="connect_img">
										<img class="product-img" src="/resources/static/ej/view.staff_605be555e83ad.jpg">
										<!-- 사진불러오기 -->
									</div>
								</td>
								<td>
									<div class="article_info connect_info">
										 <p class="prdct_name" id="prdct_name">${cart.key.prdct_name}</p>
										 <p class="prdct_color" id="order_color">${cart.key.order_color}</p>
										<p class="order_size" id="order_size">${cart.key.order_size}</p> 
									</div>
								</td>
							<td class="td_price">${cart.key.prdct_price}</td> 
								<td>
									<!-- 수량 -->
									<div class="n-input-amount">
										<div class="form-group">
										 <input type="number" id="order_amount" class="order_amount" min="1" value="${cart.value }" />
										</div>
									</div>
								</td>
								<td><p class="mul-price"></p>
									<br></td>
								<td><button class="btn btn-secondary delete-btn" onclick="remove(${cart.key.prdct_id})">삭제</button></td>

							</tr>
							</c:forEach>
							<tr class="gift-division">
								<td colspan="3">
									<button class="btn btn-secondary delete-btn-selected" onclick="removeSelected()">선택삭제</button>
								</td>
								<td>
								<span>총 상품가격</span> 
								<span id="total-price"></span>
								</td>
							</tr>
						
					</tbody>
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