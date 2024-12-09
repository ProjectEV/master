<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zxx">
<meta charset="UTF-8">
<title>TechNova</title>
<head>

<script>
	function windowOpen2() { 
		var url = "product_update?product_id=${product.product_id}"
		window.open(url, "a", "width=1000, height=800, left=100, top=50"); 
		}
</script>
<style>
.product_add_input {
  margin-bottom: 30px;

  h6 {
    color: $heading-color;
    font-weight: 600;
    text-transform: uppercase;
    margin-bottom: 25px;
  }

  form {
    position: relative;
    margin-bottom: 30px;
    margin-left: 280px;

    input {
      height: 52px;
      width: 115px;
      border: 1px solid #e1e1e1;
      border-radius: 50px;
      padding-left: 30px;
      font-size: 14px;
      color: #666666;
      

      &::placeholder {
        color: #666666;
      }
    }

    button {
      position: absolute;
      height: 52px;
      right: 30px;
      background-color: #49516b;
    }
  }
}
</style>

</head>

<body>
    
    <%@ include file="header.jsp" %>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="/"><i class="fa fa-home"></i> Home </a>
                        <a href="/project/inventory"> 재고관리 </a>
                        <span> 카테고리 : ${product.product_category} </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__left product__thumb nice-scroll">
                        	<c:forEach var="file_name" items="${file_name}" varStatus="status">
                        		<a class="pt active" href="#product-${status.index + 1}">
	                                <img src="${pageContext.request.contextPath}/images/${file_name}" alt="">
	                            </a>
                        	</c:forEach>
                        </div>
                        
                        
                        <div class="product__details__slider__content">
                            <div class="product__details__pic__slider owl-carousel">
	                            <c:forEach var="file_name" items="${file_name}" varStatus="status">
                                	<img data-hash="product-${status.index + 1}" class="product__big__img" src="${pageContext.request.contextPath}/images/${file_name}" alt="">
	                        	</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product__details__text">
                        <h3>${product.product_name} <span>SAMSUNG</span></h3>
                        
                        <!-- 별점, 상품평 갯수 표시 -->
                        <div class="rating">
										<c:choose>
                                    		<c:when test="${product.avgScore < 0.25}">
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${product.avgScore < 0.75}">
                                    			<i class="fa fa-star-half-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${product.avgScore < 1.25}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${product.avgScore < 1.75}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-half-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${product.avgScore < 2.25}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${product.avgScore < 2.75}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-half-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${product.avgScore < 3.25}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${product.avgScore < 3.75}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-half-o"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${product.avgScore < 4.25}">
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star"></i>
                                    			<i class="fa fa-star-o"></i>
                                    		</c:when>
                                    		<c:when test="${product.avgScore < 4.75}">
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
                            <span>( ${totalReview} reviews )</span>
                        </div>
                        <div class="product__details__price">&#8361; <fmt:formatNumber value="${product.product_price}" pattern="#,###" /></div>
                        <p>${product.product_content}</p>
                        <div class="product__details__button">
                        
                        
                        
                        
                            <a href="product_delete?product_id=${product.product_id}" class="cart-btn" > 제품 삭제 </a>
                            <a href="product_update?product_id=${product.product_id}" class="cart-btn" > 제품 수정 </a>
                            
                            
			                    <div class="product_add_input">
			                        <form action="/project/product_add" method="post">
			                            <input type="number" class="quantity-input pro-qty" name="product_add"  value="1" min="1" size="15">
			                            <input type="hidden" name="product_id" value="${product.product_id}" />
			                            <button type="submit" class="site-btn">수량 추가</button>
			                        </form>
			                        
			                    </div>
                            
                            
                            
                            
                            
                        </div>
                        <div class="product__details__widget">
                            <ul>
                            	<li>
                                    <span>제품 코드:</span>
                                    <p>${product.product_id }</p>
                                </li>
                            	<li>
                                    <span>재고:</span>
                                    <p>${product.product_remain }</p>
                                </li>
                                <li>
                                    <span>누적판매량:</span>
                                    <p>${product.product_sales }</p>
                                </li>
                                <li>
                                    <span> 목록으로: </span>
                                    <a href="/project/backToList?product_id=${product.product_id }"> backToList </a>
                                </li>
                                
                            
                              
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상품설명</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">상품스펙</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">상품평</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <h6>상품설명</h6>
                                <p>${product.product_content}</p>

                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <h6>상품스펙</h6>
                                <p>${product.product_content}</p>

                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <h6>상품평</h6>
                                <div>
                                
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </section>
    <!-- Product Details Section End -->

    <%@ include file="instagram.jsp" %>

<%@ include file="footer.jsp" %>

</body>

</html>