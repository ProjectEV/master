<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품등록</title>  
	<meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
	<link rel="stylesheet"
		href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_APP_KEY&libraries=services"></script>
	<script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    
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

<%@ include file="head.jsp" %>
    
<script>
   function windowOpen() { 
      var url = "/project/address_select"
      window.open(url, "a", "width=1000, height=800, left=100, top=50"); 
      }
</script>  
    
</head>

<body>

    <%@ include file="header.jsp" %>

    <!-- Checkout Section Begin -->
    <section class="checkout spad" style="margin-left: 350px;">
        <div class="container">
            <div class="row">
               
            </div>
            <form action="/project/product_register" method="post" class="checkout__form" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-lg-8">
                        <div style="text-align: center; margin: 0 0 50px 0;">
                        	<h4 style="font-weight: bold;">제품등록</h4>
                      	</div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>제품 ID <span>*</span></p>
                                    <input type="text" id="product_id" name="product_id">
                                </div>
                            </div>
                            
                            
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>제품명 <span>*</span></p>
                                    <input type="text" id="product_name" name="product_name">
                                </div>
                                <div class="checkout__form__input">
                                    <p>제품가격 <span>*</span></p>
                                    <input type="text" id="product_price" name="product_price">
                                </div>
                            </div>
                            <div class="col-lg-3">
                               <div class="checkout__form__input">
                                    <p> 제품 카테고리 <span>*</span></p>
                                    <input type="number" id="product_category" name="product_category" value="1" min="1">
                               </div>
                               <div class="checkout__form__input">
                                    <p> 제품수량 <span>*</span></p>
                                    <input type="text" id="product_remain" name="product_remain" value="1">
                               </div>
                            </div>
                            
                            <div class="col-lg-12">
                            
                                <div class="checkout__form__input">
                                    <p>제품설명 <span>*</span></p>
                                    <textarea style="padding: 10px;" id="product_content" name="product_content" cols="81" rows="10"></textarea>
                                </div><br>
                                
                            </div> 
                            
                            <div class="col-lg-12">
                                    <div class="checkout__form__input">
		                              	<p class="form-label">사진 등록 <span></span></p>
							      	    <div class="mb-3">
										  <input style="height: 35px; padding-left: 12px;" class="form-control" type="file" id="formFile" multiple="multiple" name="files">
										</div>
                           			</div>
                                    
                                   <div style="margin: 40px 0 60px 300px; "> 
                                       <button type="submit" class="site-btn">등록</button>
                                   </div> 
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

        <%@ include file="instagram.jsp" %>
        <%@ include file="footer.jsp" %>
</body>

</html>