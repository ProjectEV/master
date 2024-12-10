<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<meta charset="UTF-8">
<title>재고관리</title>
<head>
  
<style>
.paging {
	text-align: center;
	font-size: 18px;
}

.shop__cart__table1 {
    margin-bottom: 30px;

    table {
        width: 100%;
    }

    thead {
        border-bottom: 1px solid #f2f2f2;

        th {
            font-size: 18px;
            color: $heading-color;
            font-weight: 600;
            text-transform: uppercase;
            padding-bottom: 20px;
        }
        
        th:not(.product_header) {
        	text-align: center;
        }
    }

    tbody {

        tr {
            border-bottom: 1px solid #f2f2f2;
			
            td {
                padding: 10px 0;
            }
            
			.rating {

                        i {
                            font-size: 10px;
                            color: #e3c01c;
                            margin-right: -4px;
                        }
                    }
                    
            .cart__product__item1 {
                overflow: hidden;
                width: 340px;
                

                img {
                    float: left;
                    margin-right: 50px;
                    object-fit: cover;
                }

                .cart__product__item__title {
                    overflow: hidden;
                    padding-top: 16px;
                    

                    h6 {
                        color: $heading-color;
                        font-weight: 600;
                        overflow : hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                    }

                    
                }
            }

            .cart__price {
                font-size: 16px;
                color: $primary-color;
                font-weight: 600;
                width: 190px;
            }

            .cart__quantity {
                width: 190px;

                .pro-qty {
                    border: none;
                    padding: 0;
                    width: 110px;
                    border-radius: 0;

                    input {
                        color: #444444;
                    }

                    .qtybtn {
                        font-size: 16px;
                        color: #444444;
                    }
                }
            }

            .cart__total {
                font-size: 16px;
                color: $primary-color;
                font-weight: 600;
                width: 150px;
            }

            .cart__close {
                text-align: right;

                span {
                    height: 45px;
                    width: 45px;
                    background: #f2f2f2;
                    border-radius: 50%;
                    font-size: 18px;
                    color: $heading-color;
                    line-height: 44px;
                    text-align: center;
                    display: inline-block;
                    font-weight: 600;
                    cursor: pointer;
                }
            }
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
                        <a href="/"><i class="fa fa-home"></i> 홈</a>
                        <a href="/">관리자 페이지</a>
                        <span> 재고관리 </span>
                        <span style="width: 230px"></span>
                        <button style="margin: 0 5px;" type="submit" class="site-btn" onclick="location.href='/project/inventory'">재고관리</button>
                        <button style="margin: 0 5px;" type="submit" class="site-btn" onclick="location.href='/project/sales'">구매목록</button>
                        <button style="margin: 0 5px;" type="submit" class="site-btn" onclick="location.href='/project/cancel'">취소목록</button>
                        <button style="margin: 0 5px;" type="submit" class="site-btn" onclick="location.href='/project/admin_inquiry'">상품문의관리</button>
                        <button style="margin: 0 5px;" type="submit" class="site-btn" onclick="location.href='/project/product_register'">제품등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Cart Section Begin -->
    <section class="shop-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shop__cart__table1">
                        <table>
                            <thead>
                                <tr>
                                    <th width="45%" class="product_header">Product</th>
                                    <th>Review</th>
                                    <th width="25%">Price</th>
                                    <th width="10%">Remain</th>
                                    <th width="10%">Sales</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            
                            <c:set var = "total" value = "0" />
                            
                           
                            <c:forEach var="product" items="${list }" varStatus="status">
                            <c:forEach var="imageList" items="${imageList}">
                                     	<c:if test="${imageList.file_connection_id == product.product_id}">
		 						<tr>
                                    <td class="cart__product__item1">
                                    
                                    	<a href="product_detail?product_id=${product.product_id}"> <img src="${pageContext.request.contextPath}/images/${imageList.file_name}" alt="" height="70px" width="70px"> </a>
                                        <div class="cart__product__item__title">
                                            <a href="inventory_detail?product_id=${product.product_id}" class="product_name_ellipsis" style="text-decoration: none;"><h6>${product.product_name}</h6></a>
                                            <div>${product.product_id}</div>
                                            
                                        </div>
                                    </td>
                                    	
                                    <td>
                                    	<div class="rating" align="center">
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
                                        </div>
                                    </td>
                                    
                                    <td class="cart__price" style="color: #ca1515;" align="center">&#8361; <fmt:formatNumber value="${product.product_price}" pattern="#,###" /></td>
                                    <td class="cart__quantity" align="center">
                                        <div>
                                        	<c:choose>
	                                        	<c:when test="${product.product_remain == 0}">
	                                        	매진
	                                        	</c:when>
	                                        	<c:otherwise>
	                                        	${product.product_remain}
	                                        	</c:otherwise>
                                        	</c:choose>
                                        </div>
                                    </td>
                                    <td class="cart__quantity" align="center"> <fmt:formatNumber value="${product.product_sales}" pattern="#,###" /></td>
                                </tr>
                                
                                
                                <c:set var= "total" value="${total + product.product_price * product.product_remain}"/>
                                
                            </c:if>
                            </c:forEach>    
							</c:forEach>
                            
                            
                            
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            	<div class="pagination__option paging">
            		
            		<c:choose>
            			<c:when test="${pageListNUM>1}">
							<a href="inventory?pageListNUM=${pageListNUM-1}&pageNUM=${pageListNUM*10-10}"> &lt; </a>
						</c:when>
						<c:otherwise>
							<a style="color:lightgray;"> &lt; </a> 
						</c:otherwise>
            		</c:choose>
	                &nbsp;
							  	
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
					
						<c:choose>
							<c:when test="${i == 1 && param.pageNUM == null }">
								<a href="inventory?pageListNUM=${pageListNUM }&pageNUM=${i }" style="color: #ca1515;"> ${i } </a>
							</c:when>
							<c:when test="${i == param.pageNUM }">
								<a href="inventory?pageListNUM=${pageListNUM }&pageNUM=${i }" style="color: #ca1515;"> ${i } </a>
							</c:when>
							<c:otherwise>
								<a href="inventory?pageListNUM=${pageListNUM }&pageNUM=${i }" > ${i } </a>
							</c:otherwise>
						</c:choose>
						&nbsp;
					
					</c:forEach>
							  
					<c:choose>
            			<c:when test="${pageListNUM<(totalPage/10)}">
							<a href="inventory?pageListNUM=${pageListNUM+1}&pageNUM=${pageListNUM*10+1}"> &gt; </a>
						</c:when>
						<c:otherwise>
							<a style="color:lightgray;"> &gt; </a> 
						</c:otherwise>
            		</c:choose>
                </div>
                <br><br><br>
                
                <!-- 
            <div class="row">
                <div class="col-sm-3">
                    <div class="cart__btn">
                        <a href="/project/product_register"> Upload New Product </a>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="cart__btn">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="cart__total__procced">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span>&#8361; <fmt:formatNumber value="${total}" pattern="#,###" /></span></li>
                            <li>Total <span>&#8361; <fmt:formatNumber value="${total}" pattern="#,###" /></span></li>
                        </ul>
                        <a href="/project/pay" class="primary-btn">Proceed to checkout</a>
                    </div>
                </div>
            </div>  -->
    </section> 
    <!-- Shop Cart Section End -->

    <%@ include file="instagram.jsp" %>
    <%@ include file="footer.jsp" %>

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->

    
</body>

</html>