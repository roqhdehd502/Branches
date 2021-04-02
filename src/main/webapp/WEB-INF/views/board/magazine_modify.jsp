<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Magazine Board Modify</title>
	
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
	
	<!-- AJAX 처리용 JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- 수정 폼 스크립트 -->
	<script type="text/javascript">
	   	$(document).ready(function(){
	      $("#updateForm").submit(function(event){         
	           event.preventDefault();
	           
	           // FormData 불러오기
	           var formData = new FormData();
	           
	           // 게시글 텍스트 사항
	           var board_id = $("#board_id").val();
	           var board_name = $("#board_name").val();
	           var board_content = $("#board_content").val();              
	           
	           console.log(board_id);
	           console.log(board_name);
	           console.log(board_content);
	           console.log($(this).attr("action"));    
	           
	           // 해당 텍스트들을 FormData에 append
	           formData.append("board_id", board_id);
	           formData.append("board_name", board_name);
	           formData.append("board_content", board_content);           
               
	           
               // 파일 업로드 체크(게시글 내용만 수정하는 것 대비...)
               var inputFile = $("#uploadfiles");
               var files = inputFile[0].files;
	           
               // 파일을 담는 배열이 비어 있지 않으면(파일 업로드 시) FormData에 파일 정보를 추가한다
               if (files != null) {    
            	   for (var i = 0; i < files.length; i++) {
   				       console.log(files[i]);
   				       formData.append("uploadfiles", files[i]);
   				       appended = true;
   			   	   }
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
	                success: function (result) {       
	                	console.log("UPLOAD SUCCESS!");
	                	alert('수정 성공');
	                    $(location).attr('href', '${pageContext.request.contextPath}/board/magazine');                                        
	                },
	                error: function (e) {
	                    console.log(e);
	                    alert('수정 실패');
	  	            	location.reload(); // 실패시 새로고침하기
	               }
	           })            
	       });     
	   	});
	</script>
		
	<!-- 매거진 사진만 삭제 -->
	<script type="text/javascript">
	$(document).ready(function (){
		$('#img_del_only').click(function(event){
			event.preventDefault();
			
			// FormData 객체 생성
			var formData = new FormData(); 
			
			// 해당 이미지를 감싸는 태그를 불러온다
			//var trObj = $(this).parent();
			var trObj = $(this).parent(); 
			console.log(trObj);
			
			// 파일명을 담을 변수 생성
     		var fileName = ""; 
     		
     		// indvd${image.image_number}가 붙은 class의 정보를 가져온다
     		var imageInfo = $("[class='indvd${image.image_number}']");
     		console.log("imageInfo: " + imageInfo);
     		
     		// 해당 이미지의 정보를 파일명 변수에 대입한다
     		var fileName = imageInfo.html();
     		console.log("fileName: " + fileName);
     		
 			// formData에 해당 값을 append한다
 			formData.append("onedeletefiles", fileName);
     		console.log("formData: " + formData);
 
			$.ajax({
				type : 'DELETE', 
				url : $(this).attr("href"), 
				cache : false, 
                processData: false, 
	    		contentType: false, 
                data: formData, 
				success: function(result){
					console.log(result);
					alert("이미지를 삭제합니다.");
					$(trObj).remove(); // 해당 이미지 컨테이너 삭제
					console.log("IMAGE_REMOVED!")
				},
				error:function(e){
					console.log(e);
				}
			})
		});	
	});	
	</script>
	
	<!-- 매거진 게시글 삭제 -->
	<script type="text/javascript">
		$(document).ready(function () {
			$('#magazine_delete').click(function(event) {
				event.preventDefault();
				
	    		var formData = new FormData(); // FormData 객체 생성
	    		
	    		// 이미지 파일
	    		var fileNoArry = new Array(); // 여러 파일번호를 담을 배열 생성
	     		var fileNameArry = new Array(); // 여러 파일명을 담을 배열 생성
	     		
	     		// uploadimagenumber 키워드가 붙은 class의 개수를 가져온다
	     		var imageCnt = $("[class*='uploadimagenumber']").length;
	     		console.log("imageCnt: " + imageCnt);
	     		
	     		// 이미지 개수만큼 해당 태그내의 요소 값을 배열안에 push한다
	     		for (var i = 0; i < imageCnt; i++) {
	     			var temp = i.toString();
	     			fileNoArry.push($('.uploadimagenumber'.concat(temp)).html());
		     		fileNameArry.push($('.deletefiles'.concat(temp)).html());
				}
	     		
	     		// push한 데이터 확인
	     		console.log("fileNoArry: " + fileNoArry);
     			console.log("fileNameArry: " + fileNameArry);
	     		
     			// 배열 길이만큼 formData에 해당 인덱스 값을 append한다
	     		for (var i = 0; i < fileNoArry.length; i++) {		
	     			formData.append("image_number", fileNoArry[i]);
	     			formData.append("deletefiles", fileNameArry[i]);
				}
	     		
	     		console.log("formData: " + formData);
	 
				$.ajax({
					type : 'DELETE', 
					url : $(this).attr("href"), 
					cache : false, 
	                processData: false, 
		    		contentType: false, 
	                data: formData, 
					success: function(result) {
						console.log(result);
						if(result == "SUCCESS") {
							alert("게시글을 삭제합니다.");
							$(location).attr('href', '${pageContext.request.contextPath}/board/magazine')
						}
					},
					error:function(e) {
						alert("게시글을 삭제할 수 없습니다.");
						console.log(e);
					}
				})
			});	
		});
	</script>
</head>
<body>
	<div style="overflow: hidden;" class="container">
	<header style="padding-bottom: 10px; padding-top: 5px;">
      <div class="container">
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
                     <a href="#" class="fa fa-facebook"></a> <a href="#" class="fa fa-twitter"></a> <a href="#" class="fa fa-github"></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
         <nav id="menu" class="d-none d-lg-block">
            <ul style="padding: 10px; background-color: black;">
               <li class="current-menu-item has-child"><a href="index.html">OUTER</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">Coat</a></li>
                     <li><a href="index-2.html">Jarcket</a></li>
                     <li><a href="index-3.html">Jumper / Mustang</a></li>
                     <li><a href="index-3.html">Cardigan</a></li>
                     <li><a href="index-3.html">Padding</a></li>
                  </ul></li>
               <li class="current-menu-item has-child"><a href="index.html">TOP</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">T-shirt</a></li>
                     <li><a href="index-2.html">Blouse / Shirt</a></li>
                     <li><a href="index-3.html">Knit / Sweater</a></li>
                     <li><a href="index-3.html">Hoddie</a></li>
                     <li><a href="index-3.html">Sweat shirt</a></li>
                     <li><a href="index-3.html">Sleeveless</a></li>
                  </ul></li>
               <li class="current-menu-item has-child"><a href="index.html">BOTTOM</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">Denim</a></li>
                     <li><a href="index-2.html">Cotton</a></li>
                     <li><a href="index-3.html">Shorts</a></li>
                     <li><a href="index-3.html">Slacks</a></li>
                     <li><a href="index-3.html">Training / Jogger</a></li>
                     <li><a href="index-3.html">Leggings</a></li>
                     <li><a href="index-3.html">Skirt</a></li>   
                  </ul></li>
               <li class="current-menu-item has-child"><a href="index.html">Dress</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">Mini</a></li>
                     <li><a href="index-2.html">Midi</a></li>
                     <li><a href="index-3.html">Maxi</a></li>
                     <li><a href="index-3.html">Overall</a></li>
                  </ul></li>
               <li class="current-menu-item has-child"><a href="index.html">Bag</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">Bagpack</a></li>
                     <li><a href="index-2.html">Messenger / Cross</a></li>
                     <li><a href="index-3.html">Shoulder / Tote</a></li>
                     <li><a href="index-2.html">Eco bag</a></li>
                     <li><a href="index-3.html">Clutch</a></li>
                  </ul></li>
               <li class="current-menu-item has-child"><a href="index.html">Shoes</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">Dress shoes</a></li>
                     <li><a href="index-2.html">Boots</a></li>
                     <li><a href="index-3.html">Sandal</a></li>
                     <li><a href="index-2.html">slipper</a></li>
                     <li><a href="index-3.html">Sneakers</a></li>
                  </ul></li>
               <li class="current-menu-item has-child"><a href="index.html">ETC</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">Socks</a></li>
                     <li><a href="index-2.html">Cap</a></li>
                     <li><a href="index-3.html">Acc</a></li>
                  </ul></li>
               <li>
                  <a href="index.html" style="color: white;">|</a>
               </li>
               <li class="current-menu-item has-child"><a href="index.html">BRAND</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">Nike</a></li>
                     <li><a href="index-2.html">Thisisneverthat</a></li>
                     <li><a href="index-3.html">Covernat</a></li>
                     <li><a href="index-3.html">AnderssonBell</a></li>
                     <li><a href="index-3.html">Vans</a></li>
                  </ul>
               </li>
               <li class="current-menu-item has-child"><a href="index.html">MAGAZINE</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">바로가기</a></li>
                  </ul>
               </li>
               <li class="current-menu-item has-child"><a href="index.html" style="margin-right: 38px;">NOTICE</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">바로가기</a></li>
                  </ul>
               </li>
            </ul>
         </nav>
      </header>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="container">
				<h2>MAGAZINE</h2>
			</div>
			
			<form id="updateForm" action="${pageContext.request.contextPath}/board/magazine/modify/${magazine_modify.board_id}" method="post">
			<div class="container">
				<table class="table table-hover" style="text-align: center;">
					<input type="hidden" id="board_id" value="${magazine_modify.board_id}">
					<tr class="table-primary">
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
					<tr>
						<td>${magazine_modify.board_id}</td>						
						<td><input type="text" id="board_name" value="${magazine_modify.board_name}"></td>
						<td>${magazine_modify.board_date}</td>
					</tr>
				</table>
			</div>
			
			<hr>
			
			<div class="container">
				<div class="row" style="padding: 5% 3% 3% 5%">
					<textarea cols="50%" rows="10" id="board_content">${magazine_modify.board_content}</textarea>
				</div>
				
				<hr>
				<!-- 수정페이지에서 새로 추가되는 사진 -->
				<div class="row" style="padding: 5% 3% 3% 5%">
					<input type="file" accept=".jpg, .png" id="uploadfiles" name="uploadfiles" placeholder="첨부 사진" multiple/>
					<small class="form-text text-muted">jpg, png의 사진파일만 적용됩니다.</small>
				</div>
			</div>
			
			<hr>
			
			<div class="container">
				<div id="image_container" class="row" style="padding: 5% 3% 3% 5%">
					<c:forEach items="${magazine_image}" var="image" varStatus="image_status">
						<!-- 이미지 컨테이너 -->
						<div class="col-md-2" align="center">
							<!-- 게시글을 삭제할 때 이미지도 삭제하기 위한 이미지 정보 -->
							<!-- varStatus="image_status"를 통해 해당 리스트의 인덱스를 class 이름 뒤에 붙인다 -->
							<span class="uploadimagenumber${image_status.index}" style="display: none;">${image.image_number}</span>
							<span class="deletefiles${image_status.index}" style="display: none;">${image.image_name}</span>
							
							<!--  이미지만 삭제하기 위한 해당 이미지 번호 -->
							<span class="indvd${image.image_number}" style="display: none;">${image.image_name}</span>
							<img src="/board_img/${image.image_name}" width="100px" height="140px">
							<button type="button" id="img_del_only" class="btn btn-danger">&#88;</button>
						</div>
					</c:forEach>	
				</div>
			</div>
			
			<hr>
			
			<div class="container">
				<div class="row" style="padding: 3% 5% 3% 5%">
					<button type="button" id="magazine_delete" class="btn btn-danger">삭제하기</button>&nbsp;
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/magazine'">목록보기</button>&nbsp;
					<button type="submit" class="btn btn-primary">수정하기</button>
				</div>
			</div>
			</form>
		</div>
	<!-- </div> -->

	<hr>

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
    </div>
</body>
</html>