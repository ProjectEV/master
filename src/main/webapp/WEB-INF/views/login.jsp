<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<%@ include file="head.jsp" %>
		
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
    </style>
</head>
 
<body>
	 					<div class="contact__form">
	 						<a href="/"><img style="width: 310px; height: 50px; margin-bottom: 60px;" src="${pageContext.request.contextPath}/resources/images/logo5.png" alt=""></a>
                            <h5>로그인</h5>
                            <form method="post" action="/project/login" name="login_form" >
                                <input type="text" id="user_id" name="user_id" style="width: 300px;" placeholder="아이디"> <br>
                                <input type="password"  id="user_password" name="user_password" style="width: 300px;" placeholder="비밀번호"><br>
								<button type="submit" class="site-btn">로그인</button>&nbsp;&nbsp;&nbsp;
								<button type="button" class="site-btn" onclick="location.href='/project/join'" >회원가입</button>                             
                            </form>                            
                            <br><br>
                            
                           <button type="button" onclick="idSearch()" class="text-button">아이디 찾기</button>
                             <span class="separator">|</span>
                            <button type="button" onclick="pwdSearch()"class="text-button">비밀번호 찾기</button>
                            
                            <br><br><br><br><br><br>
                            
                           <div style="display: flex; align-items: center;">
   								<hr style="flex-grow: 1;">
    							<span style="margin: 0 10px;font-size: 12px;">소셜 로그인</span>
    							<hr style="flex-grow: 1;">
							</div>
                            <br>
    						<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=UKU4azkZUS5fj9tK1XKf&state=STATE_STRING&redirect_uri=http://localhost:8090/project/naver_login">
        						<img src="https://static.nid.naver.com/oauth/big_g.PNG" alt="네이버 로그인 버튼" style="width: 200px; height: auto; ">
    						</a>
                        </div>
       
       <script>
       		function idSearch() {
				var url = "/project/id_search";
				window.open(url, "_blank_2","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=400");
			}
       		
       		function pwdSearch() {
				var url = "/project/pwd_search";
				window.open(url, "_blank_2","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=400");
			}	
       </script>
	<%@ include file="foot.jsp" %> 
</body>
</html>