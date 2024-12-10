<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품평 작성</title>

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

	 		
     <style>
        /* 페이지 전체를 Flexbox로 설정 */
        body {
            margin: 0;
            height: 100vh; /* 화면 전체 높이 */
            display: flex; /* Flexbox 사용 */
            justify-content: center; /* 가로 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            background-color: #f8f9fa; /* 선택적 배경색 */
        }

        /* .contact__form의 크기 고정 */
        .contact__form {
            text-align: center; /* 텍스트 가운데 정렬 */
        }
        
        
      /* <p>의 내용 왼쪽 정렬 */
        p {
            text-align: left;
            margin: 0; /* 기본 여백 없애기 */
        }

        /* 별 빨간색 */
        p span {
            color: red;
        }
     
     	.review-stars {
   			display: flex;
  			 gap: 5px;
   			margin: -20px 0 10px 0;
   			font-size:40px;
		}
		
		h5 {
   			margin-bottom: 5px; /* 제목과 별점 사이의 여백 축소 */
   			text-align: left;
		}
		
		.upload-section {
  	 		display: flex;
   			justify-content: center;
   			align-items: center;
   			border: 2px dashed #ddd;
   			padding: 20px;
   			border-radius: 5px;
 	 		margin-bottom: 15px;
   			cursor: pointer;
		}

		.upload-section:hover {
  			 background-color: #f1f1f1;
		}
 		
 		img {
 			  width: 80px;
   			height: 80px;
   			border: 1px solid #ccc;
   			margin-right: 15px;
   			 float: left;
 		
        
	</style>

</head>
<body>
					<div class="contact__form">
                            <h4 style="font-weight: bold;">상품평 작성</h4><br><br><br>
                            <form method="post" action="/project/review" enctype="multipart/form-data">
                            
                           	    <img src="${pageContext.request.contextPath}/images/${file_name}" alt="상품 이미지">
								<input type="hidden" id="boards_productid" name="boards_productid" value="${product.product_id}">
                           	    <h5>${product.product_name}</h5>
                           	    
                           	    <br><br><br>
                                <p class="form-label">상품 만족도 <span>*</span></p>
                            	<div class="review-stars">
                            		<div>
	         							<span class="star">&#9733;</span>
	         							<span class="star">&#9733;</span>
	  								    <span class="star">&#9733;</span>
	         							<span class="star">&#9733;</span>
	         							<span class="star">&#9733;</span>
	         							<input type="hidden" id="boards_review_score" name="boards_review_score" >
         							</div>
      							</div>
                            		
                             	<p class="form-label">제목 <span>*</span></p>
                                <input type="text" id="boards_title" name="boards_title" style="width: 400px;" required > <br>
                                
                                <p class="form-label">내용 <span>*</span></p>
                                <textarea style=" width: 400px; height: 200px;" rows="70" cols="70" id="boards_content" name="boards_content" required ></textarea>
                                
                                <p class="form-label">사진 등록 <span></span></p>
					      	    <div class="mb-3">
								  <input style="height: 35px; padding-left: 12px;" class="form-control" type="file" id="formFile" multiple="multiple" name="files">
								</div>
								
						      	<br><br>
						      	<input type="hidden" name="boards_userid" id="boards_userid" value="${user_id}" >
						      	<input type="hidden" name="buydetail_no" id="buydetail_no" value="${param.buydetail_no}" >
								<button type="submit" class="site-btn">작성완료</button>
			                    <button type="reset" class="site-btn">다시작성</button>
                            </form>
                        </div>

		<script>
		    // 별점 Hover 및 클릭 동작
		    const stars = document.querySelectorAll('.review-stars span');
		    let clickedIndex = -1; // 클릭된 별점 인덱스를 저장
		
		    // 별점 Hover 시 색상 변경
		    stars.forEach((star, index) => {
		        star.addEventListener('mouseover', () => {
		            for (let i = 0; i < stars.length; i++) {
		                stars[i].style.color = i <= index ? '#ff6600' : '#dddddd';
		            }
		        });
		
		        // Hover 해제 시 색상 초기화 또는 클릭된 상태 유지
		        star.addEventListener('mouseout', () => {
		            for (let i = 0; i < stars.length; i++) {
		                stars[i].style.color = i <= clickedIndex ? '#ff6600' : '#dddddd';
		            }
		        });
		
		        // 별 클릭 시 선택된 별점 색상 유지
		        star.addEventListener('click', () => {
		            clickedIndex = index; // 클릭된 별점 인덱스 저장
		            for (let i = 0; i < stars.length; i++) {
		                stars[i].style.color = i <= clickedIndex ? '#ff6600' : '#dddddd';
		            }
		        });
		    });
		    
		       // 별점 클릭 이벤트 처리
		       $('.star').click(function() {
		        // 부모 요소의 모든 자식 span 요소에서 'on' 클래스를 제거
		        $(this).parent().children('span').removeClass('on');
		
		        // 클릭된 별에 'on' 클래스를 추가하고, 그 이전의 모든 형제 span에 'on' 클래스를 추가
		        $(this).addClass('on').prevAll('span').addClass('on');
		
		        // 선택된 별점 개수를 구하여 변수에 저장
		        const boards_review_score = $(this).parent().children('span.on').length;
		        alert(boards_review_score);
		
		        // 'rating' 값을 hidden input에 저장
		        $('#boards_review_score').val(boards_review_score);
		    });
		    
		    
		    
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