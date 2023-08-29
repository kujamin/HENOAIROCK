<%@page import="com.heno.airock.dto.PostVO"%>
<%@page import="com.heno.airock.cmn.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%       
        PostVO vo = (PostVO)request.getAttribute("inVO");
        String divValue = vo.getPostDiv();
        String title    = "자유게시판";//10:자유게시판, 20:공지사항
        
        if("20".equals(divValue)){
           title = "공지사항";
        }
        
        request.setAttribute("title", title);
        
        //paging
        int bottomCount = 10;
        int pageSize    = 10;
        int pageNo      =  1;
        int totalCnt    =  0;
        String searchWord = "";
        String searchDiv  = "";
          
        if(null != vo){
             pageSize   = vo.getPageSize();
             pageNo     = vo.getPageNo();
             searchDiv  = vo.getSearchDiv();
             searchWord = vo.getSearchWord();
        }
        
        if(null !=  request.getAttribute("totalCnt")){
             totalCnt = Integer.parseInt(request.getAttribute("totalCnt").toString());
        }
        
        String cPath  = request.getContextPath(); 

%>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap">
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>

<title>${title}</title>
<style>
@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.body2 {
/*   background-image: linear-gradient(180deg,#000000 10%,#001a65 100%); */
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.container {
  margin-left: 100px;
}

section{
  margin: 50px;
}

.page-header h2 {
  color: #2a2c33;
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
/*     box-shadow: 0 0px 10px rgb(71 69 69); */
  background-color: transparent;
}

#boardTable th,
#boardTable td {
  padding: 12px;
  text-align: center;
  background-color: rgba(255, 255, 255);
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

#boardTable th {
  color: #ffffff;
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
  background-color: #f2f2f2;
  border: 1px solid #ced4da;
  font-size: 14px;
  color: #333;
  }

.mt-4{
margin-top: -1.5rem !important;
margin-right: 1rem !important;
}

</style>
</head>

<body class="body2">
<div class="container">

  <!-- 제목 -->
  </br>
  <div class="page-header">
    <h2><c:out value='${title}' /></h2>
  </div>
  
      <!-- 검색 form -->
<div class="d-flex justify-content-end mt-4">
  <form action="/post" name="boardFrm" class="d-none d-sm-inline-block form-inline navbar-search">
    <input type="hidden" name="pageNo" id="pageNo">
    <input type="hidden" name="div"    id="div" value='${inVO.getPostDiv()}'>
    <div class="row g-1">
      <div>
        <select class="form-select custom-selects" name="searchDiv" id="searchDiv"> <!-- code table -->
          <option value="">전체</option>
          <c:forEach var="vo" items="${searchList }">
            <option <c:if test="${vo.code == inVO.searchDiv }">selected</c:if> value="<c:out value='${vo.code }'/>"  >
               <c:out value='${vo.codeNm }'/>
            </option>
          </c:forEach>  
        </select>
      </div>  
      <div class="input-group">
        <input type="text" aria-label="Search" aria-describedby="basic-addon2" name="searchWord" id="searchWord" value="<c:out value='${inVO.searchWord }'/>" placeholder="Search for..." class="form-control bg-light border-0 small">
      </div>
                            <div class="input-group-append">
                                <button id="doRetrieve" class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
      </div>
    </div>
  </form>
  </div>
      </br>
<div class="d-flex justify-content-end mt-4">
  <a href="/post/post_reg" class="btn btn-primary ml-auto">등록</a>
</div>
  </br>
  
  <!--// 제목 ------------------------------------------------------------------->
   <table id="boardTable">
      <thead>
        <tr>
   <th class="text-center" style="width: 5%;">No</th>
   <th class="text-center" style="width: 25%;">제목</th>
   <th class="text-center" style="width: 15%;">앨범</th> 
   <th class="text-center" style="width: 15%;">음악 정보</th>
   <th class="text-center" style="width: 10%;">작성자</th>
   <th class="text-center" style="width: 10%;">조회수</th>
   <th class="text-center" style="width: 10%;">작성일</th>
   <th style="display:none;">SEQ</th>
        </tr>
      </thead>
      <tbody>
       <c:choose>
         <%-- 조회 데이터가 있는 경우--%>
         <c:when test="${not empty list }">
            <c:forEach var="vo" items="${list}">
<tr class="table-row <c:if test='${vo.userId eq "어드민"}'>admin-post</c:if>">
    <td style="display:none;"><c:out value="${vo.postSeq}" /></td>
    <td style="vertical-align: middle;">
        <c:choose>
            <c:when test='${vo.userId eq "어드민"}'>

            <span class="notice-text">공지</span>

            </c:when>
            <c:otherwise>
                <c:out value="${vo.postSeq}" />
            </c:otherwise>
        </c:choose>
    </td>
    <td class="text-center" style="vertical-align: middle;"><c:out value="${vo.postTitle}"/></td>
    <c:if test="${not empty vo.musicId}">
        <td class="text-center" style="vertical-align: middle;"><img class="album-cover" src="${vo.albumPath }" alt="앨범커버" width="50px" height="50px"></td>
        <td class="text-left" style="vertical-align: middle;">
            <div class="truncate-text">
                <span style="font-weight: bold; font-size: 13px;"><c:out value="${vo.title}" /></span><br />
                <span style="font-size: 13px; color: #a1a1a1;"><c:out value="${vo.artist}" /></span>
            </div>
        </td>
    </c:if>
    <c:if test="${empty vo.musicId}">
        <td class="text-center" style="vertical-align: middle;"></td>
        <td class="text-center" style="vertical-align: middle;"></td>
    </c:if>
    <td class="text-center" style="vertical-align: middle;">
        <c:set var="email" value="${vo.userId}" />
        <c:set var="username" value="${email.split('@')[0]}" />
        <span class="gaesi" style="color: gray; font-size: 13px;"><c:out value="${username}" /></span>
    </td>
    <td class="text-center" style="vertical-align: middle;">
        <span class="gaesi" style="color: gray; font-size: 13px;"><c:out value="${vo.readCnt}" /></span>
    </td>
    <td class="text-center" style="vertical-align: middle;">
        <span class="gaesi" style="color: gray; font-size: 13px;"><c:out value="${vo.postDt}" /></span>
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
<!-- 페이징 -->
</br>
    <div class="d-flex justify-content-center">
      <%=StringUtil.renderPaging(totalCnt, pageNo, pageSize, bottomCount, cPath+"/post", "select") %>
    </div>
  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/resources/js/post.js"></script>
</div>
</body>

</html>