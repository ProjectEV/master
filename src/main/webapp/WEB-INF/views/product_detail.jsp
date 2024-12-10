<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<meta charset="UTF-8">
<title>제품상세페이지</title>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
        $(document).ready(function () {
            // 수량 변경 이벤트 핸들러
            $(".quantity-input").on("input", function () {
                const quantity = $(this).val(); // 입력된 수량
                
                const remain = $(".remain").data("product-remain");

                if (quantity < 0 || isNaN(quantity)) {
                    alert("수량은 0 이상의 숫자만 가능합니다.");
                    $(this).val(0); // 잘못된 입력은 0으로 리셋
                    return;
                }
                if (quantity > remain) {
                    alert("재고가 부족합니다.");
                    $(this).val(remain);
                    return;
                }
            });
        });
        
        $(function () {
            setInterval(function () {
                $(".owl-next").click();
            }, 5000);
        });

</script>

<style>
.review-item {
   color: #e3c01c;
   margin-right: -4px;
}

.inquiry-item {
   color: #e3c01c;
   margin-right: -4px;
} 

.review-author {
    font-size: 25px; /* 크기 키우기 */
    font-weight: bold; /* 진하게 만들기 */
    color: #333; /* 색을 진하게 */
    margin-right: 10px;
    margin-bottom: 5px; /* 별과의 간격을 줄이기 위해 아래 여백 추가 */
}

/* 날짜 스타일 (작성자 옆에 작게) */
.review-date {
    font-size: 14px; /* 작은 크기 */
    color: #777; /* 색을 회색으로 */
}

/* 별점 스타일 */
.review-stars {
    margin-top: 5px; /* 별과 이름 사이의 간격을 조금 더 좁히기 */
    margin-bottom: 5px; /* 별 아래쪽의 간격을 줄이기 */
}

/* 제목 스타일 (진하게) */
.review-title {
    font-size: 16px; /* 제목 크기 */
    font-weight: bold; /* 진하게 */
    margin: 10px 0;
}

/* 내용 스타일 */
.review-content {
    font-size: 14px; /* 내용 크기 */
    color: #555; /* 내용 색상 */
    line-height: 1.6; /* 줄 간격 설정 */
}

/* 별 아이콘 크기 */
.fa-star, .fa-star-o {
    color: gold; /* 별 색상 */
    font-size: 16px; /* 기본 크기 설정 */
    transform: scale(0.8); /* 크기 축소 */
}

/* 별을 비워둔 아이콘 */
.fa-star-o {
    color: #ccc; /* 비어있는 별 색상 */
}


.inquiry-content {
    display: none;
}

.inquiry_list {
        margin-bottom: 20px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .inquiry-header {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    .inquiry-header .q-marker {
        font-size: 24px; /* Q 크기 조정 */
        font-weight: bold;
        color: #007bff; /* 파란색으로 강조 */
        margin-right: 10px;
    }

    .inquiry-header .title {
        font-size: 18px; /* 제목 크기 */
        font-weight: bold;
        flex-grow: 1;
    }

    .inquiry-header .date {
        font-size: 12px; /* 날짜 크기 */
        color: #777;
    }

    .inquiry-content {
        margin-top: 10px;
        padding-left: 10px;
    }

    .inquiry-content .a-marker {
        font-size: 20px; /* A 크기 조정 */
        font-weight: bold;
        color: #28a745; /* 초록색으로 강조 */
        margin-right: 10px;
    }

    .inquiry-content p {
        margin: 0;
    }
    
    .content-text {
        margin-left: 30px; /* 들여쓰기 크기 조정 */
    }
</style>    
		    
</head>

<body>
    <%@ include file="header.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
	    $(function () {
	    	wishState2();
	    });
	</script>
    
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="/"><i class="fa fa-home"></i> Home </a>
                        <a href="#">카테고리</a>
                        <span style="">${category}</span>
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
                        <h3>${product.product_name} <span>${category}</span></h3>
                        
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
                            <form action="/project/cart_register" method="get" id="cart">
                               <div class="quantity">
                                   <span>수량 :</span>
                                   <div class="remain pro-qty" data-product-remain="${product.product_remain }">
                                      <input type="hidden" name="product_id" value="${product.product_id}" />
                                       <input type="number" class="quantity-input" name="amount" value="1">
                                   </div>
                               </div>
                               
                               <a href="javascript:;" onclick="document.getElementById('cart').submit();" class="cart-btn"><span class="icon_bag_alt"></span> 장바구니</a>
                            </form>
                            <ul>
	                            <li><span id="wish"></span></li>
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
                            <!--  
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">상품스펙</a>
                            </li>
                            -->
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">상품평</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">상품문의</a>
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
                                <div>
                                   <c:if test="${totalReview == 0}">
                                      <p>아직 등록된 리뷰가 없습니다. 첫 번째 리뷰를 등록해주세요!</p>
                                   </c:if>
                                   <c:forEach var="review_list" items="${review_list}">
                                		<div class="review-item">
                                 
	                                       <p><strong class="review-author">${review_list.boards_userid}</strong>
	                                       <span class="review-date">${review_list.boards_regdate}</span></p>
                                     
		                                   <div class="review-stars">
		                                     <c:forEach begin="1" end="${review_list.boards_review_score}">
		                                         <i class="fa fa-star"></i>
		                                     </c:forEach>
		                                     <c:forEach begin="1" end="${5-review_list.boards_review_score}">
		                                         <i class="fa fa-star-o"></i>
		                                     </c:forEach>
		                                   </div>
                                     
		                                   <p><strong class="review-title">${review_list.boards_title}</strong></p>
		                                   <p class="review-content">${review_list.boards_content}</p>
                                		</div>
                                		<hr>
                               		</c:forEach>
                                </div>
                            </div>
                            
							<div class="tab-pane" id="tabs-4" role="tabpanel">
                                <div>
                                   <c:forEach var="inquiry" items="${inquiry_list}">
                                		<div class="inquiry_list">
                                  <!-- Q Section -->
		                                   <div class="inquiry-header">
		                                       <span class="q-marker">Q</span>
		                                       <span class="title">${inquiry.boards_title}</span>
		                                       <span class="date">${inquiry.boards_regdate}</span>
		                                   </div>
		                                      <p class="content-text"><strong>내용:</strong> ${inquiry.boards_content}</p>
		                                        <!-- A Section (Hidden by Default) -->
			                                   <div id="content-${inquiry.boards_no}" class="inquiry-content" style="display: none;">
			                                       <c:forEach var="adminInquiryList" items="${adminInquiryList}">
			                                           <c:if test="${inquiry.boards_no == adminInquiryList.boards_inquiry_conn}">
			                                               <div class="inquiry-header">
			                                                   <span class="a-marker">A</span>
			                                                     <p>${adminInquiryList.boards_content}</p>
			                                               </div>
			                                           </c:if>
			                                       </c:forEach>
			                                   </div>
                                      		<button onclick="toggleContent('${inquiry.boards_no}')" class="site-btn" style="margin-top: 10px; font-size: 14px; padding: 5px 10px; ">관리자 답변 보기</button>
                                  		</div>
                              		</c:forEach>
                            	</div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="related__title">
                        <h5>RELATED PRODUCTS</h5>
                    </div>
                </div>
                
                <c:if test="${size == 0 }">
                	<p> 해당 카테고리 내에 다른 상품이 존재하지 않습니다. </p>
                </c:if>
                
                <c:forEach var="product" items="${randomProductList}" varStatus="status">
	                <c:forEach var="imageList" items="${imageList}">
	          			<c:if test="${imageList.file_connection_id == product.product_id}">
		                	<div class="col-lg-3 col-md-4 col-sm-6">
			                    <div class="product__item">
			                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/images/${imageList.file_name}">
			                            <c:if test="${product.product_remain < 1}">
			                            	<div class="label stockout">out of stock</div>
			                            </c:if>
			                            <ul class="product__hover">
			                                <li><a href="${pageContext.request.contextPath}/images/${imageList.file_name}" class="image-popup"><span class="arrow_expand"></span></a></li>
			                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
			                                <li><a href="/project/cart_register?product_id=${product.product_id}&amount=1"><span class="icon_bag_alt"></span></a></li>
			                            </ul>
			                        </div>
			                        <div class="product__item__text">
			                            <h6><a href="product_detail?product_id=${product.product_id}">${product.product_name }</a></h6>
			                            <div class="rating">
			                                <i class="fa fa-star"></i>
			                                <i class="fa fa-star"></i>
			                                <i class="fa fa-star"></i>
			                                <i class="fa fa-star"></i>
			                                <i class="fa fa-star"></i>
			                            </div>
			                            <div class="product__price">&#8361; <fmt:formatNumber value="${product.product_price}" pattern="#,###" /></div>
			                        </div>
			                    </div>
		                	</div>
		                </c:if>
	                </c:forEach>
                </c:forEach>
                
                
                
                
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <%@ include file="instagram.jsp" %>
	<%@ include file="footer.jsp" %>
	
		<!-- 찜 유무 판별 -->
    <script type="text/javascript">
	    function wishListAddDetail(product_id) {
	        $.ajax({
	            url: '/project/wishlist/add',
	            method: 'GET',
	            data: {product_id: product_id},
	            success: function() {
					alert("관심목록에 추가되었습니다!");
					wishState2();
	            },
	            error: function() {
					alert("추가에 실패했습니다.");
	            }
	        });
	    }
	    
	    function wishListDeleteDetail(product_id) {
	        $.ajax({
	            url: '/project/wishlist/delete',
	            method: 'GET',
	            data: {product_id: product_id},
	            success: function() {
					alert("관심목록에서 삭제 되었습니다!");
					wishState2();
	            },
	            error: function() {
					alert("삭제에 실패했습니다.");
	            }
	        });
	    }
	    
	    function wishState2() {
	        var productId = "${product.product_id}";
	        $.ajax({
	            url: '/project/wishlist/state',
	            method: 'GET',
	            data: { "product_id": productId },
	            success: function (result) {
	                var htmls = "";
	                if (result === true) {
	                    htmls += '<li><a style="background-color: #ca1515;" href="javascript:void(0);" onclick="wishListDeleteDetail(\'' + productId + '\');"><span style="color: white;" class="icon_heart_alt"></span></a></li>';
	                } else {
	                    htmls += '<li><a href="javascript:void(0);" onclick="wishListAddDetail(\'' + productId + '\');"><span class="icon_heart_alt"></span></a></li>';
	                }
	                $("#wish").html(htmls);
	            },
	            error: function () {
	                alert("관심목록 판별에 실패하였습니다.");
	            }
	        });
	    }
	    
	    function toggleContent(inquiryUserId) {
            // boards_userid를 기준으로 고유 div 찾기
            const contentDiv = document.getElementById('content-' + inquiryUserId);
            
            // 내용 보이거나 숨기기
            if (contentDiv.style.display === 'none' || contentDiv.style.display === '') {
                contentDiv.style.display = 'block';
            } else {
                contentDiv.style.display = 'none';
            }
        }
    </script>

</body>

</html>