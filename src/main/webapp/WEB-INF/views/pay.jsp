<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<meta charset="UTF-8">
<title>결제</title>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
    
    
<script>
	function windowOpen() { 
		var url = "/project/address_select"
		window.open(url, "a", "width=1000, height=800, left=100, top=50"); 
		}
</script>  

<style>
	.top__text__center {
        font-size: 16px;
        color: $heading-color;
        font-weight: 600;
        float: center;
      }
</style>
    
</head>

<body>
    
    <%@ include file="header.jsp" %>

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div style="text-align: center; margin: 0 0 50px 0;">
                        	<h4 style="font-weight: bold;">구매</h4>
                    </div>
                </div>
            </div>
            <form action="/project/pay" method="post" class="checkout__form">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>이름 <span>*</span></p>
                                    <input type="text" value="${user.user_name}" readonly>
                                </div>
                            </div>
                            
                            
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>전화번호 <span>*</span></p>
                                    <input type="text" value="${user.user_phone }" readonly>
                                </div>
                                <div class="checkout__form__input">
                                    <p>이메일 <span>*</span></p>
                                    <input type="text" value="${user.user_email }" readonly>
                                </div>
                                <div class="checkout__form__input">
                                    <p> 받는사람 <span>*</span></p>
                                    <input type="text" id="buy_receive" name="buy_receive" value="${user.user_name}">
                                </div>
                                
                                <div class="checkout__form__input">
                                    <p>주소 <span>*</span> <button type="button" style=" margin: 0 0 0 10px; padding: 5px 10px; font-size: 12px;" class="site-btn" onclick="windowOpen()">배송지 선택</button></p>
                                    <div style="display: inline;">
	                                    <input type="text" id="buy_address" name="buy_address" placeholder="Street Address" value="${address.address_content }" readonly>
                                    </div>
                                </div>
                                <br><br><br>
                            </div>
                            
                            
                            
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="checkout__order">
                                <h5>주문서</h5>
                                <div class="checkout__order__product">
                                    <ul>
                                        <li>
                                            <span class="top__text">구매제품</span>
                                        </li>
                                        
                                        <c:set var = "total" value = "0" />
                                        
                                        <c:forEach var="cart" items="${list }" varStatus="status">
                                        <li>
                                        	${cart.cart_productname} &nbsp;&nbsp;/&nbsp;&nbsp; ${cart.cart_amount }개
                                        </li>
                                        
                                        <c:set var= "total" value="${total + cart.product_price * cart.cart_amount}"/>
                                        
                                        </c:forEach>
                                        
                                        
                                    </ul>
                                </div>
                                <div class="checkout__order__total">
                                    <ul>
                                        <li>총합 <span>&#8361; <fmt:formatNumber value="${total}" pattern="#,###" /></span></li>
                                        <li>할인 ( ${grade.grade_discount}&#37; ) <span style="color: gray;">- &#8361; <fmt:formatNumber value="${(grade.grade_discount*total)/100 }" pattern="#,###" /></span></li>
                                        <li>총합(할인적용) <span>&#8361; <fmt:formatNumber value="${total-(grade.grade_discount*total)/100}" pattern="#,###" /></span></li>
                                    </ul>
                                </div>
                                <div class="checkout__order__widget">
                                	<p> 회원등급 ${grade.grade_name }로 ${grade.grade_discount }&#37; 할인 혜택을 받았습니다.</p><br>
                                <button type="submit" class="site-btn">구매</button>
                                <br><br>
                                <button type="button" onclick="location.href='/project/cart'" class="site-btn"> 돌아가기 </button>
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

        <!-- Js Plugins -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
        
    </body>

    </html>