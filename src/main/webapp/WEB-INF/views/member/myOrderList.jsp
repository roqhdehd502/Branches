<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Branches : My Order List</title>
	
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
  	
  	<!-- 상품 정렬 -->	
	<script type="text/javascript">
	// 출처 : http://tonks.tistory.com/79 		
	/* sortingNumber() : 숫자인 실수만으로 되어있을 때, 적용될 함수 */ 	
	function sortingNumber( a , b ) {  
	        if ( typeof a == "number" && typeof b == "number" ) return a - b; 
	
	        // 천단위 쉼표와 공백문자만 삭제하기.  
	        var a = ( a + "" ).replace( /[,\s\xA0]+/g , "" , '원'); 
	        var b = ( b + "" ).replace( /[,\s\xA0]+/g , "" , '원' ); 
	
	        var numA = parseFloat( a ) + ""; 
	        var numB = parseFloat( b ) + ""; 
	
	        if ( numA == "NaN" || numB == "NaN" || a != numA || b != numB ) return false; 
	
	        return parseFloat( a ) - parseFloat( b ); 
	} 
	
	/* changeForSorting() : 문자열 바꾸기. */ 
	function changeForSorting( first , second ) {  
	        // 문자열의 복사본 만들기. 
	        var a = first.toString().replace( /[\s\xA0]+/g , " " ); 
	        var b = second.toString().replace( /[\s\xA0]+/g , " " ); 
	
	        var change = { first : a, second : b }; 
	
	        if ( a.search( /\d/ ) < 0 || b.search( /\d/ ) < 0 || a.length == 0 || b.length == 0 ) return change; 
	
	        var regExp = /(\d),(\d)/g; // 천단위 쉼표를 찾기 위한 정규식. 
	
	        a = a.replace( regExp , "$1" + "$2" ); 
	        b = b.replace( regExp , "$1" + "$2" ); 
	
	        var unit = 0; 
	        var aNb = a + " " + b; 
	        var numbers = aNb.match( /\d+/g ); // 문자열에 들어있는 숫자 찾기 
	
	        for ( var x = 0; x < numbers.length; x++ ) { 
	                var length = numbers[ x ].length; 
	                if ( unit < length ) unit = length; 
	        } 
	
	        var addZero = function( string ) { // 숫자들의 단위 맞추기 
	                var match = string.match( /^0+/ ); 
	                if ( string.length == unit ) return ( match == null ) ? string : match + string; 
	
	                var zero = "0"; 
	
	                for ( var x = string.length; x < unit; x++ ) string = zero + string; 
	
	                return ( match == null ) ? string : match + string; 
	        }; 
	
	        change.first = a.replace( /\d+/g, addZero ); 
	        change.second = b.replace( /\d+/g, addZero ); 
	
	        return change; 
	} 
	
	/* byLocale() */ 
	function byLocale() { 
	        var compare = function( a , b ) { 
	                var sorting = sortingNumber( a , b ); 
	                if ( typeof sorting == "number" ) return sorting; 
	
	                var change = changeForSorting( a , b ); 
	                var a = change.first; 
	                var b = change.second; 
	
	                return a.localeCompare( b ); 
	        }; 
	
	        var ascendingOrder = function( a , b ){  return compare( a , b );  }; 
	        var descendingOrder = function( a , b ){  return compare( b , a );  }; 
	
	        return { ascending : ascendingOrder, descending : descendingOrder }; 
	} 
	
	
	/* replacement() */ 
	 
	function replacement( parent ){  
	        var tagName = parent.tagName.toLowerCase(); 
	        if ( tagName == "table" ) parent = parent.tBodies[ 0 ]; 
	        
	        tagName = parent.tagName.toLowerCase(); 
	        if ( tagName == "tbody" ) var children = parent.rows; 
	        else var children = parent.getElementsByTagName( "li" ); 
	
	        var replace = { 
	                order : byLocale(), 
	                index : false, 
	                array : function(){ 
	                        var array = [ ]; 
	                        for ( var x = 0; x < children.length; x++ ) array[ x ] = children[ x ]; 
	                        return array; 
	                }(), 
	                checkIndex : function( index ){ 
	                        if ( index ) this.index = parseInt( index, 10 ); 
	                        var tagName = parent.tagName.toLowerCase(); 
	                        if ( tagName == "tbody" && ! index ) this.index = 0; 
	                }, 
	                getText : function( child ){ 
	                        if ( this.index ) child = child.cells[ this.index ]; 
	                        return getTextByClone( child ); 
	                }, 
	                setChildren : function(){ 
	                        var array = this.array; 
	                        while ( parent.hasChildNodes() ) parent.removeChild( parent.firstChild ); 
	                        for ( var x = 0; x < array.length; x++ ) parent.appendChild( array[ x ] ); 
	                }, 
	                ascending : function( index ){ // 오름차순 
	                        this.checkIndex( index ); 
	                        var _self = this; 
	                        var order = this.order; 
	                        var ascending = function( a, b ){ 
	                                var a = _self.getText( a ); 
	                                var b = _self.getText( b ); 
	                                return order.ascending( a, b ); 
	                        }; 
	                        this.array.sort( ascending ); 
	                        this.setChildren(); 
	                }, 
	                descending : function( index ){ // 내림차순
	                        this.checkIndex( index ); 
	                        var _self = this; 
	                        var order = this.order; 
	                        var descending = function( a, b ){ 
	                                var a = _self.getText( a ); 
	                                var b = _self.getText( b ); 
	                                return order.descending( a, b ); 
	                        }; 
	                        this.array.sort( descending ); 
	                        this.setChildren(); 
	                } 
	        }; 
	        return replace; 
	} 
	
	function getTextByClone( tag ){  
	        var clone = tag.cloneNode( true ); // 태그의 복사본 만들기. 
	        var br = clone.getElementsByTagName( "br" ); 
	        while ( br[0] ){ 
	                var blank = document.createTextNode( " " ); 
	                clone.insertBefore( blank , br[0] ); 
	                clone.removeChild( br[0] ); 
	        } 
	        var isBlock = function( tag ){ 
	                var display = ""; 
	                if ( window.getComputedStyle ) display = window.getComputedStyle ( tag, "" )[ "display" ]; 
	                else display = tag.currentStyle[ "display" ]; 
	                return ( display == "block" ) ? true : false; 
	        }; 
	        var children = clone.getElementsByTagName( "*" ); 
	        for ( var x = 0; x < children.length; x++){ 
	                var child = children[ x ]; 
	                if ( ! ("value" in child) && isBlock(child) ) child.innerHTML = child.innerHTML + " "; 
	        } 
	        var textContent = ( "textContent" in clone ) ? clone.textContent : clone.innerText; 
	        return textContent; 
	} 
	</script>
	
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
						<div class="row" style="padding-left: 10px">
							<h3>주문내역 조회</h3>
						</div>
						
						<hr style="padding: 15px 0px 0px 0px">
						
						<div class="row">
							<table id="product" class="table">
								<thead>
							   		<tr class="table-secondary">
							   			<th colspan="2" scope="row" style="text-align: center; padding-left: 0px; padding-right: 15px;">
							   				<h4>상품정보</h4>
							   				<br>
							   			</th>
							   			<th style="text-align: center; padding-left: 0px; padding-right: 25px;">
							   				<h4>주문일</h4>
							   				<button class="btn btn-secondary btn-sm" onclick="sortTD ( 0 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▲</button>
							   				<button class="btn btn-secondary btn-sm" onclick="reverseTD ( 0 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▼</button>
							   			</th>
							   			<th style="overflow: auto; text-align: center; padding-left: 0px; padding-right: 0px;">
							   				<h4>주문번호</h4>
							   				<button class="btn btn-secondary btn-sm" onclick="sortTD ( 1 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▲</button>
							   				<button class="btn btn-secondary btn-sm" onclick="reverseTD ( 1 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▼</button>
							   			</th>
							   			<th style="text-align: center; padding-left: 15px; padding-right: 15px;">
							   				<h4>금액</h4>
							   				<button class="btn btn-secondary btn-sm" onclick="sortTD ( 2 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▲</button>
							   				<button class="btn btn-secondary btn-sm" onclick="reverseTD ( 2 )" style="padding: 0px 5px 0px 5px; margin: 0px;">▼</button>
							   			</th>
							   			<th style="text-align: center; padding-left: 15px; padding-right: 15px;">
							   				<h4>상태</h4>
							   				<br>
							   			</th>
							   		</tr>
							   	</thead>
							   	<tbody>
							   		<c:forEach items="${order_list}" var="order" varStatus="status">
								   	<tr class="table-secondary">
								   		<%-- 상품정보 --%>
								   		<td style="text-align: center; padding: 15px 0px 0px 0px;">
											<a href="${pageContext.request.contextPath}/prdct/${order.prdct_id}"><img src="/prdct_img/prdct_thumbnail/${order.prdct_thumbnail}" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="100px" height="120px"></a>
										</td>
								   		<td style="text-align: left; padding-left: 0px; padding-right: 0px;">
								   			<h4 style="padding-bottom: 5px;">${order.brand_id}</h4>
											<h6 style="max-width: 180px; padding-bottom: 5px;">${order.prdct_name}</h6>
											<h6>
												${order.order_color}&nbsp;
												(${order.order_size})
											</h6>
								   		</td>
								   		<%-- 주문일(정렬대상) --%>
								   		<td style="text-align: left; padding: 60px 0px 0px 0px;">
								   			<h6>${order.order_date}</h6>
								   		</td>
								   		<%-- 주문번호(정렬대상) --%>
								   		<td style="text-align: center; padding: 60px 0px 0px 0px;">
								   			<h6>${order.order_number}</h6>
								   		</td>
								   		<%-- 주문금액(정렬대상) --%>
								   		<td style="text-align: center; padding: 60px 0px 0px 0px;">
								   			<h6>${order.order_price}원</h6>
								   		</td>
								   		<%-- 상태 --%>
								   		<td style="text-align: center; padding-left: 0px; padding-right: 0px;">
								   			<!-- 배송조회페이지 URI 설정할것 -->
											<c:choose>
												<c:when test="${order.order_state_number eq 1}">
													<h6>결제대기</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 2}">
													<h6>결제완료</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 3}">
													<h6>주문요청</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 4}">
													<h6>배송대기</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 5}">
													<h6>배송중&nbsp;</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 6}">
													<h6>배송완료</h6>
													<span class="order_num" style="display: none;">${order.order_number}</span>
													<span class="order_stat" style="display: none;">${order.order_state_number}</span>
													<h6><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#mdal">배송조회</button></h6>
													<h6><button type="button" class="btn btn-success btn-sm prdconfirm${order.order_number}" data-rno="${order.order_number}">주문확정</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">교환요청</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">환불요청</button></h6>
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
																		$(location).attr('href', '${pageContext.request.contextPath}/member/mypage/order');
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
													<h6>주문확정</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/member/mypage/review/${order.prdct_id}/write'">리뷰쓰기</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">교환요청</button></h6>
													<h6><button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">환불요청</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 8}">
													<h6>주문취소</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">주문취소조회</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 9}">
													<h6>교환요청</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">교환조회</button></h6>
												</c:when>
												<c:when test="${order.order_state_number eq 10}">
													<h6>환불요청</h6>
													<h6><button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/'">환불조회</button></h6>
												</c:when>
												<c:otherwise>
													<h6>환불완료</h6>
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
															<div class="form-group" align="center">
																<label id="tekbeCompnayName">택배회사명</label>
																<select id="tekbeCompnayList" class="form-control" name="tekbeCompnayList"></select>
															</div>
															<div>
																<label id="tekbeCompnayName" align="center">운송장번호</label>
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
															<div align="left">
															</div>
														</div>
													</div>
												</div>
											</div>	
								   		</td>
								   	</tr>
								   	</c:forEach>
							   	</tbody>
							</table>
					</div>
					
					<!-- 페이징 -->	
					<div class="container">
						<ul class="pagination justify-content-center">
							<c:choose>
								<c:when test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:otherwise>
							</c:choose>
		
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
								<li class="page-item ${pageMaker.cri.pageNum == idx ? 'active' : '' }"><a class="page-link" href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
							</c:forEach>
		
							<c:choose>
								<c:when test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item disabled"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				
				
					<!-- <span style="border-left: 1px solid rgba(0, 0, 0, .1); width: 922px;">
						<h3 style="margin-top: 5px; margin-left: 15px; padding-bottom: 16px; border-bottom: 1px solid rgba(0, 0, 0, .1);">
							<strong style="margin: 10px;">주문내역 조회</strong>
						</h3>
	
						<div style="margin-bottom: 20px; margin-top: 20px;">
							<span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">ㄱㄴㄷ순</button></span> <span style="margin-left: 30px;"><button
									class="btn btn-primary btn-sm">abc순</button></span> <span style="margin-left: 30px;"><button class="btn btn-primary btn-sm">날짜별순</button></span> <span
								style="margin-left: 30px;"><button class="btn btn-primary btn-sm">최근구매순</button></span>
						</div>
						
						<table class="table">
							<thead style="text-align: center;">
								<tr>
									<th colspan="2"><h5>상품정보</h5></th>
									<th><h5>주문일</h5></th>
									<th><h5>주문번호</h5></th>
									<th><h5>주문금액</h5></th>
									<th><h5>상태</h5></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
								<tr>
									<td style="padding-left: 5px; padding-right: 5px;"><img src="/img/6.jpg" style="width: 120px; height: 120px;"></td>
									<td style="padding-left: 5px; padding-right: 5px; position: relative; top: 24px; border-top-width: 0px">
										<h6>Covernat</h6>
										<h6>럭비 맨투맨 네이비</h6>
										<h6>네이비 (M)</h6>
									</td>
									<td><h6 style="position: relative; top: 34px;">2021.03.19</h6></td>
									<td><h6 style="position: relative; top: 34px;">2021031111550001</h6></td>
									<td><h6 style="position: relative; top: 34px; text-align: center;">29,900₩</h6></td>
									<td>
										<h6 style="position: relative; top: 22px; margin-left: 14px;">배송시작</h6>
										<h6 style="position: relative; top: 24px; margin-left: 10px;">
											<button class="btn btn-primary btn-sm">배송조회</button>
										</h6>
									</td>
								</tr>
	
	
	
							</tbody>
						</table> -->
	
					</div>
			</div>
		</div>

		<hr>
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
		
		<script type="text/javascript">
			var myTable = document.getElementById( "product" ); 
			var replace = replacement( myTable ); 
			function sortTD( index ){    replace.ascending( index );    } 
			function reverseTD( index ){    replace.descending( index );    } 
		</script>
	</div>
</body>
</html>