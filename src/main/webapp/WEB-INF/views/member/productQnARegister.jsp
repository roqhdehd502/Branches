<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Product Q&A Register</title>
	
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
	<link rel="stylesheet" type="text/css" href="style.css">
	
	<script src="/ckeditor/ckeditor.js"></script>
	
	
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"></jsp:include>
		<br />
		<br />
		<!-- 상품 Q&A 등록 페이지 -->
		<form action="${pageContext.request.contextPath}/member/prdct/{prdct_id}/qna/writing" method="post">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			<input type="hidden" value="${prdctQnaInfo.mbr_id}" id="mbr_id" name="mbr_id" />
			<fieldset>
				
				<legend style="text-align: center;">상품 Q&A 등록</legend>
				<br />

				<!-- 상품정보 -->
				<div class="form-group row">
					<label for="prdName" class="col-sm-2 col-form-label">상품</label>
					<div class="col-sm-10">
						<p id="prdct_id" class="font-weight-bold">${prdctInfo.prdct_id}</p>
						<input type="hidden" name="prdct_id" value="${prdctInfo.prdct_id}" />
					</div>
				</div>

				<!-- 문의유형 -->
				<div class="form-group row">
					<label for="PrdQNA" class="col-sm-2 col-form-label">문의 유형</label>
					<div class="form-group col-sm-10">
						<select class="form-control" id="inquiry_number" name="inquiry_number">
							<option id="inquiry_number" value="1">EXCHANGE</option>
							<option id="inquiry_number" value="2">REFUND</option>
							<option id="inquiry_number" value="3">CANCEL</option>
							<option id="inquiry_number" value="4">SHIPPING</option>
							<option id="inquiry_number" value="5">FAULTY</option>
							<option id="inquiry_number" value="6">ORDER</option>
							<option id="inquiry_number" value="7">PRODUCT</option>
							<option id="inquiry_number" value="8">POINT</option>
							<option id="inquiry_number" value="9">MEMBER</option>
							<option id="inquiry_number" value="10">ETC</option>
						</select>
					</div>
				</div>

				<!-- 제목 -->
				<div class="form-group row">
					<label for="pqnatitle" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="board_name" name="board_name" placeholder="제목을 입력해 주세요.">
					</div>
				</div>

				<!--내용 -->
				<div class="form-group row">
					<label for="orderEmail" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea name="board_content" id="board_content" class="form-control"></textarea>
									<script>
										//id가 description인 태그에 ckeditor를 적용시킴
										//CKEDITOR.replace("description"); //이미지 업로드 안됨
										
										var editor2 = CKEDITOR.replace("board_content", {
											filebrowserUploadUrl : "${pageContext.request.contextPath}/prdct/{prdct_id}/qna/write/prdct_img",
											height : 500
										});	
										
									</script>
					</div>
				</div>

				<div style="text-align: center;">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
				<br /> <br />
			</fieldset>
		</form>

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
	</div>
</body>
</html>