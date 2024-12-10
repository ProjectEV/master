<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<meta charset="UTF-8">
<title>관심목록</title>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

	<%@ include file="header.jsp" %>

    <section class="product spad">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-4 col-md-4">
	                <div class="section-title">
	                    <h4>관심목록</h4>
	                </div>
	            </div>
	        </div>
	        <div class="row property__gallery">
		        <c:forEach var="product" items="${products}">
		        	<div class="col-lg-3 col-md-4 col-sm-6 mix pc_notebook">
		                <div class="product__item">
		                
		                	<c:forEach var="imageList" items="${imageList}">
		                        <c:if test="${imageList.file_connection_id == product.product_id}">
				                    <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/images/${imageList.file_name}">
				                        <ul class="product__hover">
				                            <li><a href="${pageContext.request.contextPath}/images/${imageList.file_name}" class="image-popup"><span class="arrow_expand"></span></a></li>
				                            <li><a href="/project/wishlist/delete?product_id=${product.product_id}" style="background-color: #ca1515;"><span style="color: white;" class="icon_heart_alt"></span></a></li>
				                            <li><a href="/project/cart_register?product_id=${product.product_id}&amount=1"><span class="icon_bag_alt"></span></a></li>
				                        </ul>
				                    </div>
		                    	</c:if>
	                    	</c:forEach>
	                    	
		                    <div class="product__item__text">
		                        <h6><a href="/project/detail?product_id=${product.product_id}">${product.product_name}</a></h6>
		                        <div class="rating">
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                        </div>
		                        <div class="product__price">&#8361; <fmt:formatNumber value="${product.product_price}" pattern="#,###" /></div>
		                    </div>
		                </div>
		            </div>
		        </c:forEach>
	        </div>
	    </div>
	</section>

	<%@ include file="instagram.jsp" %>
	<%@ include file="footer.jsp" %>
</body>
</html>