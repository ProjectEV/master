<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 관리</title>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
</head>
<body>

	<div style="padding: 50px">
		<div>
			<h4 style="text-align: center; font-weight: bold;">배송지 관리</h4>
		</div>
		
		<div style="text-align: right;">
			<button class="site-btn" style="display:inline; margin: 0 0 50px 0" id="nav-btn" onclick="location.href='/project/address_manage/add'">배송지 추가</button>
		</div>

	    <div class="contact__address">
	        <ul>
	        	<c:forEach var="address" items="${list}">
		            <li style="margin: 40px 0;">
		            	<c:if test="${address.address_main == 1}">
		            		<div style="display: inline; ">
		            			<h6 style="display: inline; color: #ca1515; font-size: 12px; font-weight: bold;">*기본배송지</h6>
 			 			    </div>
	      			 	</c:if>
		                <h6 style="display: inline; margin: 0 5px 0 0;"><i class="fa fa-map-marker"></i>${address.address_name}</h6>
		                <button style="padding: 5px 10px; font-size: 11px; margin: 0 2px 5px 0;" class="site-btn" id="nav-btn" onclick="location.href='address_manage/update?address_no=${address.address_no}'">수정</button>
					    <button style="padding: 5px 10px; font-size: 11px; margin: 0 2px 5px 0;" class="site-btn" id="nav-btn" onclick="location.href='address_manage/delete?address_no=${address.address_no}'">삭제</button><br>
		                <p>${address.address_content}</p>
		            </li>
	            </c:forEach>
	            
	        </ul>
	    </div> 
	</div>


    
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