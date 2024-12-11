<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<meta charset="UTF-8">
<title>마이페이지</title>
<head>
    <style>
      .shop__cart__table tbody tr td {
          padding: 17px 0;
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
                    <div class="breadcrumb__links" style="">
                        <a href="/"><i class="fa fa-home"></i>Home</a>
                        <a href="/">마이페이지</a>
                        <span style="">주문목록</span>
                        <div style="float: right;">
	                        <button style="margin: 0 5px;" type="submit" class="site-btn" onclick="location.href='/project/mypage'">주문목록</button>
	                        <button style="margin: 0 5px;" type="submit" class="site-btn" onclick="location.href='/project/cancel_forUser'">취소목록</button>
	                        <button style="margin: 0 0;" type="submit" class="site-btn" onclick="windowOpen()">배송지 관리</button>
                        </div>
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
                    
                      <c:forEach var="buy" items="${buy_list}">
                           <table style="margin: 0 0 70px 0">
                               <thead>
                                   <tr>
                                       <th>${buy.buy_regdate}</th>
                                   </tr>
                               </thead>
                               <c:forEach var="buydetail" items="${buy_detail_list}">
                          <c:if test="${buy.buy_no == buydetail.buydetail_buyno}">
                               <c:forEach var="buydetailProduct" items="${buy_detail_product_list}">
                                     <c:if test="${buydetail.buydetail_productid == buydetailProduct.product_id}">
                                      <tbody>
                                               <tr style="padding: 10px 0; height: 70px;">
                                                   <td class="cart__product__item">
                                                      <c:forEach var="imageList" items="${imageList}">
                                                      <c:if test="${imageList.file_connection_id == buydetailProduct.product_id}">
                                                             <img style="style=width: 90px; height: 90px;" src="${pageContext.request.contextPath}/images/${imageList.file_name}" alt="">
                                                     </c:if>
                                                  </c:forEach>
                                                       <div class="cart__product__item__title">
                                                          <a href="/project/product_detail?product_id=${buydetailProduct.product_id}" style="text-decoration: none;"><h6>${buydetailProduct.product_name}</h6></a>
                                                           <div class="rating">
	                                                           <c:choose>
	                                                               <c:when test="${buydetailProduct.avgScore < 0.25}">
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                               </c:when>
	                                                               <c:when test="${buydetailProduct.avgScore < 0.75}">
	                                                                  <i class="fa fa-star-half-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                               </c:when>
	                                                               <c:when test="${buydetailProduct.avgScore < 1.25}">
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                               </c:when>
	                                                               <c:when test="${buydetailProduct.avgScore < 1.75}">
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star-half-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                               </c:when>
	                                                               <c:when test="${buydetailProduct.avgScore < 2.25}">
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                               </c:when>
	                                                               <c:when test="${buydetailProduct.avgScore < 2.75}">
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star-half-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                               </c:when>
	                                                               <c:when test="${buydetailProduct.avgScore < 3.25}">
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                               </c:when>
	                                                               <c:when test="${buydetailProduct.avgScore < 3.75}">
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star-half-o"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                               </c:when>
	                                                               <c:when test="${buydetailProduct.avgScore < 4.25}">
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star"></i>
	                                                                  <i class="fa fa-star-o"></i>
	                                                               </c:when>
	                                                               <c:when test="${buydetailProduct.avgScore < 4.75}">
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
                                                       </div>
                                                   </td>
                                                   <td class="cart__price" style="text-align: center;"> 가격 <br> &#8361; <fmt:formatNumber value="${buydetailProduct.product_price}" pattern="#,###" /></td>
                                                   <td class="cart__quantity" style="text-align: center;"> 수량 <br> ${buydetail.buydetail_amount}개</td>
                                                   <td class="cart__total" style="text-align: center;"> 합계 <br> &#8361; <fmt:formatNumber value="${buydetailProduct.product_price * buydetail.buydetail_amount}" pattern="#,###" /></td>
                                                   <td class="cart__close" width="10%" style="text-align: center;"><a href="review?product_id=${buydetailProduct.product_id}&buydetail_no=${buydetail.buydetail_no}">상품평 작성</a></td>
                                                   <td class="cart__close" width="10%" style="text-align: center;"><a href="inquiry?product_id=${buydetailProduct.product_id}">상품 문의</a></td>
                                                   <td class="cart__close" width="8%" style="text-align: center;"><a href="buyCancel?buydetail_no=${buydetail.buydetail_no }"><span class="icon_close" style="width: 85px; border-radius: 50px;">취소</span></a></td>
                                               </tr>
                                            </tbody>
                                    </c:if>                    
                               </c:forEach>
                             </c:if>                    
                          </c:forEach>   
                            </table>    
                         </c:forEach>   
                                

                    </div>
                    
                     <div class="pagination__option paging" align="center">
                  
                     <c:choose>
                        <c:when test="${pageListNUM>1}">
                        <a href="mypage?pageListNUM=${pageListNUM-1}&pageNUM=${pageListNUM*10-10}"> &lt; </a>
                     </c:when>
                     <c:otherwise>
                        <a style="color:lightgray;"> &lt; </a> 
                     </c:otherwise>
                     </c:choose>
                      &nbsp;
                             
                  <c:forEach var="i" begin="${startPage }" end="${endPage }">
                  
                     <c:choose>
                        <c:when test="${i == 1 && param.pageNUM == null }">
                           <a href="mypage?pageListNUM=${pageListNUM }&pageNUM=${i }" style="color: #ca1515;"> ${i } </a>
                        </c:when>
                        <c:when test="${i == param.pageNUM }">
                           <a href="mypage?pageListNUM=${pageListNUM }&pageNUM=${i }" style="color: #ca1515;"> ${i } </a>
                        </c:when>
                        <c:otherwise>
                           <a href="mypage?pageListNUM=${pageListNUM }&pageNUM=${i }" > ${i } </a>
                        </c:otherwise>
                     </c:choose>
                     &nbsp;
                  
                  </c:forEach>
                          
                  <c:choose>
                        <c:when test="${pageListNUM<(totalPage/10)}">
                        <a href="mypage?pageListNUM=${pageListNUM+1}&pageNUM=${pageListNUM*10+1}"> &gt; </a>
                     </c:when>
                     <c:otherwise>
                        <a style="color:lightgray;"> &gt; </a> 
                     </c:otherwise>
                     </c:choose>        
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