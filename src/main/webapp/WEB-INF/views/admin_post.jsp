<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
  
    
<script>
	function windowOpen() { 
		var url = "/project/address_select"
		window.open(url, "a", "width=1000, height=800, left=100, top=50"); 
		}
</script>  
    
    
</head>

<body>

    <%@ include file="header.jsp" %>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>Shopping cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
               
            </div>
            <form action="/project/product_register" method="post" class="checkout__form">
                <div class="row">
                    <div class="col-lg-8">
                        <h5>Upload New Product</h5>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>Product ID <span>*</span></p>
                                    <input type="text" id="product_id" name="product_id">
                                </div>
                            </div>
                            
                            
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>Product Name <span>*</span></p>
                                    <input type="text" id="product_name" name="product_name">
                                </div>
                                <div class="checkout__form__input">
                                    <p>Product Price <span>*</span></p>
                                    <input type="text" id="product_price" name="product_price">
                                </div>
                            </div>
                            <div class="col-lg-3">
                            	<div class="checkout__form__input">
                                    <p> Product Category <span>*</span></p>
                                    <input type="number" id="product_category" name="product_category" value="1" min="1">
                            	</div>
                            	<div class="checkout__form__input">
                                    <p> Product Amount <span>*</span></p>
                                    <input type="text" id="product_remain" name="product_remain" value="1">
                            	</div>
                            </div>
                            
                            <div class="col-lg-12">
                            
                                <div class="checkout__form__input">
                                    <p>Product Content <span>*</span></p>
                                    <textarea id="product_content" name="product_content" cols="81" rows="10"></textarea>
                                </div><br>
                                
                            </div> 
                            
                            <div class="col-lg-12">
                                
                                    
                                    
                                    
                                    
                                    <div class="checkout__form__input">
										<p>파일 업로드 <span>*</span></p>
										<!-- 
										<input type="button" value="파일 추가" onClick="fn_addFile()"><br>
										<div id="d_file"></div>  -->
										<input type="file" multiple="multiple" name="files">
									</div>
                                    
                                    
                                    
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="checkout__order">
                                <h5>Your order</h5>
                                <div class="checkout__order__product">
                                    <ul>
                                        <li>
                                            <span class="top__text">Product</span>
                                            <span class="top__text__right">Total</span>
                                        </li>
                                        
                                        <!-- 
                                        <li>01. Chain buck bag <span>$ 300.0</span></li>
                                        <li>02. Zip-pockets pebbled<br /> tote briefcase <span>$ 170.0</span></li>
                                        <li>03. Black jean <span>$ 170.0</span></li>
                                        <li>04. Cotton shirt <span>$ 110.0</span></li>
                                         -->
                                        
                                        
                                        <c:set var = "total" value = "0" />
                                        
                                        <c:forEach var="cart" items="${list }" varStatus="status">
                                        <li>${status.index+1}. ${cart.cart_productname} <span>&#8361; <fmt:formatNumber value="${cart.product_price * cart.cart_amount}" pattern="#,###" /></span></li>
                                        
                                        <c:set var= "total" value="${total + cart.product_price * cart.cart_amount}"/>
                                        
                                        </c:forEach>
                                        
                                        
                                    </ul>
                                </div>
                                <div class="checkout__order__total">
                                    <ul>
                                        <li>Subtotal <span>&#8361; <fmt:formatNumber value="${total}" pattern="#,###" /></span></li>
                                        <li>Total <span>&#8361; <fmt:formatNumber value="${total}" pattern="#,###" /></span></li>
                                    </ul>
                                </div>
                                <div class="checkout__order__widget">
                                    <label for="o-acc">
                                        Create an acount?
                                        <input type="checkbox" id="o-acc">
                                        <span class="checkmark"></span>
                                    </label>
                                    <p>Create am acount by entering the information below. If you are a returing customer
                                    login at the top of the page.</p>
                                    <label for="check-payment">
                                        Cheque payment
                                        <input type="checkbox" id="check-payment">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="paypal">
                                        PayPal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">등록</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

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