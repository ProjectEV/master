<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<meta charset="UTF-8">
<title>재고상세페이지</title>
<head>

<script>
	function windowOpen2() { 
		var url = "product_update?product_id=${product.product_id}"
		window.open(url, "a", "width=1000, height=800, left=100, top=50"); 
		}
</script>
<style>
.product_add_input {
	  margin-bottom: 30px;

  h6 {
    color: $heading-color;
    font-weight: 600;
    text-transform: uppercase;
    margin-bottom: 25px;
  }

  form {
    position: relative;
    margin-bottom: 30px;
    margin-left: 280px;

    input {
      height: 52px;
      width: 115px;
      border: 1px solid #e1e1e1;
      border-radius: 50px;
      padding-left: 30px;
      font-size: 14px;
      color: #666666;
      

      &::placeholder {
        color: #666666;
      }
    }

    button {
      position: absolute;
      height: 52px;
      right: 30px;
      background-color: #49516b;
    }
  }
}
</style>

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

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="/"><i class="fa fa-home"></i> Home </a>
                        <a href="/project/inventory"> 재고관리 </a>
                        <span> 카테고리 : ${product.product_category} </span>
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
                        <h3>${product.product_name} <span>${product.product_category}</span></h3>
                        
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
                        
                        
                        
                        
                            <a href="product_delete?product_id=${product.product_id}" class="cart-btn" > 제품 삭제 </a>
                            <a href="product_update?product_id=${product.product_id}" class="cart-btn" > 제품 수정 </a>
                            
                            
			                    <div class="product_add_input">
			                        <form action="/project/product_add" method="post">
			                            <input type="number" class="quantity-input pro-qty" name="product_add"  value="1" min="1" size="15">
			                            <input type="hidden" name="product_id" value="${product.product_id}" />
			                            <button type="submit" class="site-btn">수량 추가</button>
			                        </form>
			                    </div>

                        </div>
                        <div class="product__details__widget">
                            <ul>
                            	<li>
                                    <span>제품 코드:</span>
                                    <p>${product.product_id }</p>
                                </li>
                            	<li>
                                    <span>재고:</span>
                                    <p>${product.product_remain }</p>
                                </li>
                                <li>
                                    <span>누적판매량:</span>
                                    <p>${product.product_sales }</p>
                                </li>
                                <li>
                                    <a style="font-size: 15px;" href="/project/backToList?product_id=${product.product_id }"> 뒤로가기 </a>
                                </li>
                                
                            
                              
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
        </div>
    </section>
    <!-- Product Details Section End -->

    <%@ include file="instagram.jsp" %>

<%@ include file="footer.jsp" %>

</body>

</html>