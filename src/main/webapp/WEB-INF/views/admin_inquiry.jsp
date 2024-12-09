<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">
<meta charset="UTF-8">
<title>TechNova</title>
<head>
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
                        <span> 상품문의관리 </span>
                        <span style="width: 30px"></span>
                        <button style="margin: 0 5px;" type="submit" class="site-btn" onclick="location.href='/project/inventory'">재고관리</button>
                        <button style="margin: 0 5px;" type="submit" class="site-btn" onclick="location.href='/project/sales'">구매목록</button>
                        <button style="margin: 0 5px;" type="submit" class="site-btn" onclick="location.href='/project/cancle'">취소목록</button>
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
                    <div class="shop__cart__table">
	                        <table style="margin: 0 0 70px 0">
	                            <thead>
	                                <tr>
	                                    <th></th>
	                                </tr>
	                            </thead>
                                	<c:forEach var="inquiry" items="${inquiry_list}">
									  	<tbody>
			                                <tr>
			                                    <td class="cart__product__item">
			                                        <div class="cart__product__item__title">
			                                            <h6>${inquiry.boards_title}</h6>
			                                            <div>
			                                                ${inquiry.boards_content}
			                                            </div>
			                                        </div>
			                                    </td>
			                                    <td class="cart__price">${inquiry.boards_userid}님</td>
			                                    
			                                    <td class="cart__close"><a href="admin_inquiry_form?boards_no=${inquiry.boards_no}">답변 작성</a></td>
			                                    
			                                </tr>
			                          </tbody>
	  						  	</c:forEach>
	                         </table>    
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Cart Section End -->

    <%@ include file="instagram.jsp" %>

	<%@ include file="footer.jsp" %>

<script>
	function windowOpen() { 
		var url = "/project/address_manage"
		window.open(url, "a", "width=1000, height=800, left=100, top=50"); 
	}
</script>


</body>

</html>