<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>판매자 등록 상품 수정</title>

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


</head>
<body>
<div style="overflow: hidden;" class="container">
		<header>
		<div class="container" style="border-bottom: 1px solid rgba(0, 0, 0, .1);">
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
							<a href="/member/login2">Login</a> 
							<a href="#" class="fa fa-google"></a> 
							<a href="#" class="fa fa-facebook"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
         <span style="margin-left: 70px;">
         </span> <span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
            	<h3>${mbr.mbr_name }</h3>
            	<h3 style="position: relative; top: 15px;">${mbr.mbr_id }</h3>
         </span>
         <span style="margin-left: 22px; position: relative; bottom: 10px;"> <a href="/seller/mypage/myinfo">정보수정</a></span> 
         <span style="margin-left: 480px;" align="center">
            <h2 style="position: relative; top: 5px;">새주문</h2>
            <h4 style="position: relative; top: 15px;">2건</h4>
         </span>
      </div>
		
		<hr style="margin: 15px 15px 24px 15px;">

		<div class="container">
			<div class="row">
				<div class="col-md-2 contact-info" align="center">
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
					
				<!-- 등록한 상품 리스트	 -->
			<div class="col-md-10 contact-info" style="border-left: 1px solid rgba(0,0,0,.1) ;">
					<h3 >
					<strong>상품 정보 수정</strong>
					</h3><hr>
					<form id="updatePrd" action="/seller/mypage/prdct/{prdct_id}" method="PUT">
						<input type="hidden" id="prdct_id" value="${pdvo.prdct_id}">
						<input type="hidden" id="board_id" value="${bvo.board_name}">
						<input type="hidden" id="board_type_number" value="${bvo.board_type_number}">
						<input type="hidden" id="board_date" value="${bvo.board_date}">
						<input type="hidden" id="board_like" value="${bvo.board_like}">
						<input type="hidden" id="board_hit" value="${bvo.board_hit}">
						
						<fieldset>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">상품명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="상품명을 입력해주세요" id="prdct_name" value="${pdvo.prdct_name}">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">카테고리</label>
								<div class="col-sm-10">
									<select class="form-control">
										<option value="0">아우터-코트</option>
										<option value="1">아우터-자켓</option>
										<option value="2">아우터-점퍼/무스탕</option>
										<option value="3">아우터-가디건</option>
										<option value="4">아우터-패딩</option>
										<option value="5">상의-티셔츠</option>
										<option value="6">상의-블라우스/셔츠</option>
										<option value="7">상의-니트/스웨터</option>
										<option value="8">상의-후드티</option>
										<option value="9">상의-맨투맨</option>
										<option value="10">상의-슬리브리스</option>
										<option value="11">하의-데님</option>
										<option value="12">하의-코튼</option>
										<option value="13">하의-숏</option>
										<option value="14">하의-슬랙스</option>
										<option value="15">하의-트레이닝/조거</option>
										<option value="16">하의-레깅스</option>
										<option value="17">하의-스커트</option>
										<option value="18">드레스-미니</option>
										<option value="19">드레스-미디</option>
										<option value="20">드레스-맥시</option>
										<option value="21">드레스-오버롤</option>
										<option value="22">가방-백팩</option>
										<option value="23">가방-메신저/크로스</option>
										<option value="24">가방-숄더/토트</option>
										<option value="25">가방-에코백</option>
										<option value="26">가방-클러치</option>
										<option value="27">신발-구두</option>
										<option value="28">신발-부츠</option>
										<option value="29">신발-샌들</option>
										<option value="30">신발-슬리퍼</option>
										<option value="31">신발-스니커즈</option>
										<option value="32">ETC-가방</option>
										<option value="33">ETC-모자</option>
										<option value="34">ETC-악세서리</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">색상</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="ex) BLOWN, DARK, NAVY" value="${pvo.prdct_color}">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">사이즈</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="ex) XL (혹은) 105" value="${pvo.prdct_size}">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">가격</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" placeholder="가격을 입력해주세요" id="prdct_price" value="${pdvo.prdct_price}">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="20" placeholder="해당 상품에 대한 설명을 입력해주세요" value="${bvo.board_content }"></textarea>
									<input type="file" class="form-control-file">
									<small class="form-text text-muted">jpg, png, gif의 사진파일만 적용됩니다.</small>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">교환/반품</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="주소를 입력해주세요" value="${svo.shipping_address}">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">공급량</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" placeholder="공급량을 입력해주세요" value="${pvo.prdct_stock}">
								</div>
							</div><br/><br/>
							<div align="center">
								<button type="submit" class="btn btn-primary">상품수정</button>
								<button type="button" class="btn btn-primary">
									<a class="a-delete" href="/seller/mypage/prdct/{prdct_id}/delete" style="color: white;">상품삭제</a>
								</button>
							</div>
						</fieldset>
					</form>			
				</div>
			</div>
		</div>
		<br/><br/><br/>
		<!-- footer -->
		<footer>
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>회사소개</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>제휴문의</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>채용정보</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>고객센터</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>이용약관</h5></a>
							</div>
						</div>
						<div class="col-md-2 footer_widget">
							<div class="inner">
								<a href="#"><h5>개인정보처리</h5></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div class="copyright-txt">Copyright© 2021 Branches. All Rights Reserved.</div>
						</div>
						<div class="col-lg-6 text-right">
							<div class="footer-nav">
								<a href="/member/main">Home</a> <a href="#">Q&A</a> <a href="#">Notice</a> <a href="#">Magazine</a> <a href="#">Blog</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</footer>
		<div class="container">
			<small style="color: black;"> <strong>상호명 :</strong> (주)브랜치스 | <strong>소재지 :</strong> 서울특별시 00구 00로00길 00 00빌딩 0층 | <strong>팩스 :</strong>
				000-0000-0000 |<strong>사업자등록번호 :</strong> 000-00-000000 | <strong>통신판매업신고 :</strong> 0000-서울종로-00000 |
			</small> <br /> <small style="color: black;"><strong>고객센터</strong> 0000-0000 | 평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무) | <strong>이메일</strong>
				admin@branches.co.kr | <strong>개인정보책임자</strong> 000 | <strong>호스팅서비스</strong> (주)00000 | </small>
		</div>
		<br /> <br />
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
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#updatePrd").submit(function(event){
		
		event.preventDefault();
		
		var prdct_id = $("#prdct_id").val();
        var prdct_name = $("#prdct_name").val();
        var prdct_price = $("#prdct_price").val();
        
        console.log(prdct_id);
        console.log($(this).attr("action"));
        
        var form = {
        		prdct_id: prdct_id,
        		prdct_name: prdct_name,
        		prdct_price: prdct_price,

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
					$(location).attr('href', '${pageContext.request.contextPath}/seller/mypage/prdct')				      	       
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
			$(document).ready(function() {
				$('.a-delete').click(function(event) {
					// 이벤트를 취소할 때 동작을 멈춘다.
					event.preventDefault();
					console.log("ajax 호출전");

					// <a>의 parent(<td>)의 parent 즉, <tr>를 지칭한다.(클로저)
					/*
						어떻게 제이쿼리는 this가 <a>인 것을 알고있을까?
						: a 태그내 .a-delete 클릭 이벤트가 발생 되었으므로!
						: $('.a-delete').click(function(event)
					 */
					var deObj = $(this).parent();

					$.ajax({
						// AJAX의 타입(삭제)
						type : 'DELETE',

						// <a>의(this) 속성(href)을 가져온다.(attr)
						url : $(this).attr("href"),

						// 캐시를 false 설정하여 페이지가 새로 고쳐질때
						// 데이터를 남기지 않는다(?)
						cache : false,

						success : function(result) {
							console.log(result);
							if (result == "SUCCESS") {
								if (confirm("정말 삭제하시겠습니까??") == true) { //확인
									// trObj 변수를 삭제한다.(게시글 삭제)
									$(deObj).remove();
									console.log("REMOVED!")
									$(location).attr('href', '${pageContext.request.contextPath}/seller/mypage/prdct')
								} else { //취소
									return;
								}
							}
						},
						error : function(e) {
							console.log(e);
						}
					})
				});
			});
		</script>

	</div>
</body>
</html>