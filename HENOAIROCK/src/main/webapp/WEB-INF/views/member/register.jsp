<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="author" content="User">
<link rel="stylesheet" type="text/css" href="/resources/css/register.css">
<link rel="shortcut icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<script src="/resources/js/jquery-3.7.0.js"></script>
<title>HeNoAIRock</title>
</head>
<body>
    <div class="container">
    <form action="/member/register" method="post" id="register-form">
        <h1>REGISTER</h1>
        
            <label for="Email">Email
            	<input type="button" value="중복확인" class="btnRe" onclick = "fn_idChk();" >
            </label>
            	<input type="text" id="userId" name="userId" required>
            
            
            <label for="cemail">Confirm Email
				<input type="button" value="인증번호 전송 " class="btnRe" id="mail-Check-Btn">
            	<input type="button" value="인증번호 확인 " class="btnRe" id="mail-Confirm-Btn">
			</label>
            <input placeholder="인증번호는 6자리 입니다." type="text" name="checkInput" id="checkInput" maxlength="6" required>
            
            <label for="password">Password</label>
            <input placeholder="비밀번호는 8이상 12자 이하로 설정바랍니다." type="password" name="password" id="password" required />
			<span class="error-message" id="password_error"></span>

            <label for="cpass">Confirm Password</label>
            <input type="password" id="confirm_password" name="confirm_password" required oninput="validateForm()" />
            <span class="error-message" id="confirm_password_error"></span>

    
            <label for="name">Name</label>
            <input type="text" name="name" id="name" required />
            
            
            <label for="birth">birth</label>
            <input type="date" name="birth" id="birth" required />
            
            
            <label for="agree">Are you agree?
    			<span><a href="/setting/setting_agree" style="font-size: 12px;">[이용약관 자세히 읽기]</a></span>
			</label>
			
			<div class="input-check">
			    <div>
			        <input checked="checked" type="radio" name="agree" value="Y" id="m_y" required>
			        <label for="m_y">동의</label>
			    </div>
			    <div>
			        <input type="radio" name="agree" value="N" id="m_n" required>
			        <label for="m_n">비동의</label>
			    </div>
			</div>
            
        


            <button type="submit" id="register">CREATE</button>
	</form>
    </div>
  <script src="${CP}/resources/js/register.js"></script>
</body>
</html>