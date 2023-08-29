
<%@page import="com.heno.airock.dto.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
  crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
  href="/resources/css/post_reg.css">
<!-- JavaScript Bundle with Popper -->


<style>
  /*큰 외부 테두리 안에 작은 컨테이너 박스 박스*/
  .container {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.3); /* 연하게 수정 */
    padding: 30px;
    margin-bottom: 20px;
    margin-top: 15px;
  }
  
   .btn-primary {
    padding: 5px 20px;
    background-color: #2a2c33; /* New primary color */
    color: white;
    border: none;
    border-radius: 25px;
    cursor: pointer;
   }


    .btn-primary:hover {
      background-color: #757677; /* Darker color on hover */
    }

  

</style>

<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
  crossorigin="anonymous"></script>
<script src="/resources/js/jquery-3.7.0.js"></script>
<script src="/resources/js/util.js"></script>
<title>플레이리스트 추가</title>
</head>
<body>
  <!-- contents  -->
  <div class="container">
    <!-- 소 제목 -->
    <div class="page-title">
      <h2>앨범아트</h2>
    </div>

    <!--// 소 제목 end ------------------------------------------------------------->

    <!-- 버튼 -->
    <div class="row g-1 d-flex justify-content-end">
      <div class="col-auto">
           <input type="button"
          class="btn btn-primary" value="등록" id="doSave">
      </div>
    </div>
    <!--// 버튼 ----------------------------------------------------------------->
    <form action="#" name="reg_frm" id="reg_frm">
      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">제목</label>
        <input type="text" class="form-control title_cls" id="title"
          name="title" placeholder="제목을 입력 하세요." required="required"
          maxlength="66">
      </div>

      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">등록자ID</label>
        <input type="text" class="form-control" id="regId" name="regId"
          value="${sessionScope.user.userId }" placeholder="아이디를 입력 하세요."
          readonly="readonly">
      </div>
    </form>
  </div>
  <!--// contents  ------------------------------------------------------------>
  <script src="/resources/js/mylist_reg.js"></script>
</body>
</html>