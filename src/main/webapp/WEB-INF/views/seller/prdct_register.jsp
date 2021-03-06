<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
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
				
				<div class="col-md-10 contact-info" style="border-left: 1px solid rgba(0,0,0,.1) ;">
					<h3 >
					<strong>상품 등록</strong>
					</h3><hr>
					<form action="/seller/mypage/prdct" method="post" role="form" id="writeForm" enctype="multipart/form-data">
						<input type="hidden" id="mbr_id" value="${mbr.mbr_id }">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<fieldset>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">상품ID</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="상품ID을 입력해주세요" id="prdct_id">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">상품명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="상품명을 입력해주세요" id="prdct_name">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">썸네일</label>
								<div class="col-sm-10">
									<input type="file" id="uploadfiles" name="uploadfiles" placeholder="첨부 사진" multiple/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">카테고리</label>
								<div class="col-sm-10">
									<select class="form-control" name="category" id="category_number">
										<option value="1" >아우터-코트</option>
										<option value="2" >아우터-자켓</option>
										<option value="3" >아우터-점퍼/무스탕</option>
										<option value="4" >아우터-가디건</option>
										<option value="5" >아우터-패딩</option>
										<option value="6">상의-티셔츠</option>
										<option value="7" >상의-블라우스/셔츠</option>
										<option value="8">상의-니트/스웨터</option>
										<option value="9" >상의-후드티</option>
										<option value="10" >상의-맨투맨</option>
										<option value="11">상의-슬리브리스</option>
										<option value="12" >하의-데님</option>
										<option value="13" >하의-코튼</option>
										<option value="14" >하의-숏</option>
										<option value="15" >하의-슬랙스</option>
										<option value="16">하의-트레이닝/조거</option>
										<option value="17" >하의-레깅스</option>
										<option value="18" >하의-스커트</option>
										<option value="19">드레스-미니</option>
										<option value="20">드레스-미디</option>
										<option value="21">드레스-맥시</option>
										<option value="22">드레스-오버롤</option>
										<option value="23">가방-백팩</option>
										<option value="24">가방-메신저/크로스</option>
										<option value="25">가방-숄더/토트</option>
										<option value="26">가방-에코백</option>
										<option value="27">가방-클러치</option>
										<option value="28">신발-구두</option>
										<option value="29">신발-부츠</option>
										<option value="30">신발-샌들</option>
										<option value="31">신발-슬리퍼</option>
										<option value="32">신발-스니커즈</option>
										<option value="33">ETC-가방</option>
										<option value="34">ETC-모자</option>
										<option value="35">ETC-악세서리</option>
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
											filebrowserUploadUrl : "${pageContext.request.contextPath}/seller/imageUpload.do?${_csrf.parameterName}=${_csrf.token}"
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
	    	var mbr_id = $("#mbr_id").val();
	    	var prdct_id = $("#prdct_id").val();
	        var prdct_name = $("#prdct_name").val();
	        var category_number = $("#category_number").val();
	        var prdct_color = $("#prdct_color").val();
	        var prdct_size = $("#prdct_size").val();
	        var prdct_price = $("#prdct_price").val();
	        var board_content = CKEDITOR.instances.board_content.getData();
	        var prdct_stock = $("#prdct_stock").val();
	        
	        console.log(mbr_id);
	        console.log(prdct_id);
	        console.log(prdct_name);
	        console.log(category_number);
	        console.log(prdct_color);
	        console.log(prdct_size);
	        console.log(prdct_price);
	        console.log(prdct_stock);
	        console.log(board_content);
	        console.log($(this).attr("action"));   
	         
	        formData.append("mbr_id", mbr_id);
	        formData.append("prdct_id", prdct_id);
	        formData.append("prdct_name", prdct_name);
	        formData.append("category_number", category_number);
	        formData.append("prdct_color", prdct_color);
	        formData.append("prdct_size", prdct_size);
	        formData.append("prdct_price", prdct_price);
	        formData.append("board_content", board_content);
	        formData.append("prdct_stock", prdct_stock);
	        
	     // 썸네일 업로드 영역
            var inputFile = $("#uploadfiles");
            
            function filechk() {
            	 var fileDir = inputFile;
            	 if(fileDir.substring(fileDir.lastIndexOf(".")+1,fileDir.length).search("jpg") == -1){
            	 	alert("지정된 확장자의 이미지만 업로드 가능합니다!");
            	 } else if (fileDir.substring(fileDir.lastIndexOf(".")+1,fileDir.length).search("png") == -1) {
            		 alert("지정된 확장자의 이미지만 업로드 가능합니다!");
				 }	 
            } 
    		
            var files = inputFile[0].files;  
            
            for (var i = 0; i < files.length; i++) {
				console.log(files[i]);
				formData.append("uploadfiles", files[i]);
				appended = true;
			}
            
            console.log("formData: " + formData);
	    		
	        $.ajax({
	        	type : "POST",
		        url : $(this).attr("action"),
	        	cache : false,
	        	contentType:'application/json; charset=utf-8', 
	        	processData: false, 
	        	contentType: false, 
	        	data: formData,
	        	beforeSend : function(xhr) {
	   			xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
	            },
	        	success: function (result) {
	        		if (confirm("입력된 정보를 등록하시겠습니까??") == true) {
	        			console.log("UPLOAD SUCCESS!")  
	        			$(location).attr('href', '${pageContext.request.contextPath}/seller/mypage/prdct');
	        		}else {
						return;
					}
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