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
        String genre = "";
        String feeling = "";
        
        if(null != vo){
             pageSize   = vo.getPageSize();
             pageNo     = vo.getPageNo();
             searchDiv  = vo.getSearchDiv();
             searchWord = vo.getSearchWord();
             genre = vo.getGenre();
             feeling = vo.getFeeling();
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
<link rel="stylesheet" type="text/css" href="/resources/css/music_reg.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
.btn-primary {
    padding: 5px 20px;
    background-color: #2a2c33; /* New primary color */
    color: white;
    border: none;
    border-radius: 25px;
    cursor: pointer;
   }
</style>
</head>
<body class="body2">

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
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('발라드')">발라드</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('댄스')">댄스</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('랩/힙합')">랩/힙합</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('Soul')">R&B/Soul</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('인디음악')">인디음악</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('록/메탈')">록/메탈</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('트로트')">트로트</div>
    <div class="col-sm" id="genre" onclick="redirectToMusicReg('포크/블루스')">포크/블루스</div>
  </div>
  <div class="row g-1 d-flex justify-content-end ">
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('설렘')">설렘</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('슬픔')">슬픔</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('편안')">편안함</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('불안')">불안함</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('화')">화남</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('신남')">신남</div>
    <div class="col-sm" id="feeling" onclick="redirectToMusicRegEmo('자신감')">자신감</div>
  </div>
  <hr class="my-2">
  <form action="/music/music_reg" method="get" name="boardFrm">
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
        <input type="hidden" name="genre" id="genre" value="<c:out value='${inVO.genre }'/>" class="form-control">
        <input type="hidden" name="feeling" id="feeling" value="<c:out value='${inVO.feeling }'/>" class="form-control">
      </div>
      <div class="col-auto">  
        <a href="#" class="btn btn-primary" id="doRetrieve">검색</a>  
      </div>      
    </div>  
  </form>
  <hr class="my-2">
   <table id="boardTable" class="table table-hover table-striped table-sm table-borderless" style="table-layout: fixed">
      <thead>
        <tr class="table-danger" style="height: 49px;">
          <th class="text-center noWidth">No</th>
          <th class="text-center albumtWidth"></th>
          <th class="text-left">곡정보</th>
          <th class="text-left">앨범</th>
          <th class="text-center">장르</th> 
          <th class="text-center">감정</th>
          <th style="display:none;">SEQ</th>
        </tr>
      </thead>
      <tbody>
       <c:choose>
         <%-- 조회 데이터가 있는 경우--%>
         <c:when test="${not empty musicList }">
            <c:forEach var="vo" items="${musicList}">
              <tr class="align-middle" onclick="musicClick();">
                <td style="display:none;" data-musicid="<c:out value="${vo.musicId}" />"></td>
                <td style="display:none;" class="title" data-title="${vo.title}"><c:out value="${vo.title}"/></td>
                <td style="display:none;" class="artist" data-artist="${vo.artist}"><c:out value="${vo.artist}"/></td>
                <td class="text-center col-sm"><c:out value="${vo.num}"/></td>
                <td class="text-center col-sm" data-albumpath="${vo.albumPath}"><img class="album-image" src="<c:out value="${vo.albumPath}"/>" width="60px" height="60px"></td>
                <td class="text-left title col-sm">
                  <div class="truncate-text">
                    <c:out value="${vo.title}" /><br />
                    <c:out value="${vo.artist}" />
                  </div></td>
                <td class="text-center col-sm" data-album="${vo.album}"><div class="truncate-text"><c:out value="${vo.album}"/></div></td>
                <td class="text-center col-sm" data-genre="${vo.genre}"><div class="truncate-text"><c:out value="${vo.genre}"/></div></td>
                <td class="text-center col-sm" data-feeling="${vo.feeling}"><c:out value="${vo.feeling}"/></td>
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
      <%=StringUtil.renderPaging(totalCnt, pageNo, pageSize, bottomCount, cPath+"/music/music_reg", "select") %>
    </div>
    <script src="/resources/js/music_reg.js"></script>
</div>
</body>

</html>