<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
</head>

<body>
    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row" style="margin: 0 0 0 0;">
                <div class="col-sm-5" style="margin: 0 100px 0 50px;">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="/"><img style="width: 200px; height: 30px; margin: 0 0 0 0;" src="${pageContext.request.contextPath}/resources/images/logo4.JPG" alt=""></a>
                        </div>
                        <p>테크노바는 "기술"과 "혁신" 이라는 뜻으로 신제품을 가장 빠르게 접하고 혁신적인 가격으로 구매할 수 있는 전자기기 온라인 쇼핑몰 사이트입니다.</p>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="footer__widget">
                        <h6>만든 이</h6>
                        <ul>
                            <li>김윤호</li>
                            <li>허준혁</li>
                            <li>김은혜</li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="footer__widget">
                        <h6>고객센터</h6>
                        <ul>
                            <li>02-1234-1234</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <div class="footer__copyright__text">
                        <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by 떡잎방범대</p>
                    </div>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->
    
    <!-- 찜 추가 -->
    <script type="text/javascript">
	    function wishListAdd(product_id) {
	        $.ajax({
	            url: '/project/wishlist/add',
	            method: 'GET',
	            data: {product_id: product_id},
	            success: function() {
					alert("관심목록에 추가되었습니다!");
	            },
	            error: function() {
					alert("로그인이 필요합니다.");
					location.href="/project/login";
	            }
	        });
	    }
    </script>
    
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
    