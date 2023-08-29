<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="author" content="User">
<title>HeNoAIRock</title>
<link rel="stylesheet" type="text/css" href="../resources/css/passwd.css">
<link rel="shortcut icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<script src="/resources/js/jquery-3.7.0.js"></script>
</head>
<body>
    <div class="container">
    <form action="/member/find" method="post" id="find-form">
        <h1>RETYPE</h1>
            
           
            <label for="Email">Email
            	<input onclick="fn_idChk();" type="button" value="회원 인증 "
						class="btnRe">
            </label>
            	<input type="email" id="userId" name="userId" required>
            	
            
            <div id="password-birth-section" style="display:none;" >
            <span class="input-title"></span>
            <label for="cemail">Confirm Email
				 <input type="button" value="인증번호 전송 " class="btnRe" id="mail-Check-Btn">
          		 <input type="button" value="인증번호 확인 " class="btnRe" id="mail-Confirm-Btn">
			</label>
            <input placeholder="인증번호는 6자리 입니다." type="text" id="checkInput" name="checkInput" maxlength="6" required>
            
            <p class="input-title"></p>
            <label for="password">Password</label>
            <input placeholder="비밀번호는 8이상 12자 이하로 설정바랍니다." type="password" name="password" id="password" required />

            <p class="input-title"></p>
            <label for="cpass">Confirm Password</label>
            <input type="password" name="confirm_password" id="confirm_password" required />
            <p id="password-match-message" style="font-size: 8px;color: black; display: none;">비밀번호가 일치합니다.</p>

    
            
            <p class="input-title"></p>
            <button type="submit" id="register">RETYPE PASSWORD</button>
            
            </div>
        </form>
    </div>
	<script src="${CP}/resources/js/passwd.js"></script>
</body>
</html>