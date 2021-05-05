<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : My Page</title>
	
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
	
	<!-- 스윗트래커 배송 API -->
	<script>
	$(document).ready(function(){
	    var myKey = "l4kAPimzQ1FmXl30k0ojbg"; // sweet tracker에서 발급받은 자신의 키 넣는다.
	        // 택배사 목록 조회 company-api
	        $.ajax({
	            type:"GET",
	            dataType : "json",
	            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
	            success:function(data){     
	                    // 방법 1. JSON.parse 이용하기
	                    var parseData = JSON.parse(JSON.stringify(data));
	                     console.log(parseData.Company); // 그중 Json Array에 접근하기 위해 Array명 Company 입력
	                    
	                    // 방법 2. Json으로 가져온 데이터에 Array로 바로 접근하기
	                    var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
	                    console.log(CompanyArray); 
	                    
	                    var myData="";
	                    $.each(CompanyArray,function(key,value) {
	                            myData += ('<option value='+value.Code+'>' +'key:'+key+', Code:'+value.Code+',Name:'+value.Name + '</option>');                        
	                    });
	                    $("#tekbeCompnayList").html(myData);
	            }
	        });
	        // 배송정보와 배송추적 tracking-api
	        $("#myButton1").click(function() {
	            var t_code = $('#tekbeCompnayList option:selected').attr('value');
	            var t_invoice = $('#invoiceNumberText').val();
	            $.ajax({
	                type:"GET",
	                dataType : "json",
	                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
	                success:function(data){
	                    console.log(data);
	                    var myInvoiceData = "";
	                    if(data.status == false){
	                        myInvoiceData += ('<p>'+data.msg+'<p>');
	                    }else{
	                        myInvoiceData += ('<tr>');                
	                        myInvoiceData += ('<th>'+"보내는사람"+'</td>');                     
	                        myInvoiceData += ('<th>'+data.senderName+'</td>');                     
	                        myInvoiceData += ('</tr>');     
	                        myInvoiceData += ('<tr>');                
	                        myInvoiceData += ('<th>'+"제품정보"+'</td>');                     
	                        myInvoiceData += ('<th>'+data.itemName+'</td>');                     
	                        myInvoiceData += ('</tr>');     
	                        myInvoiceData += ('<tr>');                
	                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
	                        myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                     
	                        myInvoiceData += ('</tr>');     
	                        myInvoiceData += ('<tr>');                
	                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
	                        myInvoiceData += ('<th>'+data.receiverAddr+'</td>');                     
	                        myInvoiceData += ('</tr>');                                       
	                    }
	                    
	                    
	                    $("#myPtag").html(myInvoiceData)
	                    
	                    var trackingDetails = data.trackingDetails;
	                    
	                    
	                    var myTracking="";
	                    var header ="";
	                    header += ('<tr>');                
	                    header += ('<th>'+"시간"+'</th>');
	                    header += ('<th>'+"장소"+'</th>');
	                    header += ('<th>'+"유형"+'</th>');
	                    header += ('<th>'+"전화번호"+'</th>');                     
	                    header += ('</tr>');     
	                    
	                    $.each(trackingDetails,function(key,value) {
	                        myTracking += ('<tr>');                
	                        myTracking += ('<td>'+value.timeString+'</td>');
	                        myTracking += ('<td>'+value.where+'</td>');
	                        myTracking += ('<td>'+value.kind+'</td>');
	                        myTracking += ('<td>'+value.telno+'</td>');                     
	                        myTracking += ('</tr>');                                    
	                    });
	                    
	                    $("#myPtag2").html(header+myTracking);
	                    
	                }
	            });
	        });
	        
	});
	</script>	
	
	<!-- thumbnail image hover -->
	<style type="text/css">
		.thumbnail:hover {
			background-color: #e0e0e0;
			border: 1px solid #e0e0e0;
			border-radius: 5px;
		}
		
		a:hover { 
			text-decoration: none;
		}
	</style>
</head>
<body>
	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"></jsp:include>
		
		<hr style="margin: 15px 15px 40px 15px;">
		
		<!-- 상단 회원 정보 요약 -->
		<div class="container">
			<div class="row" style="height: 50px;">
				<div class="col-md-3 contact-info" align="left" style="padding-left: 15px; margin-top: 10px; text-align: center;">
					<h2>${mbr.mbr_name}</h2>
				</div>
				<div class="col-md-1 contact-info" style="padding-top: 20px;">
					<a href="${pageContext.request.contextPath}/member/mypage/myinfo">정보수정</a>
				</div>
				<div class="col-md-6 contact-info"></div>
				<div class="col-md-2 contact-info" align="center" style="position: relative; bottom: 10px; right: 10px;">
					<h2>Point</h2>
					<h3>${mbr.mbr_point}</h3>
				</div>
			</div>
			<span style="margin-left: 14px;"> </span> <span style="margin-left: 400px;" align="center"> </span>
		</div>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<!-- 왼쪽 사이드 메뉴  -->
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
						<h3>나의 쇼핑활동</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/order">주문내역 조회</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/recently">최근 본 상품</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/like">찜한 목록</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>매거진</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/board/magazine">매거진</a>
						</h5>
					</div>
					<div class="single-info" style="margin-bottom: 40px">
						<h3>내가 쓴 글보기</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/review/list">구매후기</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/prdctq/list">상품문의</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/myqna/list">고객Q&A</a>
						</h5>
					</div>
				</div>
				
				<!-- 오른쪽 컨텐츠 내용 -->
				<div class="col-md-9 contact-info" style="border-left: 1px solid rgba(0, 0, 0, .1);">
					<div class="container">
						<div class="row">
							<div class="col-md-6" align="left" style="padding-left: 10px">
								<h3>최근 주문내역</h3>
							</div>
							<div class="col-md-6" align="right" style="padding-right: 0px">
								<button class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/order/cart'">장바구니</button>
							</div>
						</div>
						<div class="row" style="padding-left: 15px">
							<small>최근 주문내역 중 3개만 보여집니다.</small>
						</div>
						
						<hr>
						
						<!-- 최근 주문내역 3개만 보여주기 -->
						<c:forEach items="${order_list}" var="order" end="2">
						<div class="row">	
							<div class="col-md-3 thumbnail" align="center">
								<a href="${pageContext.request.contextPath}/prdct/${order.prdct_id}"><img src="<c:url value="/prdct_img/prdct_thumbnail/${order.prdct_thumbnail}"/>" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="150px" height="200px"></a>
							</div>
							<div class="col-md-5" align="left" style="padding: 3% 0px 0px 0px">
								<br>
								<h5>${order.brand_id}</h5>
								<h5>${order.prdct_name}</h5>
							</div>
							<div class="col-md-4" align="right" style="padding: 3% 0px 0px 0px">
								<br>
								<h2>${order.order_price}원</h2>
								<!-- 배송조회페이지 URI 설정할것 -->
								<c:choose>
									<c:when test="${order.order_state_number eq 1}">
										<h4>결제대기</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 2}">
										<h4>결제완료</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 3}">
										<h4>주문요청</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 4}">
										<h4>배송대기</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 5}">
										<h4>배송중</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 6}">
										<h4>배송완료</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-success btn prdconfirm${order.order_number}" data-rno="${order.order_number}">주문확정</button><br>
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">교환요청</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">환불요청</button>
										<!-- 주문확정 버튼을 누르면 배송완료에서 주문확정 상태로 변한다 -->
										<script type="text/javascript">
											$(document).ready(function (){
												$('.prdconfirm${order.order_number}').click(function(event){
													event.preventDefault();
															
													if (confirm("주문확정 하시겠습니까?")) {
														// FormData 객체 생성
														var formData = new FormData();
																
														// button의 data-rno 값을 가져온다
														var order_number = $(this).attr("data-rno");		
														console.log("order_number: " + order_number);
													     		
												     	// formData에 해당 데이터를 append한다
												     	var form = {
												     		order_number: order_number
													    };
													    console.log("form: " + form);
													 
														$.ajax({
															type : 'POST', 
															url : $(this).attr("href"), 
															cache : false, 
															contentType:'application/json; charset=utf-8',
													        processData: false, 
													        data: JSON.stringify(form), 
													        beforeSend : function(xhr) {
																xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
													        },
															success: function(result) {
																console.log(result);
																console.log("PRDCT_STATE_CHANGED!");
																$(location).attr('href', '${pageContext.request.contextPath}/member/mypage');
															},
															error:function(e) {		
																console.log(e);
																alert("주문확정 하실 수 없습니다");
																location.reload();
															}
														})
													} else {
														location.reload();
													}
												});	
											});	
											</script>
									</c:when>
									<c:when test="${order.order_state_number eq 7}">
										<h4>주문확정</h4>
										<button type="button" class="btn btn-primary btn" onclick="window.location.href='${pageContext.request.contextPath}/member/mypage/review/${order.prdct_id}/write'">리뷰쓰기</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">교환요청</button><br>
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">환불요청</button>
									</c:when>
									<c:when test="${order.order_state_number eq 8}">
										<h4>주문취소</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소조회</button>
									</c:when>
									<c:when test="${order.order_state_number eq 9}">
										<h4>교환요청</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">교환조회</button>
									</c:when>
									<c:when test="${order.order_state_number eq 10}">
										<h4>환불요청</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">환불조회</button>
									</c:when>
									<c:otherwise>
										<h4>환불완료</h4>
									</c:otherwise>
								</c:choose>
								<%-- 모달 영역 --%> 
								<div class="modal fade myModal" id="mdal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&#88;</span></button>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<label id="tekbeCompnayName">택배회사명</label>
													<select id="tekbeCompnayList" class="form-control" name="tekbeCompnayList"></select>
												</div>
												<div>
													<label id="tekbeCompnayName">운송장번호</label>
													<input type="text" id="invoiceNumberText" class="form-control"  name="invoiceNumberText"><br/><br/>
												</div>
												<button id="myButton1" class="btn btn-primary">택배 조회하기 </button><br/><br/>
												<div>
													<table id="myPtag"></table>
												</div>
												<br/>
												<div>
													<table id="myPtag2"></table>
												</div>
											</div>
											<div class="modal-footer">
												<div align="left"></div>
											</div>
										</div>
									</div>
								</div>	
							</div>
						</div>
						<hr>
						</c:forEach>
						
						<br style="padding: 0px 0px 5% 0px">
						
						<div class="row" style="padding-left: 15px">
							<h3>최근 본 상품</h3>
						</div>
						<div class="row" style="padding: 15px 0px 0px 15px">
							<small>최근 본 상품 중 3개만 보여집니다.</small>	
						</div>
						
						<hr>
						
						<!-- 최근 본 상품내역 3개만 보여주기 -->
						<div class="row">
							<c:forEach items="${view_list}" var="watch" end="2">	
							<div class="col-md-4 thumbnail" align="center">
								<div>
									<!-- 경로 prdct_img/prdct_thumbnail로 바뀌면 수정하자... -->
									<a href="${pageContext.request.contextPath}/prdct/${watch.prdct_id}"><img src="<c:url value="/prdct_img/prdct_thumbnail/${watch.prdct_thumbnail}"/>" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="150px" height="200px"></a>
								</div>
								<div style="padding-top: 3%">
									<h5>${watch.brand_id}</h5>
									<h5>${watch.prdct_name}</h5>
								</div>
							</div>
							</c:forEach>
						</div>
						
						<hr style="padding: 0px 0px 5% 0px">
						
						<div class="row" style="padding-left: 15px">
							<h3>최근 찜한 목록</h3>
						</div>
						<div class="row" style="padding: 15px 0px 0px 15px">
							<small>최근 찜한 목록 중 3개만 보여집니다.</small>	
						</div>
						
						<hr>
						
						<!-- 최근 찜한 목록내역 3개만 보여주기 -->
						<div class="row">
							<c:forEach items="${like_prdct_list}" var="like" end="2">
							<div class="col-md-4 thumbnail" align="center">
								<div>
									<!-- 경로 prdct_img/prdct_thumbnail로 바뀌면 수정하자... -->
									<a href="${pageContext.request.contextPath}/prdct/${like.prdct_id}"><img src="<c:url value="/prdct_img/prdct_thumbnail/${like.prdct_thumbnail}"/>" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="150px" height="200px"></a>
								</div>
								<div style="padding-top: 3%">
									<h5>${like.mbr_id}</h5>
									<h5>${like.prdct_name}</h5>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>	
				</div>
			</div>
			
			<hr style="padding: 15px 0px 15px 0px;">
			
			<!-- footer -->
		<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>

		<hr>
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
</body>
</html>