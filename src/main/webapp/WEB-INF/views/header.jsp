<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>TechNova</title>
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
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
       $(document).ready(function() {
           $.ajax({
               url: '/project/cartRecord',
               method: 'GET',
               success: function(count) {
                   $('#cartItemCount').text(count);
               },
               error: function() {
                   $('#cartItemCount').text('0'); // 오류 시 0으로 표시
               }
           });
       });
   </script>

</head>

<body>

   <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__close">+</div>
        <ul class="offcanvas__widget">
            <li><span class="icon_search search-switch"></span></li>
            <li><a href="#"><span class="icon_heart_alt"></span>
                <div class="tip">2</div>
            </a></li>
            <li><a href="#"><span class="icon_bag_alt"></span>
                <div class="tip">2</div>
            </a></li>
        </ul>
        <div class="offcanvas__logo">
            <a href="/"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__auth">
            <a href="#">Login</a>
            <a href="#">Register</a>
        </div>
    </div>
    <!-- Offcanvas Menu End -->
    
   <!-- Header Section Begin -->
   <header class="header">
       <div class="container-fluid">
           <div class="row">
           
              <div class="col-sm-2">
                	<nav class="header__menu" style="height: 88px;">          	
	                	<ul>
	                        <li><a href="/" style="padding: 0 0 0 20px;"><img style="width: 30px; height: 30px;" src="${pageContext.request.contextPath}/resources/images/hd_cate.png" alt=""></a>
	                        	<ul class="dropdown" style="width: 1010px; height: 340px; margin: 33px 0 0 0; padding: 30px;">
									<ul style="display: inline-block; margin: 0 40px 0 0;">
										<li style="width: 150px; font-size: 20px; color: white; border-bottom: 1px solid var(--bs-gray-300); padding: 0 20px 10px 0; margin: 0 0 10px 0; ">
											<img style="width: 25px; height: 25px;" src="${pageContext.request.contextPath}/resources/images/nav_pc.png" alt="">
											컴퓨터
										</li>
										<li><a href="/project/list/category?category=1" style="padding: 8px 0;">전체</a></li>
										<li><a href="/project/list/category?category=11" style="padding: 8px 0;">Dell</a></li>
		                                <li><a href="/project/list/category?category=12" style="padding: 8px 0;">삼성전자</a></li>
		                                <li><a href="/project/list/category?category=13" style="padding: 8px 0;">LG전자</a></li>
		                                <li><a href="/project/list/category?category=14" style="padding: 8px 0;">HP</a></li>
		                                <li><a href="/project/list/category?category=15" style="padding: 8px 0;">Mac</a></li>
									</ul>
									<ul style="display: inline-block; margin: 0 40px 0 0;">
										<li style="width: 150px; font-size: 20px; color: white; border-bottom: 1px solid var(--bs-gray-300); padding: 0 20px 10px 0; margin: 0 0 10px 0;">
											<img style="width: 25px; height: 25px; " src="${pageContext.request.contextPath}/resources/images/nav_note.png" alt="">
											노트북
										</li>
										<li><a href="/project/list/category?category=2" style="padding: 8px 0;">전체</a></li>
		                                <li><a href="/project/list/category?category=21" style="padding: 8px 0;">MacBook</a></li>
		                                <li><a href="/project/list/category?category=22" style="padding: 8px 0;">그램</a></li>
		                                <li><a href="/project/list/category?category=23" style="padding: 8px 0;">갤럭시북</a></li>
		                                <li><a href="/project/list/category?category=24" style="padding: 8px 0;">레노버</a></li>
		                                <li><a href="/project/list/category?category=25" style="padding: 8px 0;">MSI</a></li>
									</ul>
									<ul style="display: inline-block; margin: 0 40px 0 0;">
										<li style=" width: 150px; font-size: 20px; color: white; border-bottom: 1px solid var(--bs-gray-300); padding: 0 20px 10px 0; margin: 0 0 10px 0;">
											<img style="width: 25px; height: 25px;" src="${pageContext.request.contextPath}/resources/images/nav_phone.png" alt="">
											핸드폰
										</li>
										<li><a href="/project/list/category?category=3" style="padding: 8px 0;">전체</a></li>
		                                <li><a href="/project/list/category?category=31" style="padding: 8px 0;">iPhone</a></li>
		                                <li><a href="/project/list/category?category=32" style="padding: 8px 0;">갤럭시 S</a></li>
		                                <li><a href="/project/list/category?category=33" style="padding: 8px 0;">LG</a></li>
		                                <li><a href="/project/list/category?category=34" style="padding: 8px 0;">갤럭시 A</a></li>
		                                <li><a href="/project/list/category?category=35" style="padding: 8px 0;">샤오미</a></li>
									</ul>									
									<ul style="display: inline-block; margin: 0 40px 0 0;">
										<li style=" width: 150px; font-size: 20px; color: white; border-bottom: 1px solid var(--bs-gray-300); padding: 0 20px 10px 0; margin: 0 0 10px 0;">
											<img style="width: 25px; height: 25px;" src="${pageContext.request.contextPath}/resources/images/nav_cpu.png" alt="">
											컴퓨터부품
										</li>
										<li><a href="/project/list/category?category=4" style="padding: 8px 0;">전체</a></li>
		                                <li><a href="/project/list/category?category=41" style="padding: 8px 0;">CPU</a></li>
		                                <li><a href="/project/list/category?category=42" style="padding: 8px 0;">RAM</a></li>
		                                <li><a href="/project/list/category?category=43" style="padding: 8px 0;">SSD</a></li>
		                                <li><a href="/project/list/category?category=44" style="padding: 8px 0;">HDD</a></li>
		                                <li><a href="/project/list/category?category=45" style="padding: 8px 0;">메인보드</a></li>
									</ul>
									<ul style="display: inline-block; margin: 0 0 0 0;">
										<li style="width: 150px; font-size: 20px; color: white; border-bottom: 1px solid var(--bs-gray-300); padding: 0 20px 10px 0; margin: 0 0 10px 0;">
											<img style="width: 25px; height: 25px;" src="${pageContext.request.contextPath}/resources/images/nav_etc.png" alt="">
											기타
										</li>
										<li><a href="/project/list/category?category=51" style="padding: 8px 0;">태블릿</a></li>
		                                <li><a href="/project/list/category?category=52" style="padding: 8px 0;">키보드</a></li>
		                                <li><a href="/project/list/category?category=53" style="padding: 8px 0;">마우스</a></li>
		                                <li><a href="/project/list/category?category=54" style="padding: 8px 0;">스피커</a></li>
		                                <li><a href="/project/list/category?category=55" style="padding: 8px 0;">모니터</a></li>
		                                <li><a href="/project/list/category?category=56" style="padding: 8px 0;">웹캠</a></li>
									</ul>		
	                            </ul>
	                        </li>
                        </ul>
                    </nav>
	            </div>
               
               <div class="col-sm-2">
                   <div class="header__logo">
                       <a href="/"><img style="width: 200px; height: 30px; margin: 0 0 0 30px" src="${pageContext.request.contextPath}/resources/images/logo4.JPG" alt=""></a>
                   </div>
               </div>

               
               <div class="col-sm-4" style="padding: 17px 0 0 0; height: 90px;">
                  <div class="footer__newslatter">
                       <form action="#">
                        <input type="text" id="search-input" placeholder="검색어를 입력하세요." onkeydown="checkEnter(event)">
	                        <button style="background: none;" class="site-btn" disabled><img style="height: 20px; width: 20px; background: none;" src="${pageContext.request.contextPath}/resources/images/search.png" alt=""></button>
                       </form>
                   </div>       
               </div>
               
                
               <div class="col-sm-3" style="padding: 0 10px 0 0; margin: 0 0 0 125px;">
                   <div class="header__right">
                       <div class="header__right__auth">
	                   <c:choose>
		                   <c:when test="${user!=null }">
		                   	  ${user.user_name }님 환영합니다. <a style="padding: 0 0 0 10px;" href="/project/logout">Logout</a>
			                   	<c:choose>
			                   		<c:when test="${user.user_admin == 1}">
			                   			<a href="/project/inventory">Inventory</a>
			                   		</c:when>
			                   		<c:otherwise>
			                   			<a href="/project/mypage">Mypage</a>
			                   		</c:otherwise>
			                   	</c:choose>
		                   </c:when>
		                   <c:otherwise>
			                   	로그인이 필요합니다. <a style="padding: 0 0 0 10px;" href="/project/login">Login</a>
			                   	<a href="/project/join">Register</a>
		                   </c:otherwise>
                       </c:choose>
                           
                           
                       </div>
                       <ul class="header__right__widget">
                           <li>
                           		<a href="/project/mypage"><img style="width: 18px; height: 18px; padding: 0 0 2px 0;" src="${pageContext.request.contextPath}/resources/images/mypage.png" alt=""></span></a>
                           </li>
                           <li>
                           		<a href="/project/wishlist"><span class="icon_heart_alt"></span></a>
                           </li>
                           <li>
                           		<a href="/project/cart"><span class="icon_bag_alt"></span>
	                           	   <c:choose>
					                   <c:when test="${user!=null }">
					                   		<div class="tip" id="cartItemCount"></div>
					                   </c:when>
					                   <c:otherwise>
					                   </c:otherwise>
			                       </c:choose>
                           		</a>
                           </li>
                       </ul>
                   </div>
               </div>
           </div>
           <div class="canvas__open">
               <i class="fa fa-bars"></i>
           </div>
       </div>
   </header>
   <!-- Header Section End -->
   
   <script type="text/javascript">
        function checkEnter(event) {
            if (event.key === "Enter") {
                event.preventDefault(); // 엔터키 기본 동작 막기
                var keyword = document.getElementById("search-input").value;
                if (keyword.trim() === "") {
                    alert("검색어를 입력해주세요.");
                    return;
                }
                location.href = "/project/list/search?keyword="+keyword;
            }
        }
    </script>
    
    </body>
</html>
    