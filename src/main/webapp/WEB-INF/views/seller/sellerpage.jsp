<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>판매자 마이페이지</title>

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
<style type="text/css">
/* Style the tab */
.tab {
  float: left;
  border: 2px solid #ccc;
  background-color: black;
  width: 20%;
  height: 470px;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: gray;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: gray;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 2px solid #ccc;
  width: 80%;
  border-left: none;
  height: 470px;
}
</style>


</head>
<body>
<div style="overflow: hidden;" class="container">
	<header>
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>
	<div class="container">
         <span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
            <h3>${mbr.mbr_id }</h3>
            <h3 style="position: relative; top: 15px;">${mbr.mbr_name }</h3>
         </span>
         <span style="margin-left: 22px; position: relative; bottom: 10px;"> <a href="/seller/mypage/myinfo/${mbr.mbr_id }">정보수정</a></span> 
           <span style="margin-left: 300px;" align="center">
            <h2 style="position: relative; top: 5px;">새 주문</h2>
            <h4 style="position: relative; top: 15px;">${newOrder.order_state_number } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">취소</h2>
            <h4 style="position: relative; top: 15px;">${cancel.order_state_number } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">교환</h2>
            <h4 style="position: relative; top: 15px;">${change.order_state_number } 건</h4>
         </span>
         <span style="margin-left: 80px;" align="center">
            <h2 style="position: relative; top: 5px;">환불</h2>
            <h4 style="position: relative; top: 15px;">${refund.order_state_number } 건</h4>
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
	                    <h5><a href="/seller/mypage/prdct_register">등록</a></h5>
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

				<span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 922px;" >
					<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px;">
						<strong style="margin: 10px;">주문 내역 미리보기</strong>
					</h3>
					<table class="table">
						<thead style="text-align: center;">
							<tr>
								<th><h5>상품정보</h5></th>
								<th><h5>주문일</h5></th>
								<th><h5>주문번호</h5></th>
								<th><h5>금액</h5></th>
								<th><h5>수량</h5></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${prdct }" var="prdct" begin="0" end="4" varStatus="status">
							<tr style="text-align: center;">
								<td>
									<h6>${prdct.prdct_id}</h6>
									<h6>${prdct.mbr_id }</h6>
									<h6>${prdct.prdct_name }</h6>
									<h6>${prdct.order_size }</h6>
									<h6>${prdct.order_color }</h6>
								</td>
								<td><h5 style="position: relative; top: 34px;">${prdct.order_date }</h5></td>
								<td><h5 style="position: relative; top: 34px;">${prdct.order_number}</h5></td>
								<td><h5 style="position: relative; top: 34px; text-align: center;">${prdct.order_price }₩</h5></td>
								<td><h5 style="position: relative; top: 34px; text-align: center;">${prdct.order_amount }</h5></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
			
					<hr>
					<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px; border-bottom: 1px solid rgba(0, 0, 0, .1);">
						<strong style="margin: 20px;">${mbr.mbr_id}의 통계</strong>
					</h3>

					<div class="tab">
						<button class="tablinks" onclick="openCity(event, 'prdct')" id="defaultOpen"><h4 style="color: white;">상품</h4></button>
						<button class="tablinks" onclick="openCity(event, 'order')"><h4 style="color: white;">주문</h4></button>
						<button class="tablinks" onclick="openCity(event, 'sale')"><h4 style="color: white;">판매량</h4></button>
						<button class="tablinks" onclick="openCity(event, 'preference')"><h4 style="color: white;">선호도</h4></button>
					</div>

					<div id="prdct" class="tabcontent">
						<h3 style="margin-top: 16px;">상품</h3>
						<jsp:include page="/WEB-INF/views/chart/prdorderChart.jsp"></jsp:include>
					</div>
					
					<div id="order" class="tabcontent">
						<h3 style="margin-top: 16px;">주문</h3>
						<jsp:include page="/WEB-INF/views/chart/OrderChart.jsp"></jsp:include>
					</div>

					<div id="sale" class="tabcontent">
						<h3 style="margin-top: 16px;">판매량</h3>
						<jsp:include page="/WEB-INF/views/chart/sellChart.jsp"></jsp:include>
					</div>

					<div id="preference" class="tabcontent">
						<h3 style="margin-top: 16px;">선호도</h3>
						<jsp:include page="/WEB-INF/views/chart/ageChart.jsp"></jsp:include>
					</div>
					
				</span>
			</div>
		</div><br/><br/><br/>
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

		<script type="text/javascript">
			function openCity(evt, cityName) {
				var i, tabcontent, tablinks;
				tabcontent = document.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}
				tablinks = document.getElementsByClassName("tablinks");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(
							" active", "");
				}
				document.getElementById(cityName).style.display = "block";
				evt.currentTarget.className += " active";
			}

			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
		</script>
	</div>
</body>
</html>