<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Notice Board Modify</title>
	
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
	           var board_id = $("#board_id").val();
	           var board_name = $("#board_name").val();
	           var board_content = $("#board_content").val();              
	           
	           console.log(board_id);
	           console.log(board_name);
	           console.log(board_content);
	           console.log($(this).attr("action"));    
	           
	           var form = {
	        		 board_id: board_id,
	        		 board_name: board_name,
	        		 board_content: board_content
	           };
	           $.ajax({
	             type : "POST",
	             url : $(this).attr("action"),
	             cache : false,
	             contentType:'application/json; charset=utf-8', // 인코딩 데이터 변환
	             data: JSON.stringify(form), // 보안 문제 해결을 위해 stringify 메소드를 사용
	             success: function (result) {       
	               if(result == "SUCCESS"){
	                  // update가 완료되었으면 리스트 페이지로 이동        
	                  $(location).attr('href', '${pageContext.request.contextPath}/board/notice')                            
	               }                       
	             },
	             error: function (e) {
	                 console.log(e);
	             }
	         })            
	       }); // end submit()       
	   	}); // end ready()
	</script>
	
	<!-- 게시글 삭제 -->
	<script type="text/javascript">
		$(document).ready(function (){
			$('#delete').click(function(event){
				event.preventDefault();
				console.log("ajax 호출전");		
	 
				$.ajax({
					type : 'DELETE',
					url : $(this).attr("href"),
					cache : false,
					success: function(result){
						console.log(result);
						if(result=="SUCCESS"){
							$(location).attr('href', '${pageContext.request.contextPath}/board/notice') 
						}
					},
					error:function(e){
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
				<h2>NOTICE</h2>
			</div>
			
			<form id="updateForm" action="${pageContext.request.contextPath}/board/notice/modify/${notice_modify.board_id}" method="post">
			<div class="container">
				<table class="table table-hover" style="text-align: center;">
					<input type="hidden" id="board_id" value="${notice_modify.board_id}">
					<tr class="table-primary">
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
					<tr>
						<td>${notice_modify.board_id}</td>						
						<td><input type="text" id="board_name" value="${notice_modify.board_name}"></td>
						<td>${notice_modify.board_date}</td>
					</tr>
				</table>
			</div>
			
			<hr>
			
			<div class="container">
				<div class="row" style="padding: 5% 3% 3% 5%">
					<p class="lead">
						<textarea cols="50%" rows="10" id="board_content">${notice_modify.board_content}</textarea>
					</p>
				</div>
			</div>
			
			<hr>
			
			<div class="container">
				<div class="row" style="padding: 3% 5% 3% 5%">
					<button type="button" id="delete" class="btn btn-danger">삭제하기</button>&nbsp;
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/notice'">목록보기</button>&nbsp;
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