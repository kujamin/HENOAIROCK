<%@page import="com.heno.airock.dto.PostVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/admin/admin_dashboard.jsp"%>
<c:set var="CP" value="${pageContext.request.contextPath }"/>
<%
   PostVO vo =(PostVO)request.getAttribute("inVO");
   String divValue = vo.getPostDiv();
   String title = "자유게시판"; //10:자유게시판, 20:공지사항
   if("20".equals(divValue)) {
	   title = "공지사항";
   }
   
   request.setAttribute("title", title);
%>
<%
    // 어드민으로 로그인되었는지 확인
    boolean isAdminLoggedIn = session.getAttribute("loggedInAdmin") != null;
    
    // isAdminLoggedIn 값을 JavaScript 변수로 넘겨주기
    out.println("<script>const isAdminLoggedIn = " + isAdminLoggedIn + ";</script>");
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="/resources/js/jquery-3.7.0.js"></script>
<script src="/resources/js/util.js"></script>
<title>${title}</title>
<style>
@font-face {
  font-family: 'Cafe24SsurroundAir';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}

body {
  font-family: 'Cafe24SsurroundAir';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}
.btn-primary {
    padding: 5px 20px;
    background-color: #2a2c33;
    color: white;
    border: none;
    border-radius: 25px;
    cursor: pointer;
}
.btn-primary:hover {
  background-color: #757677;
}

    .containerbox {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
    }

    .page-title {
        margin-bottom: 20px;
        text-align: center;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-check-label {
        font-weight: bold;
    }
</style>
</head>
<body>

  <div class="container">

    <div class="containerbox">
    
  <div class="page-title">
    <h2>공지사항 작성</h2>
  </div>

    <div class="row g-1 d-flex justify-content-end">
        <div class="col-auto">
            <input type="button" class="btn btn-primary" value="목록" id="moveToAdminList">
            <input type="button" class="btn btn-primary" value="등록" id="doSave">
        </div>
    </div>

    <form action="#" name="reg_frm" id="reg_frm">
        <input type="hidden" name="div" id="div" value="${inVO.getPostDiv()}">
        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control title_cls" id="title" name="title"
                   placeholder="(공지) 제목을 입력하세요." required="required" maxlength="66">
        </div>
        
        <div class="mb-3">
            <label for="regId" class="form-label">등록자ID</label>
            <input type="text" class="form-control" id="regId" name="regId" value="${loggedInAdmin.userId}"
                   placeholder="아이디를 입력하세요." readonly="readonly">
        </div>
        
        <div class="mb-3">
            <label for="contents" class="form-label">내용</label>
            <textarea class="form-control" id="contents" name="contents" rows="3" required="required"></textarea>
        </div>
        
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="adminPost" name="adminPost">
            <label class="form-check-label" for="adminPost">어드민 글로 설정</label>
        </div>
    </form>
</div>
</div>
  <!--// contents  ------------------------------------------------------------>
 <script src="/resources/js/admin_post_reg.js"></script>
</body>
</html>