<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>상품등록</title>
	
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
			<span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
				<h3>${mbr.mbr_name }</h3>
            	<h3 style="position: relative; top: 15px;">${mbr.mbr_id }</h3>
			</span>
			<span style="margin-left: 22px; position: relative; bottom: 10px;">
				<a href="/seller/mypage/myinfo">정보수정</a>
			</span>
			<span style="margin-left: 480px;" align="center">
				<h2 style="position: relative; top: 5px;">새주문</h2>
				<h4 style="position: relative; top: 15px;">2건</h4>
			</span>
		</div>

		<hr style="margin: 15px 15px 20px 15px;">

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
				
				<div class="col-md-10 contact-info" style="border-left: 1px solid rgba(0,0,0,.1) ;">
					<h3 >
					<strong>상품 등록</strong>
					</h3><hr>
					<form action="/seller/mypage/prdct" method="post" role="form" id="writeForm" enctype="multipart/form-data">
						<fieldset>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">상품명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="상품명을 입력해주세요" id="prdct_name">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">카테고리</label>
								<div class="col-sm-10">
									<select class="form-control" name="category">
										<c:forEach items="${cate }" var="cvo">
											<option value="${cvo.category_number }">${cvo.category_name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">색상</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="ex) BLOWN, DARK, NAVY" id="prdct_color">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">사이즈</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="ex) XL (혹은) 105" id="prdct_size">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">가격(원)</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" placeholder="가격을 입력해주세요" id="prdct_price">
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">내용</label>
								<div class="col-sm-10">
									<textarea name="board_content" id="board_content"></textarea>
									<script>
										//id가 description인 태그에 ckeditor를 적용시킴
										//CKEDITOR.replace("description"); //이미지 업로드 안됨
										
										CKEDITOR.replace("board_content", {
											filebrowserUploadUrl : "${pageContext.request.contextPath}/seller/imageUpload.do"
									

										});
										
									</script>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">교환/반품</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="주소를 입력해주세요" id="shipping_address" value="${svo.shipping_address}">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">공급량</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" placeholder="공급량을 입력해주세요" id="prdct_stock">
								</div>
							</div><br/><br/>
							<div align="center">
								<button type="submit" class="btn btn-primary">상품등록</button>
							</div>
						</fieldset>
					</form>			
				</div>
			</div>
		</div>
		<br/><br/><br/>
		<hr>
			
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
      

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 작성 폼 스크립트 -->
<script>
    $(document).ready(function () {
	    $("#writeForm").submit(function(event){
	    	event.preventDefault();
	    
	    	var formData = new FormData();
	    		
	    	// 텍스트 입력 영역
	        var prdct_name = $("#prdct_name").val();
	        var prdct_color = $("#prdct_color").val();
	        var prdct_size = $("#prdct_size").val();
	        var prdct_price = $("#prdct_price").val();
	        var board_content = CKEDITOR.instances.board_content.getData();
	        var prdct_stock = $("#prdct_stock").val();
	            
	        console.log(prdct_name);
	        console.log(prdct_color);
	        console.log(prdct_size);
	        console.log(prdct_price);
	        console.log(prdct_stock);
	        console.log(board_content);
	        console.log($(this).attr("action"));   
	            
	        formData.append("prdct_name", prdct_name);
	        formData.append("prdct_color", prdct_color);
	        formData.append("prdct_size", prdct_size);
	        formData.append("prdct_price", prdct_price);
	        formData.append("board_content", board_content);
	        formData.append("prdct_stock", prdct_stock);
	    		
	    	// 파일저장 영역
	       /*  var inputFile = $("#uploadfiles");
	    	console.log(inputFile);
	        var files = inputFile[0].files;  
                
	        for (var i = 0; i < files.length; i++) {
	        	console.log(files[i]);
	        	formData.append("uploadfiles", files[i]);
	        }   */   
	    		
	        // 파일 넣을때 JSON.stringify()는 적용이 안된다...
	        $.ajax({
	        	type : "POST",
		        url : $(this).attr("action"),
	        	cache : false,
	        	contentType:'application/json; charset=utf-8', 
	        	processData: false, 
	        	contentType: false, 
	        	data: formData, 
	        	success: function (result) {       
	        		console.log("UPLOAD SUCCESS!")  
	        		$(location).attr('href', '${pageContext.request.contextPath}/seller/mypage/prdct');                                        
	        	},
	        	error: function (e) {
	        		console.log(e);
	        		alert('업로드 실패');
	        		location.reload(); // 실패시 새로고침하기
	            }
	        }) 
	    });
    })
</script>
</body>
</html>