<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ashion | Template</title>
    
    <script src="https://code.jquery.com/jquery-3.7.1.js"
   integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
   crossorigin="anonymous"></script>
<link rel="stylesheet"
   href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_APP_KEY&libraries=services"></script>
<script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    
    
 
     
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
        display: flex;
        flex-direction: column; /* 세로 정렬 */
        justify-content: center; /* 수직 중앙 정렬 */
        align-items: center; /* 가로 중앙 정렬 */
        background-color: #f8f9fa; /* 선택적 배경색 */
    }

    input {
        width: 50px; /* 입력 칸 너비 */
        padding: 8px; /* 적당한 여백 */
        box-sizing: border-box; /* 여백 포함 크기 계산 */
    
    }

   .input-group {
       display: flex; /* 가로로 정렬 */
       align-items: center; /* 입력 칸과 버튼 높이를 맞춤 */
       gap: 10px; /* 입력 칸과 버튼 사이 간격 */
       width: 100%;
       flex-wrap: nowrap; /* 한 줄에 모든 요소 배치 */
   }

   .input-group input {
       flex-grow: 1; /* 가능한 공간을 입력 칸이 차지 */
       min-width: 250px; /* 최소 너비 */
       max-width: 350px; /* 최대 너비 설정 */
      
   }

   .input-group button {
       flex-shrink: 0; /* 버튼 크기가 줄어들지 않게 설정 */
       margin-bottom: 15px; 
    }

   
   .message {
       margin-top: 10px;
       max-width: 600px; /* 최대 너비 설정 */
       white-space: nowrap; /* 줄바꿈 방지 */
       overflow: hidden; /* 넘치는 텍스트 숨기기 */
       display: inline-block;
       text-align: center;
   }
   
   .message > div {
       flex-grow: 1; /* 자식 요소가 가능한 공간을 차지하도록 */
       min-width: 0; /* 자식 요소가 크기 제한 없이 확장되도록 */
       width: auto; /* 자동으로 넓이를 조정하게 설정 */
   }
   
   .message > .buttons {
       flex-shrink: 0; /* 버튼이 압축되지 않게 */
       margin-top: 10px;
   }
      

    .site-btn:hover {
       background-color: #b30000;
      
    
    }

    
    
    .confirm-btn {
        background-color: #0073e6; /* 진한 빨강 배경 */
        color: white; /* 흰색 글씨 */
        border: none; /* 테두리 제거 */
        border-radius: 5px; /* 둥근 모서리 */
        padding: 10px 20px; /* 여백 추가 */
        cursor: pointer;
        font-size: 14px; /* 적당한 글씨 크기 */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 */
        transition: all 0.3s ease; /* 부드러운 애니메이션 */
    }

    .confirm-btn:hover {
        background-color: #005bb5; /* 호버 시 어두운 빨강 */
        transform: scale(1.1); /* 살짝 커지는 효과 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2); /* 그림자 강화 */
        text-decoration: none;
    }

    .confirm-btn:active {
        background-color: #a30000; /* 클릭 시 색상 변경 */
        transform: scale(1); /* 원래 크기로 복귀 */
        box-shadow: none; /* 그림자 제거 */
    }
    
    h5 {
       text-align: center;
    
    }
   
   
   
     
    </style>
          
          
       
    </head>

 
<body>


             <div class="contact__form" style="width: 300px;">
                             <h5>아이디 중복확인</h5>
                            
                              <form method="post" action="/project/id_check" name="id_checkform">
                                <div class="input-group">
                                <input type="text" name="user_id" value="${user_id}">
                                 
                                    <button type="submit" class="site-btn" >중복 체크</button>
                              </div>   
                             <br>
                              <c:if test = "${r == 1}">
                           <script type="text/javascript">
                           opener.document.join_form.user_id.value="";
                           </script>
                           ${user_id}는 이미 사용중인 아이디 입니다.
                        </c:if >
      
                        <c:if test = "${r == 0}">
                           <div class="message">
                              ${user_id}는 사용 가능한 아이디 입니다.
                              
                              <div class="buttons">
                                 <button type="button" class="site-btn" value="사용" onclick="idok()">사용</button>
                              </div>
                           </div>   
                        </c:if>   
                           </form>                          
                   </div>    
                        
 
                        
                         <script type="text/javascript">
                        document.id_checkform.user_id.value = user_id;
                        //아이디 중복확인 완료한 값 join으로 넘겨주기
                        function idok() {
                           opener.join_form.user_id.value = document.id_checkform.user_id.value;
                           opener.join_form.reid.value = document.id_checkform.user_id.value;
                           self.close();
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