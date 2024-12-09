<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>제품 구매 목록</title>
    <style>
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        thead {
        	text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        .details-row {
            display: none;
        }
        .details {
        	border: 1px solid black;
        	margin: 20 auto 100;
        	width: 70%;
            padding: 15px;
            background-color: #fbfbfb;
            box-shadow: 10px 10px #c3c3c3;
        }
       h3 {
       		text-align: center;
       }
       
       
       .detail-table-buy {
       		width: 100%;
       		
       		td {
       			text-align: left;
       			text-indent: 5;
       		}
       		
       		.dark-bg {
       			background-color: #f4f4f4;
       			font-weight: bold;
       		}
       		
       }
       .detail-table-pay {
       		width: 100%;
       		
       		td {
       			text-align: right;
       			text-indent: 5;
 
       		}
       		
       		.dark-bg {
       			background-color: #f4f4f4;
       			font-weight: bold;
       			text-align: center;
       		}
       		
       }         
       .detail-table-cancel {
       		width: 100%;
       		
       		td {
       			text-align: center;
       			text-indent: 5;
       		
       		.dark-bg {
       			background-color: #f4f4f4;
       			font-weight: bold;
       			text-align: center;
       		}
       		
       }       
       
      
       
    </style>
    <script>
        function toggleDetails(orderId) {
            const detailRow = document.getElementById('details-' + orderId);
            if (detailRow.style.display === 'none' || detailRow.style.display === '') {
                detailRow.style.display = 'table-row';
            } else {
                detailRow.style.display = 'none';
            }
        }
    </script>
</head>
<body>

<%@ include file="header.jsp" %>
	<br>
    <h3>${user_name}님의 구매 취소 목록</h3>
    <br>
    <table>
        <thead>
            <tr>
                <th width="15%">주문번호</th>
                <th width="10%">구매자 ID</th>
                <th>제품명</th>
                <th width="7%">수량</th>
                <th width="10%">총액</th>
                <th width="13%">구매날짜</th>
                <th width="13%">취소날짜</th>
            </tr>
        </thead>
        <tbody>
            <!-- 데이터 반복 -->
            <c:forEach var="order" items="${listCancel}">
                <tr onclick="toggleDetails(${order.buydetail_no})">
                    <td>${order.buydetail_code}</td>
                    <td>${order.buy_userid}</td>
                    <td>${order.product_name}</td>
                    <td>${order.buydetail_amount}</td>
                    <td>&#8361; <fmt:formatNumber value="${order.buydetail_amount * order.product_price}" pattern="#,###" /></td>
                    <td>${order.buy_regdate}</td>
                    <td>${order.buycancel_regdate }</td>
                </tr>
                <!-- 상세 정보 행 -->
                <tr id="details-${order.buydetail_no}" class="details-row">
                    <td colspan="7">
                        <div class="details">
                        	<br>
                        	<h4> 구매 상세정보 </h4><br>
                        	<table class="detail-table-buy">
						        <thead>
						            <tr>
						                <td class="dark-bg" width="10%">주문번호</td>
						                <td width="35%">${order.buydetail_code}</td>
						                <td class="dark-bg" width="10%">구매자 이름</td>
						                <td>${order.user_name }</td>
						            </tr>
						        </thead>
						        <tbody>
						            <tr>
						                <td class="dark-bg">제품 코드</td>
						                <td><a href="product_detail?product_id=${order.buydetail_productid }">${order.buydetail_productid }</a></td>
						                <td class="dark-bg">전화번호</td>
						                <td>${order.user_phone }</td>
						            </tr>
						            <tr>
						                <td class="dark-bg" rowspan="2">제품명<br></td>
						                <td rowspan="2">${order.product_name}</td>
						                <td class="dark-bg">이메일</td>
						                <td>${order.user_email }</td>
						            </tr>
						            <tr>
						                <td class="dark-bg">배송주소</td>
						                <td>${order.buy_address }</td>
						            </tr>
						            <tr>
						                <td class="dark-bg">구매일</td>
						                <td>${order.buy_regdate}</td>
						                <td class="dark-bg">수령인 이름</td>
						                <td>${order.buy_receive }</td>
						            </tr>
						        </tbody>
						    </table>
						    <br><br>
						    <h4> 결제 상세정보 </h4>
						    <br>
						    <table class="detail-table-pay">
						    	<thead>
						    		<tr>
						    			<td class="dark-bg"> 가격 </td>
						    			<td class="dark-bg"> 수량 </td>
						    			<td class="dark-bg"> 총액 </td>
						    			<td class="dark-bg"> 할인 </td>
						    			<td class="dark-bg"> 최종 결제금액 </td>
						    		</tr>
						    	</thead>
						    	<tbody>
						    		<tr>
						    			<td><fmt:formatNumber value="${order.product_price }" pattern="#,###" />원&nbsp;</td>
						    			<td>${order.buydetail_amount}&nbsp;</td>
						    			<td><fmt:formatNumber value="${order.buydetail_amount * order.product_price}" pattern="#,###" />원&nbsp;</td>
						    			<td>-<fmt:formatNumber value="${order.buydetail_discounted * order.buydetail_amount * order.product_price / 100 }" pattern="#,###" />원 (-${order.buydetail_discounted}%)&nbsp;</td>
						    			<td><fmt:formatNumber value="${order.buydetail_amount * order.product_price - order.buydetail_discounted * order.buydetail_amount * order.product_price / 100}" pattern="#,###" />원&nbsp;</td>
						    		</tr>
						    		
						    		
						    	</tbody>
						    </table>
						    
						    
						    <br><br>
						    <h4> 취소 상세정보 </h4>
						    <br>
						    <table class="detail-table-pay">
						    	<thead>
						    		<tr>
						    			<td class="dark-bg"> 구매날짜 </td>
						    			<td class="dark-bg"> 취소날짜 </td>
						    			<td class="dark-bg"> 환불금액 </td>
						    		</tr>
						    	</thead>
						    	<tbody>
						    		<tr>
						    			<td style="text-align: center;">${order.buy_regdate}</td>
						    			<td style="text-align: center;">${order.buycancel_regdate }</td>
						    			<td align="right"><fmt:formatNumber value="${order.buydetail_amount * order.product_price - order.buydetail_discounted * order.buydetail_amount * order.product_price / 100}" pattern="#,###" />원&nbsp;</td>
						    		</tr>
						    		
						    		
						    	</tbody>
						    </table>
						    
						    
						    <br>
						    
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    						<div class="pagination__option paging" align="center">
			            		
			            		<c:choose>
			            			<c:when test="${pageListNUM>1}">
										<a href="cancel?pageListNUM=${pageListNUM-1}&pageNUM=${pageListNUM*10-10}"> &lt; </a>
									</c:when>
									<c:otherwise>
										<a style="color:lightgray;"> &lt; </a> 
									</c:otherwise>
			            		</c:choose>
				                &nbsp;
										  	
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
								
									<c:choose>
										<c:when test="${i == 1 && param.pageNUM == null }">
											<a href="cancel?pageListNUM=${pageListNUM }&pageNUM=${i }" style="color: #ca1515;"> ${i } </a>
										</c:when>
										<c:when test="${i == param.pageNUM }">
											<a href="cancel?pageListNUM=${pageListNUM }&pageNUM=${i }" style="color: #ca1515;"> ${i } </a>
										</c:when>
										<c:otherwise>
											<a href="cancel?pageListNUM=${pageListNUM }&pageNUM=${i }" > ${i } </a>
										</c:otherwise>
									</c:choose>
									&nbsp;
								
								</c:forEach>
										  
								<c:choose>
			            			<c:when test="${pageListNUM<(totalPage/10)}">
										<a href="cancel?pageListNUM=${pageListNUM+1}&pageNUM=${pageListNUM*10+1}"> &gt; </a>
									</c:when>
									<c:otherwise>
										<a style="color:lightgray;"> &gt; </a> 
									</c:otherwise>
			            		</c:choose>		  
								
								
			                </div>
    
    

    <%@ include file="footer.jsp" %>
    
</body>
</html>