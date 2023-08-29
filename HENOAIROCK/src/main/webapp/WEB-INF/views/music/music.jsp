<%@page import="com.heno.airock.dto.MusicVO"%>
<%@page import="com.heno.airock.cmn.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%       
        MusicVO vo = (MusicVO)request.getAttribute("inVO");
        String divValue = vo.getFeeling();
        String title    = "음악검색";
        
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
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>${title}</title>

</head>
<body>

<div class="container">
  <!-- Content here -->
  <!-- 제목 -->
  <div class="page-header">
    <h2><c:out value='${title}' /></h2>
  </div>
  <hr class="my-2">
  
  <!--// 제목 ------------------------------------------------------------------->
  <!-- 검색 form -->
  <div class="row g-1 d-flex justify-content-end ">
    <div class="col-sm" id="genre" onclick="location.href='music?genre=발라드';">발라드</div>
    <div class="col-sm" id="genre" onclick="location.href='music?genre=댄스';">댄스</div>
    <div class="col-sm" id="genre" onclick="location.href='music?genre=랩/힙합';">랩/힙합</div>
    <div class="col-sm" id="genre" onclick="location.href='music?genre=Soul';">R&B/Soul</div>
    <div class="col-sm" id="genre" onclick="location.href='music?genre=인디음악';">인디음악</div>
    <div class="col-sm" id="genre" onclick="location.href='music?genre=록/메탈';">록/메탈</div>
    <div class="col-sm" id="genre" onclick="location.href='music?genre=트로트';">트로트</div>
    <div class="col-sm" id="genre" onclick="location.href='music?genre=포크/블루스';">포크/블루스</div>
  </div>
  <hr class="my-2">
  <form action="/music" method="get" name="boardFrm">
    <input type="hidden" name="pageNo" id="pageNo">
    <div class="row g-1 d-flex justify-content-left">
      <div class="col-auto">
        <select class="form-select" name="searchDiv" id="searchDiv"> <!-- code table -->
          <option value="">전체</option>
          <c:forEach var="vo" items="${searchList }">
            <option <c:if test="${vo.code == inVO.searchDiv }">selected</c:if> value="<c:out value='${vo.code }'/>"  >
               <c:out value='${vo.codeNm }'/>
            </option>
          </c:forEach>  
        </select>
      </div>
      
      <div class="col-sm">
        <input type="text" name="searchWord" id="searchWord" value="<c:out value='${inVO.searchWord }'/>" placeholder="검색어를 입력 하세요" class="form-control">
      </div>
      <div class="col-auto">  
        <select class="form-select" name="pageSize" id="pageSize">
          <c:forEach var="vo" items="${pageSizeList }">
            <option <c:if test="${vo.code == inVO.pageSize }">selected</c:if> value="<c:out value='${vo.code }'/>">
               <c:out value='${vo.codeNm }'/>
            </option>
          </c:forEach>
        </select>
      </div>  
      <div class="col-auto">  
        <a href="#" class="btn btn-primary" id="doRetrieve">검색</a>  
      </div>      
    </div>  
  </form>
  <div id="dyContainer">
  </div>
  <hr class="my-2">
   <table id="boardTable" class="table table-striped table-hover table-bordered  thead-dark thead-inverse">
      <thead>
        <tr  class="table-primary" >
          <th class="text-center">번호</th>  
           <th class="text-center">제목</th>
           <th class="text-center">아티스트</th>  
           <th class="text-center">앨범</th>
           <th class="text-center">장르</th> 
           <th class="text-center">감정</th>
           <th class="text-center">좋아요</th>
           <th style="display:none;">SEQ</th>    
        </tr>
      </thead>
      <tbody>
       <c:choose>
         <%-- 조회 데이터가 있는 경우--%>
         <c:when test="${not empty musicList }">
            <c:forEach var="vo" items="${musicList}">
              <tr>  
                <td class="text-center    col-sm-0  col-md-0  col-lg-0"><img src="<c:out value="${vo.albumPath}"/>" width="60px" height="60px"></td>
                <td class="text-center    col-sm-4  col-md-4  col-lg-4"><a href="#"><c:out value="${vo.title}"/></a></td>
                <td class="text-center  col-sm-1  col-md-1  col-lg-1"><c:out value="${vo.artist}"/></td>
                <td class="text-center  col-sm-4  col-md-4  col-lg-4"><c:out value="${vo.album}"/></td>
                <td class="text-center col-sm-1  col-md-1 col-lg-1"><c:out value="${vo.genre}"/></td>
                <td class="text-center     col-sm-1  col-md-1  col-lg-1"><c:out value="${vo.feeling}"/></td>
                <td class="text-center     col-sm-1  col-md-1  col-lg-1"><c:out value="${vo.likeCnt}"/></td>
                <td style="display:none;"><c:out value="${vo.musicId}"/></td>
              </tr>            
            </c:forEach>
         </c:when>
         
         <%-- 조회 데이터가 없는 경우--%>
         <c:otherwise>
           <tr>
              <td  class="text-center col-sm-12  col-md-12  col-lg-12" colspan="99">No data found.</td>
           </tr>
         </c:otherwise>
       </c:choose>
      </tbody>
</table>
      <!-- 페이징 -->
    <div class="d-flex justify-content-center">
      <%=StringUtil.renderPaging(totalCnt, pageNo, pageSize, bottomCount, cPath+"/music", "select") %>
    </div>
    <script src="/resources/js/music.js"></script>
  </div>   
</body>

</html>