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
<script src="/ckeditor/ckeditor.js"></script>

</head>
<body>
<div style="overflow: hidden;" class="container">
	<header>
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>
		<div class="container">
			<span style="margin-left: 70px;"> </span> <span style="margin-left: 24px; line-height: 100px; margin-top: 20px; margin-bottom: 20px;">
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
					
				<!-- 등록한 상품 리스트	 -->
			<div class="col-md-10 contact-info" style="border-left: 1px solid rgba(0,0,0,.1) ;">
					<h3 >
					<strong>상품 정보 수정</strong>
					</h3><hr>
					<form id="updatePrd" action="${pageContext.request.contextPath}/admin/mypage/seller/${prdct.mbr_id}/prdct/${prdct.prdct_id}/modify" method="POST">		
						<input type="hidden" id="mbr_id" value="${prdct.mbr_id}">
						<input type="hidden" id="board_id" value="${pBoard.board_id}">
						<fieldset>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">상품ID</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="상품ID을 입력해주세요" id="prdct_id" value="${prdct.prdct_id}">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">상품명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="상품명을 입력해주세요" id="prdct_name" value="${prdct.prdct_name}">
								</div>
							</div>
							
							<!-- thumbnail ckeditor -->
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">대표이미지(Thumbnail)</label>
								<div class="col-sm-10">
									<textarea name="board_thumbnail" id="board_thumbnail">${pBoard.board_thumbnail }</textarea>
									<script>
									var editor2 = CKEDITOR.replace("board_thumbnail", {
										filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/mypage/seller/${prdct.mbr_id}/prdct/${prdct.prdct_id}/modify/prdct_thumb",
										height : 200
									});	
									</script>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">카테고리</label>
								<div class="col-sm-10">
									<select class="form-control">
									<c:forEach items="${pCategory }" var="pCategory">
										<option value="${pCategory.category_number" <c:if test="${pCategory.category_number eq ${pCategory.category_number}">selected</c:if>>${pCategory.category_name}</option>
									</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">색상</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="ex) BROWN,DARK,NAVY" id="prdct_color" value="${prdct.prdct_color}">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">사이즈</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="ex) XL (혹은) 105" id="prdct_size" value="${prdct.prdct_size}">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">가격</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" placeholder="가격을 입력해주세요" id="prdct_price" value="${prdct.prdct_price}">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">내용</label>
								<div class="col-sm-10">
									<textarea name="board_content" id="board_content">${pBoard.board_content }</textarea>
									<script>
										//id가 description인 태그에 ckeditor를 적용시킴
										//CKEDITOR.replace("description"); //이미지 업로드 안됨
										
										var editor2 = CKEDITOR.replace("board_content", {
											filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/mypage/seller/{mbr_id}/prdct/${prdctprdct_id}/modify/prdct_img",
											height : 500
										});	
										
									</script>
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
									<input type="number" class="form-control" placeholder="공급량을 입력해주세요" id="prdct_stock" value="${prdct.prdct_stock}">
								</div>
							</div><br/><br/>
							<div align="center">
								<button type="submit" class="btn btn-primary">상품수정</button>
								<button type="button" class="btn btn-primary" onclick="location.href='/admin/mypage/seller/${prdct.mbr_id}/prdct/${prdct.prdct_id}/delete'">
									상품삭제
								</button>
								<button type="button" class="btn btn-primary" onclick="location.href='/prdct/${prdct.prdct_id}'">
								<!-- 나중에 수정하기 -->
									상품상세
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#updatePrd").submit(function(event){
		event.preventDefault();
		
		var mbr_id = $("#mbr_id").val();
		var prdct_id = $("#prdct_id").val();
        var prdct_name = $("#prdct_name").val();
        var prdct_price = $("#prdct_price").val();
        var prdct_color = $("#prdct_color").val();
        var prdct_size = $("#prdct_size").val();
        var board_id = $("#board_id").val();
        var board_content = CKEDITOR.instances.board_content.getData();
        var prdct_stock = $("#prdct_stock").val();
        var board_thumbnail = CKEDITOR.instances.board_thumbnail.getData();
        
        console.log(prdct_id);
        console.log($(this).attr("action"));
        
        var form = {
        		mbr_id: mbr_id,
        		prdct_id: prdct_id,
        		prdct_name: prdct_name,
        		prdct_price: prdct_price,
        		prdct_color: prdct_color,
        		prdct_size: prdct_size,
        		board_id: board_id,
        		board_content: board_content,
        		prdct_stock: prdct_stock,
        		board_thumbnail: board_thumbnail,
       	 };
        console.log(form);
	    //dataType: 'json',
        $.ajax({
		    type : "PUT",
		    url : $(this).attr("action"),
		    cache : false,
		    contentType:'application/json; charset=utf-8',
			data: JSON.stringify(form), 
		    success: function (result) {       
				if(result == "SUCCESS"){
					if (confirm("정말 수정하시겠습니까??") == true) { //확인
						//(게시글 수정)
						console.log("Modify!")
						$(location).attr('href', '${pageContext.request.contextPath}/admin/mypage/seller/${prdct.mbr_id}/prdct/${prdct.prdct_id}/modify')
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

		<script type="text/javascript">
			$(document).ready(function() {
				$('#a-delete').click(function(event) {
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
									$(location).attr('href', '${pageContext.request.contextPath}/admin/mypage/seller/mypage/${prdct.mbr_id}/prdct/${prdct.prdct_id}/delete')
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
</body>
</html>