<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<meta charset="UTF-8">
<title>TechNova</title>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

<%@ include file="header.jsp" %>

	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="height: ;">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <a href="/"><img style="height: ;" src="${pageContext.request.contextPath}/resources/images/a.PNG" class="d-block w-100" alt="..."></a>
	    </div>
	    <div class="carousel-item">
	      <a href="/"><img style="height: ;" src="${pageContext.request.contextPath}/resources/images/a2.PNG" class="d-block w-100" alt="..."></a>
	    </div>
	    <div class="carousel-item">
	      <a href="/"><img style="height: ;" src="${pageContext.request.contextPath}/resources/images/a3.PNG" class="d-block w-100" alt="..."></a>
	    </div>
	    <div class="carousel-item">
	      <a href="/"><img style="height: ;" src="${pageContext.request.contextPath}/resources/images/a4.PNG" class="d-block w-100" alt="..."></a>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>


	<section class="product spad">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-4 col-md-4">
	                <div class="section-title">
	                    <h4>신제품</h4>
	                </div>
	            </div>
	            <div class="col-lg-8 col-md-8">
	                <ul class="filter__controls">
	                    <li class="active" data-filter="*">전체</li>
	                    <li data-filter=".pc_notebook">컴퓨터/노트북</li>
	                    <li data-filter=".phone">휴대폰</li>
	                    <li data-filter=".cpu">컴퓨터부품</li>
	                    <li data-filter=".etc">기타</li>
	                </ul>
	            </div>
	        </div>
	        <div class="row property__gallery">
		        <c:forEach var="newList" items="${newList}">
		        	<div class="col-lg-3 col-md-4 col-sm-6 mix pc_notebook">
		                <div class="product__item">
		                	<c:forEach var="newList_image" items="${newList_image}">
		                        <c:if test="${newList_image.file_connection_id == newList.product_id}">
				                    <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/images/${newList_image.file_name}">
				                    
				                    	<c:choose>
				                    		<c:when test="${newList.product_remain < 1}">
				                    			<div class="label stockout">out of stock</div>
				                    		</c:when>
				                    		<c:otherwise>
				                    			<div class="label new">New</div>
				                    		</c:otherwise>
				                    	</c:choose>
				                    
				                        <ul class="product__hover">
				                            <li><a href="${pageContext.request.contextPath}/images/${newList_image.file_name}" class="image-popup"><span class="arrow_expand"></span></a></li>
				                            <li><a href="javascript:void(0);" onclick="wishListAdd('${newList.product_id}');"><span class="icon_heart_alt"></span></a></li>
				                            <li><a href="/project/cart_register?product_id=${newList.product_id}&amount=1"><span class="icon_bag_alt"></span></a></li>
				                        </ul>
				                    </div>
		                    	</c:if>
	                    	</c:forEach>
	                    	
		                    <div class="product__item__text">
		                        <h6><a href="/project/product_detail?product_id=${newList.product_id}">${newList.product_name}</a></h6>
		                        <div class="rating">
                                    	<c:choose>
                                    		<c:when test="${newList.avgScore < 0.25}">
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${newList.avgScore < 0.75}">
                                    			<i class="fa fa-star-half-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${newList.avgScore < 1.25}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${newList.avgScore < 1.75}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-half-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${newList.avgScore < 2.25}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${newList.avgScore < 2.75}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-half-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${newList.avgScore < 3.25}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${newList.avgScore < 3.75}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-half-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${newList.avgScore < 4.25}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${newList.avgScore < 4.75}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-half-o"></i>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    		</c:otherwise>
                                    	</c:choose>
                                        </div>
		                        <div class="product__price">&#8361; <fmt:formatNumber value="${newList.product_price}" pattern="#,###" /></div>
		                    </div>
		                </div>
		            </div>
		        </c:forEach>
	        </div>
	    </div>
	</section>




	<section class="banner set-bg" data-setbg="${pageContext.request.contextPath}/resources/images/card.png">
	    <div class="container">
	        <div class="row">
	            <div class="col-xl-7 col-lg-8 m-auto">
	                <div class="banner__slider owl-carousel">
	                    
	                </div>
	            </div>
	        </div>
	    </div>
	</section>


	<section class="trend spad">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12 col-md-12 col-sm-18">
	                <div class="trend__content">
	                    <div class="section-title">
	                        <h4>인기 상품</h4>
	                    </div>
	                    
						<c:forEach var="bestList" items="${bestList}" varStatus="status">
							<c:if test="${status.index % 3 == 0}">
								<br>
							</c:if>
					       <div class="trend__item" style="display: inline-block; margin: 0 25px 40px 0; width: 30%;"> 
		                        <div class="trend__item__pic">
			                        <c:forEach var="bestList_image" items="${bestList_image}">
				                        <c:if test="${bestList_image.file_connection_id == bestList.product_id}">
				                            <img style="width: 90px; height: 90px;" src="${pageContext.request.contextPath}/images/${bestList_image.file_name}" alt="">
				                    	</c:if>
		                    		</c:forEach>
		                        </div>
		                        <div class="trend__item__text">
		                            <a href="/project/product_detail?product_id=${bestList.product_id}" style="text-decoration: none;"><h6>${bestList.product_name}</h6></a>
										<div class="rating">
	                                    	<c:choose>
	                                    		<c:when test="${bestList.avgScore < 0.25}">
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    		</c:when>
	                                    		<c:when test="${bestList.avgScore < 0.75}">
	                                    			<i class="fa fa-star-half-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    		</c:when>
	                                    		<c:when test="${bestList.avgScore < 1.25}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    		</c:when>
	                                    		<c:when test="${bestList.avgScore < 1.75}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star-half-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    		</c:when>
	                                    		<c:when test="${bestList.avgScore < 2.25}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    		</c:when>
	                                    		<c:when test="${bestList.avgScore < 2.75}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star-half-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    		</c:when>
	                                    		<c:when test="${bestList.avgScore < 3.25}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    		</c:when>
	                                    		<c:when test="${bestList.avgScore < 3.75}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star-half-o"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    		</c:when>
	                                    		<c:when test="${bestList.avgScore < 4.25}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star-o"></i>
	                                    		</c:when>
	                                    		<c:when test="${bestList.avgScore < 4.75}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star-half-o"></i>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    		</c:otherwise>
	                                    	</c:choose>
                                        </div>
		                            <div class="product__price">&#8361; <fmt:formatNumber value="${bestList.product_price}" pattern="#,###" /></div>
		                        </div>
		                    </div>
		        		</c:forEach>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	
	<%@ include file="instagram.jsp" %>
	<%@ include file="footer.jsp" %>
	
</body>
</html>