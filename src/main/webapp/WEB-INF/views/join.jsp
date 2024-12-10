<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<%@ include file="head.jsp" %>

    <style>
    /* 공통 스타일: input과 select의 동일화 */
    .checkout__form__input input,
    .checkout__form__input select {
        width: 100%;
        height: 44.98px; /* 동일 높이 설정 */
        padding: 0 10px; /* 여백 동일화 */
        border: 1px solid #ccc; /* 동일 테두리 */
        border-radius: 4px; /* 둥근 모서리 */
        background-color: #fff; /* 배경색 */
        font-size: 16px; /* 텍스트 크기 통일 */
        box-sizing: border-box; /* 경계 크기 포함 */
    }

    /* Hover 효과 추가 (선택 사항) */
    .checkout__form__input input:focus,
    .checkout__form__input select:focus {
        border-color: #007bff; /* 포커스 시 테두리 색상 */
        outline: none;
    }
    
</style>

</head>

<body>
    <%@ include file="header.jsp" %>

    <!-- Checkout Section Begin -->
    
    <section class="checkout spad" style="margin-left: 350px;">
        <div class="container">

            <form method="post" action="/project/join" class="checkout__form" name="join_form" onsubmit="return join();">
                <div class="row">
                    <div class="col-lg-8">
						<div style="text-align: center; margin: 0 0 50px 0;">
                        	<h4 style="font-weight: bold;">회원가입</h4>
                      	</div>
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="checkout__form__input">
                                    <p>아이디 <span>*</span></p>
                                    <input type="text" id="user_id" name="user_id" placeholder="* 4-12자의 영문 대소문자와 숫자로만 입력" required>
                                </div>
                            </div>
                            
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="checkout__form__input">
                           			 <button type="button" onclick="idCheck()" class="site-btn" style="width: 116.01px; height: 44.98px; margin-top: 35px; " >중복체크</button>
                           			 
                            	</div>
                            </div>
                            
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p hidden>중복체크용 <span>*</span></p>
                                    <input type="text" id="reid" name="reid" hidden>
                                    
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>비밀번호 <span>*</span></p>
                                    <input type="password" id="user_password" name="user_password" placeholder="* 4-12자의 영문 대소문자와 숫자로만 입력" required>
                                </div>
                                <div class="checkout__form__input">
                                    <p>비밀번호 확인 <span>*</span></p>
                                    <input type="password" id="pwdch" name="pwdch" required>
                                </div>
                                <div class="checkout__form__input">
                                    <p>이름 <span>*</span></p>
                                    <input type="text" id="user_name" name="user_name" required>
                                </div>
                                <div class="checkout__form__input">
                                    <p>생일 <span>*</span></p>
                                    <input type="text" id="user_birth" name="user_birth" required>
                                </div>
                            </div>
                            
	                     	<div class="col-lg-4 col-md-4 col-sm-4">
						        <div class="checkout__form__input">
						            <p>전화번호<span>*</span></p>
						           <select id="phone1" name="phone1" size="1">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="012">012</option>
							<option value="013">013</option>
					</select>
					
						        </div>
					    	</div>
						    <div class="col-lg-4 col-md-4 col-sm-4">
						        <div class="checkout__form__input">
						        	<p style="height:23.99px;"></p>
						            <input type="number" id="phone2" name="phone2" style="width: 100%;">
						         
						        </div>
						    </div>
						    <div class="col-lg-4 col-md-4 col-sm-4">
						        <div class="checkout__form__input">
						        	<p style="height:23.99px;"></p>
						            <input type="number" id="phone3" name="phone3" style="width: 100%;">
						            <input type="hidden" id="user_phone" name="user_phone">
						        </div>
						    </div>
						    
						          
							    <div class="col-lg-12">
								    <!-- 제목은 flex 외부에서 고정 -->
								    <div class="checkout__form__input" style="position: relative;">
								        <p style="margin-bottom: 5px;">이메일 <span>*</span></p> <!-- 상단 고정 -->
								        <div style="display: flex; align-items: center;">
								            <input type="text" id="email1" name="email1" required style="flex: 1; margin-right: 5px;">
								            <span style="display: inline-block; padding: 0 5px; vertical-align: middle;">@</span>
								            <select name="email2" id="email2" size="1" style="flex: 1; margin-bottom: 25px;">
								                <option value="naver.com" selected>naver.com</option>
								                <option value="gmail.com">gmail.com</option>
								                <option value="nate.com">nate.com</option>
								                <option value="daum.net">daum.net</option>
								                <option value="yahoo.com">yahoo.com</option>
								            </select>
								        </div>
								        <input type="hidden" id="user_email" name="user_email">
								    </div>
								</div>
                           </div>
                        </div>
                    </div>
                    <div style="margin: 50px 0 50px 250px;">
                    <button type="submit" class="site-btn">회원가입</button>&nbsp;&nbsp;
                    <button type="reset" class="site-btn">다시작성</button>
                    </div>
                </form>
            </div>
        </section>
   
        <!-- Checkout Section End -->

        <%@ include file="instagram.jsp" %>
    	<%@ include file="footer.jsp" %>

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search End -->

        
         <script>

	//유효성 검사 funtion
	function join() {
		
		var idReg = /^[a-zA-Z0-9]{4,12}$/;
		
		var user_id = document.getElementById("user_id");
		var user_password = document.getElementById("user_password");
		var pwdch = document.getElementById("pwdch");	
		
		//전화번호 
		var phone1 = document.getElementById("phone1").value;
        var phone2 = document.getElementById("phone2").value;
        var phone3 = document.getElementById("phone3").value;

        //이메일
		var email1 = document.getElementById("email1").value;
		var email2 = document.getElementById("email2").value;
		
		//전화번호 input 값 3개 합치는 처리
	    var user_phone = phone1 +'-'+ phone2 +'-' + phone3;
	    document.getElementById("user_phone").value = user_phone;

	    
	    //이메일 input 값 2개 합치는 처리
	    var user_email = email1 + '@' + email2;
	    document.getElementById("user_email").value = user_email;

		if (!idReg.test(user_id.value)) {
			alert("아이디 형식을 확인하세요");
			return false;
		}

		if (!idReg.test(user_password.value)) {
			alert("비밀번호 형식을 확인하세요");
			return false;
		}

		if (user_password.value != pwdch.value) {
			alert("비밀번호가 일치하는지 확인하세요");
			return false;
		}
		
		if(document.join_form.reid.value == "") {
			alert("중복 체크를 하지 않았습니다.");
			join_form.user_id.focus();
			return false;
		}
			
		return true;
	}
	
	function idCheck(){
		if (document.join_form.user_id.value == "") {
			alert("아이디를 입력하여 주십시오");
			document.join_form.user_id.focus();
			return false;
		} else {
			//경로 값을 설정하면서 IdCheckServlet 서블릿 클래스의 doGet() 실행
			var url = "/project/id_check?user_id=" + document.join_form.user_id.value;
			window.open(url, "_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
		}
	}

	//제이쿼리
	$(document).ready(function() {
		$('#user_birth').datepicker();

		$('input[type="radio"]').on('click', function() {
			if (this.id !== 'etc') {
				$("#etc_detail").prop("disabled", true);
			} else {
				$("#etc_detail").prop("disabled", false);
			}
		});
	});
	
</script>

</body>

</html>