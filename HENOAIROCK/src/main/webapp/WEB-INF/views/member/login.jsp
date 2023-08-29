<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="author" content="User">
<title>HeNoAIRock</title>
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="shortcut icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<script src="/resources/js/jquery-3.7.0.js"></script>
</head>
<body>
	
	<!-- 배경 삽입 
	<video id="background-video" autoplay loop muted>
   		<source src="/resources/video/login.mp4" type="video/mp4">
	</video> -->
	
	<!-- 로그인 시작 -->
    <div class="container">
    
       <div class="top_link">
        	<a href="/">
        		<img src="https://drive.google.com/u/0/uc?id=16U__U5dJdaTfNGobB_OpwAJ73vM50rPV&export=download" alt="">RETURN
        	</a>
       </div>
    
		<!-- 관리자 로그인 -->
		<div class="background-link">
	        <a href="/admin/login"><span>?</span></a>
	    </div>
		<!-- //관리자 로그인// -->
		
		
        <h1>HENOAIROCK</h1>
        <form action="/member/login" method="post">
            <label for="Email">Email:</label>
            <input type="text" id="userId" name="userId" required>
             <div class="form-group">
                <label for="login_password">Password</label>
                <div class="password-container">
                    <input type="password" name="password" id="password" class="form-control" required />
                    <i class="fa fa-eye-slash" id="eye_icon_login"></i>
                </div>
            </div>
            <button type="submit" id="fn_email"name="fn_email">LOGIN</button>
			
		
        </form>
        <div class="links">
            <span id="to_signup" class="transition-link"><a href="/member/register">Create an account?</a></span>
            <span id="to_passup" class="forgot-password"><a href="/member/passwd">Forgot password</a></span>
        </div>
    </div>
    <!-- 로그인 끝 -->
<script src="/resources/js/login.js"></script>
</body>
</html>