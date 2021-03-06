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
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#prdct_thumbnail").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#showImg").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
        
    }        
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#updatePrd").submit(function(event){
		event.preventDefault();
		
		var mbr_id = $("#mbr_id").val();
		var prdct_id = $("#prdct_id").val();
        var prdct_name = $("#prdct_name").val();
        var category_number = $("#category_number option:selected").val();
        var prdct_price = $("#prdct_price").val();
        var prdct_color = $("#prdct_color").val();
        var prdct_size = $("#prdct_size").val();
        var board_id = $("#board_id").val();
        var board_content = CKEDITOR.instances.board_content.getData();
        var prdct_stock = $("#prdct_stock").val();
        var prdct_thumbnail = $("#prdct_thumbnail").val().replace('C:\\fakepath\\', '/prdct_img/prdct_thumbnail/');
        //var uploadfile = $("#prdct_thumbnail")[0].files[0];
        console.log($(this).attr("action"));
        
     	// csrf
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		
        var form[0] = {
        		mbr_id: mbr_id,
        		prdct_id: prdct_id,
        		prdct_name: prdct_name,
        		category_number: category_number,
        		prdct_price: prdct_price,
        		prdct_color: prdct_color,
        		prdct_size: prdct_size,
        		board_id: board_id,
        		board_content: board_content,
        		prdct_stock: prdct_stock,
        		prdct_thumbnail: prdct_thumbnail,
       	 };
        
        console.log(form);
        
        var formData = new FormData(form);
        
        /* formData.append("mbr_id", mbr_id);
        formData.append("prdct_id", prdct_id);
        formData.append("prdct_name", prdct_name);
        formData.append("category_number", category_number);
        formData.append("prdct_price", prdct_price);
        formData.append("prdct_color", prdct_color);
        formData.append("prdct_size", prdct_size);
        formData.append("board_id", board_id);
        formData.append("board_content", board_content);
        formData.append("prdct_stock", prdct_stock);
        formData.append("prdct_thumbnail", prdct_thumbnail); */
        
        var inputFile = $("#prdct_thumbnail");
        var file = inputFile[0].files;
        
        if (file != null) {    
        	console.log(file);
		    formData.append("uploadfiles", file);
		    appended = true;
		   }

        console.log("formData: " + formData); 
        
	    //dataType: 'json',
        $.ajax({
		    type : "POST",
		    url : $(this).attr("action"),
		    cache : false,
		    //contentType:'application/json; charset=utf-8',
		    //enctype: 'multipart/form-data',
		    contentType: 'multipart/formdata; boundary=----WebKitFormBoundary',
		    processData: false, 
    		contentType: false, 
			data: formData, 
			timeout: 600000,
			beforeSend: function(xhr) {
				xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
			},
		    success: function (result) {       
				if(result == "SUCCESS"){
					if (confirm("정말 수정하시겠습니까??") == true) { //확인
						//(게시글 수정)
						console.log("Modify!")
						$(location).attr('href', '${pageContext.request.contextPath}/admin/mypage/seller/${prdct.mbr_id}/prdct/${prdct.prdct_id}')
					} else { //취소
						return;
					}			      	       
				}					        
		    },
		    error: function (e) {
		        console.log("실패" + e);
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
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px;">
	                    <h3>업체관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/regist/seller">업체등록</a></h5>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/seller">업체목록 조회</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>회원관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/member">회원정보 조회</a></h5>
	               		 <h5><a href="${pageContext.request.contextPath}/admin/mypage/member/userQnA">고객Q&A 목록</a></h5>
	                </div><br/>
	                <div class="single-info" style="margin-bottom: 40px">
	                    <h3>매출관리</h3><hr>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/admintotal">매출조회</a></h5>
	                    <h5><a href="${pageContext.request.contextPath}/admin/mypage/adminSearchtotal">검색순위 조회</a></h5>
	                </div>
				</div>
					
			<div class="col-md-9 contact-info" style="border-left: 1px solid rgba(0,0,0,.1) ;">
					<h3 >
					<strong>상품 정보 수정</strong>
					</h3><hr>
					<form id="updatePrd" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/mypage/seller/${prdct.mbr_id}/prdct/${prdct.prdct_id}/modify" method="POST">		
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
							<div class="form-group row"  style="height: 210px;">
								<label class="col-sm-2 col-form-label">대표이미지(Thumbnail)</label>
								<div class="col-sm-10">
									<div class="custom-file" id="inputFile">
										<img src="/prdct_img/prdct_thumbnail/${prdct.prdct_thumbnail}" id="showImg" style="width: 150px; height: 200px;"></img>
										<input type="file" id="prdct_thumbnail" name="prdct_thumbnail" accept="image/*" multiple="multiple">
									</div>
								</div>
							</div>
							<div class="form-group row" style="height: 55px;">
								<label class="col-sm-2 col-form-label" >카테고리</label>
								<div class="col-sm-10" >
									<select class="form-control" id="category_number" style="height: 50px;">
									<option value="1" <c:if test="${prdct.category_number == 1 }">selected</c:if>>아우터-코트</option>
                              <option value="2" <c:if test="${prdct.category_number == 2 }">selected</c:if>>아우터-자켓</option>
                              <option value="3" <c:if test="${prdct.category_number == 3 }">selected</c:if>>아우터-점퍼/무스탕</option>
                              <option value="4" <c:if test="${prdct.category_number == 4 }">selected</c:if>>아우터-가디건</option>
                              <option value="5" <c:if test="${prdct.category_number == 5 }">selected</c:if>>아우터-패딩</option>
                              <option value="6" <c:if test="${prdct.category_number == 6 }">selected</c:if>>상의-티셔츠</option>
                              <option value="7" <c:if test="${prdct.category_number == 7 }">selected</c:if>>상의-블라우스/셔츠</option>
                              <option value="8" <c:if test="${prdct.category_number == 8 }">selected</c:if>>상의-니트/스웨터</option>
                              <option value="9" <c:if test="${prdct.category_number == 9 }">selected</c:if>>상의-후드티</option>
                              <option value="10" <c:if test="${prdct.category_number == 10 }">selected</c:if>>상의-맨투맨</option>
                              <option value="11" <c:if test="${prdct.category_number == 11 }">selected</c:if>>상의-슬리브리스</option>
                              <option value="12" <c:if test="${prdct.category_number == 12 }">selected</c:if>>하의-데님</option>
                              <option value="13" <c:if test="${prdct.category_number == 13 }">selected</c:if>>하의-코튼</option>
                              <option value="14" <c:if test="${prdct.category_number == 14 }">selected</c:if>>하의-숏</option>
                              <option value="15" <c:if test="${prdct.category_number == 15 }">selected</c:if>>하의-슬랙스</option>
                              <option value="16" <c:if test="${prdct.category_number == 16 }">selected</c:if>>하의-트레이닝/조거</option>
                              <option value="17" <c:if test="${prdct.category_number == 17 }">selected</c:if>>하의-레깅스</option>
                              <option value="18" <c:if test="${prdct.category_number == 18 }">selected</c:if>>하의-스커트</option>
                              <option value="19" <c:if test="${prdct.category_number == 19 }">selected</c:if>>드레스-미니</option>
                              <option value="20" <c:if test="${prdct.category_number == 20 }">selected</c:if>>드레스-미디</option>
                              <option value="21" <c:if test="${prdct.category_number == 21 }">selected</c:if>>드레스-맥시</option>
                              <option value="22" <c:if test="${prdct.category_number == 22 }">selected</c:if>>드레스-오버롤</option>
                              <option value="23" <c:if test="${prdct.category_number == 23 }">selected</c:if>>가방-백팩</option>
                              <option value="24" <c:if test="${prdct.category_number == 24 }">selected</c:if>>가방-메신저/크로스</option>
                              <option value="25" <c:if test="${prdct.category_number == 25 }">selected</c:if>>가방-숄더/토트</option>
                              <option value="26" <c:if test="${prdct.category_number == 26 }">selected</c:if>>가방-에코백</option>
                              <option value="27" <c:if test="${prdct.category_number == 27 }">selected</c:if>>가방-클러치</option>
                              <option value="28" <c:if test="${prdct.category_number == 28 }">selected</c:if>>신발-구두</option>
                              <option value="29" <c:if test="${prdct.category_number == 29 }">selected</c:if>>신발-부츠</option>
                              <option value="30" <c:if test="${prdct.category_number == 30 }">selected</c:if>>신발-샌들</option>
                              <option value="31" <c:if test="${prdct.category_number == 31 }">selected</c:if>>신발-슬리퍼</option>
                              <option value="32" <c:if test="${prdct.category_number == 32 }">selected</c:if>>신발-스니커즈</option>
                              <option value="33" <c:if test="${prdct.category_number == 33 }">selected</c:if>>ETC-가방</option>
                              <option value="34" <c:if test="${prdct.category_number == 34 }">selected</c:if>>ETC-모자</option>
                              <option value="35" <c:if test="${prdct.category_number == 35 }">selected</c:if>>ETC-악세서리</option>
									</select>
								</div>
							</div>
							
							<div class="form-group row">
							<label class="col-sm-10 col-form-label" style="text-align: center;">색상, 사이즈는 ","로 구분합니다. 띄어쓰기 없이 입력해주세요</label>
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
								<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/prdct/${prdct.prdct_id}'">
								<!-- 나중에 수정하기 -->
									상품상세
								</button>
								<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/mypage/seller/${prdct.mbr_id}/prdct'">
								<!-- 나중에 수정하기 -->
									목록보기
								</button>
								<button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/admin/mypage/seller/${prdct.mbr_id}/prdct/${prdct.prdct_id}/delete'">
									상품삭제
								</button>
								
							</div>
						</fieldset>
					</form>			
				</div>
			</div>
		</div>
		<br/><br/>
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


</body>
</html>