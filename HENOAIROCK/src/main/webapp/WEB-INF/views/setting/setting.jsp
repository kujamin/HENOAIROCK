<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link rel="shortcut icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<link rel="stylesheet" type="text/css" href="/resources/css/setting/setting.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>HeNoAIRock</title>
</head>
		<body>
		 &nbsp;&nbsp;<h2>설정</h2>
		<div class="separator"></div>
		<div class="setting_account">
		  <a href="/member/logout" id="logoutBtn">
		    &nbsp;&nbsp;<div class="setting_itmes curent">로그아웃</div>
		  </a>
		  
		  <a href="/member/passwd" id="passwd">
		    &nbsp;&nbsp;<div class="setting_itmes curent">비밀번호 변경</div>
		  </a>
		  
		  <a href="/member/delete" id="deleteAccountBtn"> <!-- 비밀번호 변경 공지 링크 추가 -->
		    &nbsp;&nbsp;<div class="setting_itmes curent">회원탈퇴</div>
		  </a>
		</div>
		<section>
		 &nbsp;&nbsp;<h2>Help Center</h2>
		   <div class="separator"></div>
		   
		     <a href="/setting/setting_agree" id="agree"> &nbsp;&nbsp;
		        <div class="setting_itmes curent">이용약관</div>
		     </a>
		     
		     <a href="/setting/setting_service" id="service"> &nbsp;&nbsp;
		        <div class="setting_itmes curent">서비스 약관</div>
		    </a>
		    
		  </section>
		  <script>
		  
		
		    document.getElementById('passwd').addEventListener('click', function(event) {
		        event.preventDefault(); // 기본 링크 동작 중지

		        if (confirm('비밀번호 변경하시겠습니까?')) {
		            // 확인 버튼을 누르면 비밀번호 변경 페이지로 이동
		            window.location.href = '/member/passwd';
		        }
		    });
		    
		    document.getElementById('logoutBtn').addEventListener('click', function(event) {
		        event.preventDefault(); // 기본 링크 동작 중지

		        if (confirm('로그아웃 하시겠습니까?')) {
		            alert('로그아웃이 완료되었습니다.');
		            window.location.href = '/member/logout'; // 로그아웃 처리 후 페이지 이동
		        }
		    }); 
		    
		    document.getElementById('deleteAccountBtn').addEventListener('click', function(event) {
		        event.preventDefault(); // 기본 링크 동작 중지
		    
		        if (confirm('정말로 회원탈퇴를 하시겠습니까?')) {
		            alert('회원탈퇴가 완료되었습니다.');
		            window.location.href = '/member/delete'; // 회원탈퇴 처리 후 페이지 이동
		        }
		    }); 
		</script>

<footer class="footer">
    <p>Copyright ⓒ 2023 싸그리싺싺. All rights reserved</p>
    <p>상호명 : (주)싸그리싺싺 | 대표 : 구자민 | 개인정보보호책임자 : 구자민 </p>
    <p>주소 : 서울 마포구 서교동 122 4F / 서울 강남구 역삼동 823 삼원타워 5F | 제휴 문의 : benjamin9jamin@email.com</p>
  <p>싸그리싺싺 사이트 내의 모든 서비스는 영리를 목적으로 하지 않습니다.</p>
</footer>
</body>

</html>