<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
        <section class="content-header">
            <div class="container-fluid">
              <div class="row mb-2">
                <div class="col-sm-6">
                  <h1>제목 뭐하지</h1>
                </div>
                <div class="col-sm-6">
                  <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Top</a></li>
                    <li class="breadcrumb-item active"><a href="#">Hoody</li>
                  </ol>
                </div>
              </div>
           </div><!-- /.container-fluid -->
        </section>
        <div class="row">
            <div class="col-md-2" th:each="product : ${productList}">
                <div class="card card-outline">
                    <div class="card-body">
                        <!-- image -->
                        <div class="text-center">
                            <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.brand}">브랜드명</h3>
                                <%-- <img class="img-fluid" th:src="@{'/static/' + ${prdct.imageUrl}}" alt="상품썸네일"> --%>
                                <img class="img-fluid" src="<c:url value="/ksp/th-ex.jpg"/>" alt="상품썸네일">
                            </a>
                        </div>
                        <!-- main -->
                        <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.name}">상품명</h3>
                            <p class="text-dark text-center" th:text="${product.price}">상품금액</p>
                        </a>
                        <!-- sub -->
                        <ul class="list-group list-group-unbordered mb-1">
                            <li class="list-group-item" >
                                <i class="fas fa-star"></i> <b>찜</b> <a class="float-right">2,549</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-md-2" th:each="product : ${productList}">
                <div class="card card-outline">
                    <div class="card-body">
                        <!-- image -->
                        <div class="text-center">
                            <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.brand}">브랜드명</h3>
                                <%-- <img class="img-fluid" th:src="@{'/static/' + ${prdct.imageUrl}}" alt="상품썸네일"> --%>
                                <img class="img-fluid" src="<c:url value="/ksp/th-ex.jpg"/>" alt="상품썸네일">
                            </a>
                        </div>
                        <!-- main -->
                        <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.name}">상품명</h3>
                            <p class="text-dark text-center" th:text="${product.price}">상품금액</p>
                        </a>
                        <!-- sub -->
                        <ul class="list-group list-group-unbordered mb-1">
                            <li class="list-group-item" >
                                <i class="fas fa-star"></i> <b>찜</b> <a class="float-right">2,549</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-md-2" th:each="product : ${productList}">
                <div class="card card-outline">
                    <div class="card-body">
                        <!-- image -->
                        <div class="text-center">
                            <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.brand}">브랜드명</h3>
                                <%-- <img class="img-fluid" th:src="@{'/static/' + ${prdct.imageUrl}}" alt="상품썸네일"> --%>
                                <img class="img-fluid" src="<c:url value="/ksp/th-ex.jpg"/>" alt="상품썸네일">
                            </a>
                        </div>
                        <!-- main -->
                        <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.name}">상품명</h3>
                            <p class="text-dark text-center" th:text="${product.price}">상품금액</p>
                        </a>
                        <!-- sub -->
                        <ul class="list-group list-group-unbordered mb-1">
                            <li class="list-group-item" >
                                <i class="fas fa-star"></i> <b>찜</b> <a class="float-right">2,549</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-md-2" th:each="product : ${productList}">
                <div class="card card-outline">
                    <div class="card-body">
                        <!-- image -->
                        <div class="text-center">
                            <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.brand}">브랜드명</h3>
                                <%-- <img class="img-fluid" th:src="@{'/static/' + ${prdct.imageUrl}}" alt="상품썸네일"> --%>
                                <img class="img-fluid" src="<c:url value="/ksp/th-ex.jpg"/>" alt="상품썸네일">
                            </a>
                        </div>
                        <!-- main -->
                        <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.name}">상품명</h3>
                            <p class="text-dark text-center" th:text="${product.price}">상품금액</p>
                        </a>
                        <!-- sub -->
                        <ul class="list-group list-group-unbordered mb-1">
                            <li class="list-group-item" >
                                <i class="fas fa-star"></i> <b>찜</b> <a class="float-right">2,549</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-md-2" th:each="product : ${productList}">
                <div class="card card-outline">
                    <div class="card-body">
                        <!-- image -->
                        <div class="text-center">
                            <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.brand}">브랜드명</h3>
                                <%-- <img class="img-fluid" th:src="@{'/static/' + ${prdct.imageUrl}}" alt="상품썸네일"> --%>
                                <img class="img-fluid" src="<c:url value="/ksp/th-ex.jpg"/>" alt="상품썸네일">
                            </a>
                        </div>
                        <!-- main -->
                        <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.name}">상품명</h3>
                            <p class="text-dark text-center" th:text="${product.price}">상품금액</p>
                        </a>
                        <!-- sub -->
                        <ul class="list-group list-group-unbordered mb-1">
                            <li class="list-group-item" >
                                <i class="fas fa-star"></i> <b>찜</b> <a class="float-right">2,549</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-md-2" th:each="product : ${productList}">
                <div class="card card-outline">
                    <div class="card-body">
                        <!-- image -->
                        <div class="text-center">
                            <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.brand}">브랜드명</h3>
                                <%-- <img class="img-fluid" th:src="@{'/static/' + ${prdct.imageUrl}}" alt="상품썸네일"> --%>
                                <img class="img-fluid" src="<c:url value="/ksp/th-ex.jpg"/>" alt="상품썸네일">
                            </a>
                        </div>
                        <!-- main -->
                        <a th:href="@{/product/view/detail}">
                            <p class="text-dark text-center" th:text="${prdct.name}">상품명</h3>
                            <p class="text-dark text-center" th:text="${product.price}">상품금액</p>
                        </a>
                        <!-- sub -->
                        <ul class="list-group list-group-unbordered mb-1">
                            <li class="list-group-item" >
                                <i class="fas fa-star"></i> <b>찜</b> <a class="float-right">2,549</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

		
    </section>
</div>
</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>