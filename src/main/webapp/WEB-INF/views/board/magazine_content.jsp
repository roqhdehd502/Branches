<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : Magazine Board Content</title>
	
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
	
	<!-- AJAX용 JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- 매거진 게시글 추천 -->
	<script type="text/javascript">
		$(document).ready(function (){
			$('#uplike').click(function(event){
				event.preventDefault();
				console.log("ajax 호출전");		 
	 
				$.ajax({
					type : 'PUT',
					url : $(this).attr("href"),
					cache : false,
					success: function(result){
						console.log(result);
						if(result=="SUCCESS"){
							if(result == "SUCCESS"){     
	                  					$(location).attr('href', '${pageContext.request.contextPath}/board/magazine/${magazine_content.board_id}')                            
	               				}  
						}
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
							$(location).attr('href', '${pageContext.request.contextPath}/board/magazine')
						}
					},
					error:function(e){
						console.log(e);
					}
				})
			});	
		});	
	</script>
	
	<!-- 매거진 댓글 작성 -->
	<script type="text/javascript">
   	$(document).ready(function(){
      $("#commentWriteForm").submit(function(event){         
           event.preventDefault();
           var board_id = $("#board_id").val();
           /* var mbr_id = $("#mbr_id").val(); */
           var comment_content = $("#comment_content").val();
           
           console.log(board_id);
           /* console.log(mbr_id); */
           console.log(comment_content);
           console.log($(this).attr("action"));    
           
           var form = {
        		board_id: board_id,
        		/* mbr_id: mbr_id, */
        		comment_content: comment_content
           };

           $.ajax({
             type : "POST",
             url : $(this).attr("action"),
             cache : false,
             dataType:'json',
             contentType:'application/json; charset=utf-8',
             data: JSON.stringify(form),
             success: function (result) {       
               if(result == "SUCCESS"){     
                  $(location).attr('href', '${pageContext.request.contextPath}/board/magazine/magazine/${magazine_content.board_id}')                            
               }                       
             },
             error: function (e) {
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
			<div class="container" align="center">
				<div><h2>${magazine_content.board_name}</h2></div>
				<div>
					<label>
						${magazine_content.board_date}&nbsp;|&nbsp;
						조회수: ${magazine_content.board_hit}&nbsp;|&nbsp;
						추천수: ${magazine_content.board_like}
					</label>
				</div>
			</div>
			<hr>
			<div class="container">
				<div class="row" style="padding: 5% 3% 3% 5%">
					<c:forEach items="${magazine_img}" var="img">	
					<div class="col-md-12" style="text-align: center;">
						<img class="rounded" width="800px" height="600px" src="<c:url value="/prdct_img/${img.image_name}"/>">
					</div>
					</c:forEach>
					<div class="col-md-12">
						<p>${magazine_content.board_content}</p>
					</div>
				</div>
			</div>
					
			<hr>
						
			<div align="center" style="padding: 3% 5% 3% 5%">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/magazine'">목록보기</button>&nbsp;
				<button type="button" id="uplike" class="btn btn-primary">추천하기</button>&nbsp;
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/magazine/modify/${magazine_content.board_id}'">수정하기</button>&nbsp;
				<button type="button" id="delete" class="btn btn-primary">삭제하기</button>
			</div>
			
			<hr>
			
			<!-- 댓글 작성 -->
			<form method="post" action="${pageContext.request.contextPath}/board/magazine/${magazine_content.board_id}">
				<input type="hidden" id="board_id" value="${magazine_content.board_id}">
				<!-- 이 부분에서 value="mbr_id"는 스프링 시큐리티때 계정 정보를 가져와야해서 이후에 수정해야함! -->
				<!-- <input type="hidden" id="mbr_id" value="mbr_id"> -->
				<div class="container">
					<div class="row" style="padding: 5% 3% 3% 5%">
						<div class="col-md-10" align="left">
							<textarea class="form-control" cols="3" id="comment_content" name="comment_content" placeholder="댓글을 남겨주세요"></textarea>		
						</div>
						<div class="col-md-2" align="right">
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</div>
				</div>
			</form>
			
			<hr>
			
			<!-- 댓글 불러오기 -->
			<div class="container">
				<div class="row" style="padding: 5% 3% 3% 5%">
					<c:forEach items="${magazine_comment}" var="magazine_comment">
					<div class="col-md-8" align="left">
						${magazine_comment.comment_content}
					</div>
					<div class="col-md-4" align="right">
						${magazine_comment.comment_date}					
					</div>
					</c:forEach>
				</div>
			</div>
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