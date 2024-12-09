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
            display: flex; /* Flexbox 사용 */
            justify-content: center; /* 가로 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            background-color: #f8f9fa; /* 선택적 배경색 */
        }

        /* .contact__form의 크기 고정 */
        .contact__form {
            text-align: center; /* 텍스트 가운데 정렬 */
        }
        
        /* 메인화면 버튼을 텍스트처럼 보이게 만들기 */
        .link-button {
            all: unset; /* 모든 기본 스타일 제거 */
            color: black; /* 텍스트 색상 */
            cursor: pointer; /* 클릭 가능한 커서 표시 */	
             text-decoration: none; /* 처음부터 밑줄 제거 */
        }
        
        .text-button {
       		background: none; /* 배경 제거 */
       		border: none;    /* 테두리 제거 */
       		color: inherit;  /* 글씨 색은 부모 요소와 동일하게 */
        	font: inherit;   /* 글꼴 상속 */
        	cursor: pointer; /* 클릭할 수 있게 커서 스타일 변경 */
        	padding: 0;      /* 여백 제거 */
   		}

   		 .text-button:hover {
       		text-decoration: underline; /* 호버 시 밑줄 표시 */
    	}
    
    	.separator {
    		color: gray;      /* 구분선 색상 */
    		font-size: 16px;  /* 크기 조정 */
    		margin: 0 10px;   /* 버튼과 구분선 사이 여백 */
   		}
   		
   		input {
        width: 100px; /* 입력 칸 너비 */
        padding: 8px; /* 적당한 여백 */
        box-sizing: border-box; /* 여백 포함 크기 계산 */
    
    }
        
        
     
    </style>
    		
    		
    	
    </head>

 
<body>

	<div class="contact__form">
      	 <h5>비밀번호 찾기</h5>
			<form method="post" action="/project/pwd_search">
				<input type="text" name="user_id"  placeholder="아이디"  style="width: 300px; padding: 20px;"><br>
				<button type="submit" class="site-btn">확인</button>
			</form>
			<br>


		<c:if test="${id != null}">
			<form method="post" action="/project/pwd_change" onsubmit="return change();">
				<input type="hidden" name="user_id" id="user_id" value="${id}">
				<p>변경 할 비밀번호를 적어주세요</p>
				 <input type="password" name="user_password" id="user_password" placeholder="비밀번호"  style="width: 300px; padding: 20px;"><br>
				 <input type="password" name="password_ch" id="password_ch" placeholder="비밀번호 확인"  style="width: 300px; padding: 20px;"><br>
				<input type="submit" value="변경">
			</form>
		</c:if>
		
		 <!-- 메시지 출력 -->
    	<c:if test="${msg != null}">
       <!--  <p class="${msg.contains('성공') ? 'success' : 'error'}">${msg}</p> -->
       ${msg}
   		 </c:if>

    </div>
       
       
       
       
       <script>
       		function change() {
       			
       			var idReg = /^[a-zA-Z0-9]{4,12}$/;
       			
       			var user_password = document.getElementById("user_password");
       			var password_ch = document.getElementById("password_ch");
       			
       			if(!idReg.test(user_password.value)) {
       				alert("비밀번호 형식을 확인하세요");
       				return false;
       			}
       			
       			if (user_password.value != password_ch.value) {
       				alert("비밀번호가 일치하는지 확인하세요");
       				return false;
       			}
       			
       			return true;
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