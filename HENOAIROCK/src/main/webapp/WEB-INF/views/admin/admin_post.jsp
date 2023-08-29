<%@page import="com.heno.airock.dto.PostVO"%>
<%@page import="com.heno.airock.cmn.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/admin/admin_dashboard.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  PostVO vo = (PostVO) request.getAttribute("inVO");
String divValue = vo.getPostDiv();
String title = "자유게시판";//10:자유게시판, 20:공지사항

if ("20".equals(divValue)) {
  title = "공지사항";
}

request.setAttribute("title", title);

//paging
int bottomCount = 10;
int pageSize = 10;
int pageNo = 1;
int totalCnt = 0;
String searchWord = "";
String searchDiv = "";

if (null != vo) {
  pageSize = vo.getPageSize();
  pageNo = vo.getPageNo();
  searchDiv = vo.getSearchDiv();
  searchWord = vo.getSearchWord();
}

if (null != request.getAttribute("totalCnt")) {
  totalCnt = Integer.parseInt(request.getAttribute("totalCnt").toString());
}

String cPath = request.getContextPath();
%>
<%
  // 어드민으로 로그인되었는지 확인
boolean isAdminLoggedIn = session.getAttribute("loggedInAdmin") != null;

out.println("<script>const isAdminLoggedIn = " + isAdminLoggedIn + ";</script>");
%>

<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap">
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>

<title>${title}</title>

<style>
@font-face {
  font-family: 'Cafe24SsurroundAir';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}

.body2 {
  font-family: 'Cafe24SsurroundAir';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}

section {
  margin: 50px;
}

.page-header h2 {
  color: #72a9fb;
  font-size: 24px;
  font-weight: bold;
  text-align: center;
}

#boardTable {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
  background-color: transparent;
}

#boardTable th, #boardTable td {
  padding: 12px;
  text-align: center;
  background-color: rgba(255, 255, 255);
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

#boardTable th {
  color: #72a9fb;
  background-color: #2a2c33;
}

#boardTable tbody tr {
  background-color: #f5f5f5;
}

.admin-post td {
  font-weight: bold;
}

.notice-text {
  display: inline-block;
  background-color: #ff5858;
  color: white;
  padding: 5px 10px;
  border-radius: 20px;
  font-weight: bold;
  font-size: 13px;
  text-align: center;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
  white-space: nowrap;
}

.admin-post td .gaesi {
  color: black !important;
}

.truncate-text {
  max-height: 60px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.table-row {
  height: 76px;
}

.text-center {
  text-align: center;
}

.text-left {
  text-align: left;
}

.form-control {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: auto;
}

.form-select {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.row.g-1 {
  margin-top: 10px;
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

form {
  margin-bottom: 20px;
}

.admin-post {
  position: relative;
}

.custom-selects {
  background-color: #2a2c33;
  border: 1px solid #2a2c33;
  font-size: 14px;
  color: #72a9fb;
  font-weight: bold;
}

.mt-4 {
  margin-top: -1.5rem !important;
  margin-right: 1rem !important;
}

.row.g-1 {
  margin-top: 10px;
}

.form-inline .form-control {
  width: 250px;
  flex: 1;
}

.form-inline .form-select {
  text-align: center;
  margin-right: -57px;
  width: 110px;
  flex: 1;
}

.custom-detail-button {
  background-color: #60b5ff;
  color: white;
  border-color: #60b5ff;
  border-radius: 15px;
  font-size: 14px;
}

.custom-delete-button {
  background-color: #ff6271;
  color: white;
  border-color: #ff6271;
  border-radius: 15px;
  font-size: 14px;
}

.custom-detail-button:hover{
  background-color: #339df9;
  border-color: #339df9;
  opacity: 0.8;
}
.custom-delete-button:hover {
  background-color: #ff3347;
  border-color: #ff3347;
  color: black;
  opacity: 0.8;
}
</style>
</head>
<body class="body2">
  <div class="container">

    </br>

    <div class="page-header">
      <h2>게시판 관리</h2>
    </div>

    <div class="d-flex justify-content-end mt-4">
      <form action="/admin/post" name="boardFrm" class="d-none d-sm-inline-block form-inline navbar-search">
        <input type="hidden" name="pageNo" id="pageNo">
        <input type="hidden" name="div" id="div" value='${inVO.getPostDiv()}'>
        <div class="row g-1">
          <div class="col">
            <select class="form-select custom-selects" name="searchDiv" id="searchDiv">
              <option value="">전체</option>
              <c:forEach var="vo" items="${searchList }">
                <option
                  <c:if test="${vo.code == inVO.searchDiv }">selected</c:if> value="<c:out value='${vo.code }'/>">
                  <c:out value='${vo.codeNm }' />
                </option>
              </c:forEach>
            </select>
          </div>
          <div class="col">
          <div class="input-group">
            <input type="text" aria-label="Search" aria-describedby="basic-addon2" name="searchWord" id="searchWord" value="<c:out value='${inVO.searchWord }'/>" placeholder="Search for..." class="form-control bg-light border-0 small">
          
          <div class="input-group-append">
            <button id="doRetrieve" class="btn btn-primary" type="button">
              <i class="fas fa-search fa-sm"></i>
            </button>
            </div>
          </div>
        </div>
        </div>
      </form>
    </div>
    </br>
<div class="d-flex justify-content-end mt-4">
  <a href="/admin/admin_post_reg" class="btn btn-primary ml-auto">공지 등록</a>
</div>
                    </br>
    <div id="dyContainer"></div>

    <table id="boardTable">
      <thead>
        <tr>
          <th class="text-center" style="width: 5%;">번호</th>
          <th class="text-center" style="width: 25%;">제목</th>
          <th class="text-center" style="width: 15%;">앨범</th>
          <th class="text-center" style="width: 15%;">음악 정보</th>
          <th class="text-center" style="width: 10%;">작성자</th>
          <th class="text-center" style="width: 10%;">조회수</th>
          <th class="text-center" style="width: 10%;">작성일</th>
          <th class="text-center" style="width: 10%;">기능</th>
          <th style="display: none;">SEQ</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <%-- 조회 데이터가 있는 경우--%>
          <c:when test="${not empty list }">
            <c:forEach var="vo" items="${list}">
              <tr
                class="table-row <c:if test='${vo.userId eq "어드민"}'>admin-post</c:if>">
                <td style="display: none;"><c:out value="${vo.postSeq}" /></td>
                <td style="vertical-align: middle;"><c:choose>
                    <c:when test='${vo.userId eq "어드민"}'>

                      <span class="notice-text">공지</span>

                    </c:when>
                    <c:otherwise>
                      <c:out value="${vo.postSeq}" />
                    </c:otherwise>
                  </c:choose></td>
                <td class="text-center" style="vertical-align: middle;"><c:out
                    value="${vo.postTitle}" /></td>
                <c:if test="${not empty vo.musicId}">
                  <td class="text-center" style="vertical-align: middle;"><img
                    class="album-cover" src="${vo.albumPath }" alt="앨범커버"
                    width="50px" height="50px"></td>
                  <td class="text-left" style="vertical-align: middle;">
                    <div class="truncate-text">
                      <span style="font-weight: bold; font-size: 13px;"><c:out
                          value="${vo.title}" /></span><br /> <span
                        style="font-size: 13px; color: #a1a1a1;"><c:out
                          value="${vo.artist}" /></span>
                    </div>
                  </td>
                </c:if>
                <c:if test="${empty vo.musicId}">
                  <td class="text-center" style="vertical-align: middle;"></td>
                  <td class="text-center" style="vertical-align: middle;"></td>
                </c:if>
                <td class="text-center" style="vertical-align: middle;"><c:set
                    var="email" value="${vo.userId}" /> <c:set var="username"
                    value="${email.split('@')[0]}" /> <span class="gaesi"
                  style="color: gray; font-size: 13px;"><c:out
                      value="${username}" /></span></td>
                <td class="text-center" style="vertical-align: middle;"><span
                  class="gaesi" style="color: gray; font-size: 13px;"><c:out
                      value="${vo.readCnt}" /></span></td>
                <td class="text-center" style="vertical-align: middle;"><span
                  class="gaesi" style="color: gray; font-size: 13px;"><c:out
                      value="${vo.postDt}" /></span></td>
                <td class="text-center col-1">
                  <c:if test="${loggedInAdmin != null}">
                    <div class="btn-group">
                      <button class="btn btn-info btn-sm detail-button custom-detail-button"
                        data-post-seq="<c:out value='${vo.postSeq}'></c:out>">
                        <i class="fa-solid fa-check"></i>
                        <div class="button-text">조회</div>
                      </button>
                      <button class="btn btn-danger btn-sm delete-button custom-delete-button"
                        data-post-seq="<c:out value='${vo.postSeq}'></c:out>">
                        <i class="fas fa-trash"></i>
                        <div class="button-text">삭제</div>
                      </button>
                    </div>
                  </c:if>
                  </td>
              </tr>
            </c:forEach>
          </c:when>
          <%-- 조회 데이터가 없는 경우--%>
          <c:otherwise>
            <tr>
              <td colspan="99">검색결과가 없습니다.</td>
            </tr>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>

    </br>

    <div class="d-flex justify-content-center">
      <%=StringUtil.renderPaging(totalCnt, pageNo, pageSize, bottomCount, cPath+"/admin/post", "select") %>
    </div>
  </div>

<script>
function select(url, pageNo){
    console.log("url:"+url);
    console.log("pageNo:"+pageNo);
    
    let frm = document.boardFrm;
    //$("#pageNo").val(1); //jquery
    frm.action = url;
    frm.pageNo.value=pageNo;//javascript
    frm.submit();//controller call
  }
//조회 버튼 클릭 시 실행되는 함수
$(".detail-button").on("click", function () {
    console.log("doDetail");
    var seq = $(this).data("post-seq"); // 조회할 게시물의 번호 가져오기
    // div, seq
    // http://localhost:8080/ehr/board/doSelectOne.do?div=10&seq=393
    window.location.href = "/admin/select?div=" + $("#div").val() + "&seq=" + seq;
});
   // 삭제 버튼 클릭 시 실행되는 함수
   $(".delete-button").on("click", function () {
       console.log("doDelete");
       var seq = $(this).data("post-seq"); // 삭제할 게시물의 번호 가져오기
       if (confirm('삭제 하시겠습니까') == false) return;
       $.ajax({
           type: "GET",
           url: "/admin/delete", // 삭제를 처리하는 서버 URL
           async: true, // 비동기 처리
           dataType: "html", // 응답 데이터 형식은 HTML로 설정
           data: {
               postDiv: $("#div").val(), // 게시물 구분 값
               postSeq: seq // 게시물 번호
           },
           success: function (data) { // 서버 응답 성공 시 실행되는 함수
               console.log("success data:", data);
               var result = JSON.parse(data); // JSON 데이터로 변환
               if ("1" === result.msgId) { // 성공적으로 삭제되었을 경우
                   alert(result.msgContents);
                   location.reload(); // 삭제 후 페이지 새로고침
               } else {
                   alert(result.msgContents);
               }
           },
           error: function (data) { // 서버 응답 실패 시 실행되는 함수
               console.log("error:", data);
           }
       });
   });
   // 조회 버튼 클릭 시 실행되는 함수
   $("#doRetrieve").on("click", function () {
       console.log("doRetrieve");
       doRetrieveCall(1); // 페이지 번호 1로 조회 호출
   });
   // 검색어 입력란에서 Enter 키를 누를 때 실행되는 함수
   $("#searchWord").on("keypress", function (e) {
       console.log("searchWord");
       if (13 === e.which) { // Enter 키의 키코드
           e.preventDefault();
           doRetrieveCall(1); // 페이지 번호 1로 조회 호출
       }
   });
   // 게시물 목록 조회 함수
   function doRetrieveCall(pageNo) {
       var frm = document.boardFrm;
       frm.pageNo.value = pageNo;
       frm.submit();
   }
</script>
  
</body>

</html>