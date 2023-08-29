<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/music_rank.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>음악 순위 페이지</title>
<style>
@font-face {
  font-family: 'Cafe24SsurroundAir';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}

.container {
margin-left: 110px;
}

.body2 {
  font-family: 'Cafe24SsurroundAir';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
  font-weight: normal;
  font-style: normal;
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
  color: white;
  background-color: #2a2c33;
}

#boardTable tbody tr {
  background-color: #f5f5f5;
}

.admin-post td {
  font-weight: bold;
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

.text-center {
  text-align: center;
}

.text-left {
  text-align: left;
}

.row.g-1 {
  margin-top: 10px;
}

form {
  margin-bottom: 20px;
}

.row.g-1 {
  margin-top: 10px;
}

.genre-button {
  background-color: #ffffff;
  color: #8195df;
    border: 1px solid #8195df;
  padding: 5px 15px;
  margin: 5px;
  cursor: pointer;
  border-radius: 5px;
  transition: background-color 0.3s ease, color 0.3s ease;
  box-shadow: 0px 0px 10px #8195df;
  font-weight: bold;
}

.emotion-button {
 background-color: #ffffff;
  color: #a1a1a1;
    border: 1px solid #a1a1a1;
  padding: 5px 15px;
  margin: 5px;
  cursor: pointer;
  border-radius: 30px;
  transition: background-color 0.3s ease, color 0.3s ease;
  box-shadow: 0px 0px 10px #a1a1a1;
  font-weight: bold;
}

.genre-button:hover,
.emotion-button:hover {
  background-color: #44475a;
}

.emotion-button i {
  margin-right: 5px;
  font-size: 20px;
}

.emotion-button:hover .fa-heart {
  color: #ee4f4f;
}

.emotion-button:hover .fa-face-sad-tear {
color: #a1a1a1;
}

.emotion-button:hover .fa-angry {
  color: #ff5555;
}

.emotion-button:hover .fa-thumbs-up {
  color: #547ef5;
}

.emotion-button:hover .fa-smile {
 color: #2ECC71;
}

.emotion-button:hover .fa-frown {
  color: #cd6bff;
}

.emotion-button:hover .fa-face-laugh-squint {
  color: #ffcd39;

}

</style>
</head>
<body class="body2">
<div class="container">

  </br>
  <div class="page-header text-center">
    <h2><c:out value='Popular Chart Top100' /></h2>
  </div>
  <hr class="my-3">
  <div class="row g-1 d-flex justify-content-end text-center">
  <h2 class="text-left">장르별 인기곡</h2>
    <div class="col-sm genre-button" id="genre" onclick="redirectToMusicReg('발라드')">발라드</div>
    <div class="col-sm genre-button" id="genre" onclick="redirectToMusicReg('댄스')">댄스</div>
    <div class="col-sm genre-button" id="genre" onclick="redirectToMusicReg('랩/힙합')">랩/힙합</div>
    <div class="col-sm genre-button" id="genre" onclick="redirectToMusicReg('Soul')">R&B/Soul</div>
    <div class="col-sm genre-button" id="genre" onclick="redirectToMusicReg('인디음악')">인디음악</div>
    <div class="col-sm genre-button" id="genre" onclick="redirectToMusicReg('록/메탈')">록/메탈</div>
    <div class="col-sm genre-button" id="genre" onclick="redirectToMusicReg('트로트')">트로트</div>
    <div class="col-sm genre-button" id="genre" onclick="redirectToMusicReg('포크/블루스')">포크/블루스</div>
  </div>
  <div class="row g-1 d-flex justify-content-end text-center">
  <h2 class="text-left">감정별 인기곡</h2>
    <div class="col-sm emotion-button heart" id="feeling" onclick="redirectToMusicRegEmo('설렘')"><i class="fas fa-heart"></i> 설렘</div>
    <div class="col-sm emotion-button sad" id="feeling" onclick="redirectToMusicRegEmo('슬픔')"><i class="fa-solid fa-face-sad-tear"></i> 슬픔</div>
    <div class="col-sm emotion-button smile" id="feeling" onclick="redirectToMusicRegEmo('편안')"><i class="fas fa-smile"></i> 편안함</div>
    <div class="col-sm emotion-button frown" id="feeling" onclick="redirectToMusicRegEmo('불안')"><i class="fas fa-frown"></i> 불안함</div>
    <div class="col-sm emotion-button angry" id="feeling" onclick="redirectToMusicRegEmo('화')"><i class="fas fa-angry"></i> 화남</div>
    <div class="col-sm emotion-button laugh" id="feeling" onclick="redirectToMusicRegEmo('신남')"><i class="fa-solid fa-face-laugh-squint"></i> 신남</div>
    <div class="col-sm emotion-button thumbs" id="feeling" onclick="redirectToMusicRegEmo('자신감')"><i class="fas fa-thumbs-up"></i> 자신감</div>
  </div>

    <hr class="my-3">
   <table id="boardTable" class="table table-striped table-hover table-bordered" style="table-layout: fixed">
      <thead>
        <tr class="table-info" style="height: 49px;">
          <th class="text-center noWidth" style="width: 3%;">Rank</th>
          <th class="text-center cover" style="width: 20%;">
          Title / Artist</th>
          <th class="text-left albuminfotWidth" style="width: 10%;">앨범</th>
          <th class="text-center genreWidth" style="width: 10%;">장르</th> 
          <th class="text-center genreWidth" style="width: 3%;">감정</th>
          <th class="text-center likeCntWidth" style="width: 3%;">좋아요</th>
          <th style="display:none;">SEQ</th>
        </tr>
      </thead>
      <tbody>
       <c:choose>
         <%-- 조회 데이터가 있는 경우--%>
         <c:when test="${not empty musicList }">
            <c:forEach var="vo" items="${musicList}">
              <tr class="align-middle" onclick="musicClick();" style="height: 85px;">
                <td class="text-center title"><c:out value="${vo.num}"/></td>

<td class="text-left title">
  <div class="text-left truncate-text">
    <div style="display: flex; align-items: center;">
      <img class="album-image" src="<c:out value="${vo.albumPath}"/>" width="60px" height="60px">
      <div style="margin-left: 30px;">
        <span style="font-weight: bold;"><c:out value="${vo.title}" /></span><br />
        <span style="color: #a1a1a1; font-weight: bold; font-size: 14px;"><c:out value="${vo.artist}" /></span>
      </div>
    </div>
  </div>
</td>
                <td class="text-center album">
                <div class="text-left truncate-text">
                <c:out value="${vo.album}"/>
                </div>
                </td>
                <td class="text-center genre">
                <div class="truncate-text">
                <c:out value="${vo.genre}"/>
                </div>
                </td>
                <td class="text-center feeling"><c:out value="${vo.feeling}"/></td>
                <td class="text-center likeCnt"><i class="fa-regular fa-heart" style="color: #ee4f4f;"></i><c:out value=" ${vo.likeCnt}"/></td>
                <td style="display:none;" data-musicid="<c:out value="${vo.musicId}" />"></td>
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
  
  <script src="/resources/js/music_rank.js"></script>
  </div>
</body>
</html>