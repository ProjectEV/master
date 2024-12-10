<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<%@ include file="head.jsp" %>

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
    
    .contact__form {
        text-align: center; /* 텍스트 가운데 정렬 */
    }

    input {
        width: 50px; /* 입력 칸 너비 */
        padding: 8px; /* 적당한 여백 */
        box-sizing: border-box; /* 여백 포함 크기 계산 */
    
    }

    .buttons {
        display: inline-flex; /* 버튼을 가로로 정렬 */
        justify-content: space-between; /* 좌우에 버튼 정렬 */
        align-items: center;
        text-align: center;
        margin-left: 110px;
                
        width: 100%; /* 컨테이너가 입력 칸만큼 넓어지도록 설정 */
        margin-top: 10px; /* 위와 약간의 간격 */
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
		<h5>아이디 찾기</h5>
		<form method="post" action="/project/id_search" name="id_searchform">
		<input type="text" name="user_email" placeholder="이메일" required><br>
		<input type="text" name="user_name" placeholder="이름" required>
			<div class="buttons">
			<button type="submit" class="site-btn" >검사</button>
			</div>
		<br><br>
		${msg}
		</form>                          
	</div>    
           
    <script>
      function idok_2() {
    	 self.close();

      }
    </script>
    
    <%@ include file="foot.jsp" %>   
</body>
</html>