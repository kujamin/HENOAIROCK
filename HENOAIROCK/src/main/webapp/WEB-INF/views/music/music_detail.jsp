<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
  crossorigin="anonymous">
<link rel="stylesheet" href="${CP}/resources/css/music_detail.css">
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
  crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>곡 정보</title>
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
/* 애니메이션 스타일링 */
@
keyframes fadeIn {from { opacity:0;
  transform: translateY(-10px);
}

to {
  opacity: 1;
  transform: translateY(0);
}

}

/* 가사 스타일링 */
.lyrics-content {
  white-space: pre-line; /* 줄 바꿈 유지 */
  font-family: Arial, sans-serif;
  font-size: 16px;
  line-height: 1.5;
}

.lyrics-box {
  display: none;
  animation: fadeIn 0.5s ease-out;
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
  <header class="text-center py-3">
    <a class="header-logo" href="#">HENOAIROCK</a>
    <input type="hidden" id= "like" value="${like}" name="like" >
    <input type="hidden" id="musicId" value="${musicDetail.musicId}" name="musicId" >
    <input type="hidden" id= "userId" value="${sessionScope.userId}" name="userId" >     
  </header>
  <div class="container my-3">
    <h2 class="border-bottom py-2">곡 정보</h2>
    <div class="row">
      <div class="col-md-4">
        <div class="form-group">
          <img class="album-cover" src="${musicDetail.albumPath}" alt="앨범 커버">
          <c:choose>
            <c:when test="${1 eq like}">
                <img id="LikeBtn" src="/resources/images/heart_full.png" width = 30 height = 30 name="LikeBtn" onclick="fn_like()">  
            </c:when>
            <c:otherwise>
                <img id="LikeBtn" src="/resources/images/heart_line.png" width = 30 height = 30 name="LikeBtn" onclick="fn_like()"> 
            </c:otherwise>
          </c:choose>
          <!--<input type="button" id="LikeBtn" name="LikeBtn" onclick= "fn_like()">  -->
        </div>
      </div>
      <div class="col-md-8">
        <div class="song-details">
          <p class="song-title">${musicDetail.title}</p>
          <p class="song-album">${musicDetail.album}</p>
          <p class="song-artist">${musicDetail.artist}</p>
          <p class="song-genre">${musicDetail.genre}</p>
          <div class="song-youtube">
            <iframe width="450" height="280" src="${musicDetail.embedLink}"
              frameborder="0" allowfullscreen></iframe>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <button class="btn-lyrics my-3 btn-primary" onclick="toggleLyrics()">가사
            보기</button>
          <div class="lyrics-box" id="lyricsBox">
            <h3>가사</h3>
            <div class="lyrics-content">
              <!-- 가사를 스타일링하여 표시 -->
              <%-- <pre>${musicDetail.lyrics}</pre> --%>
              <p style="white-space: pre-line; font-family: Cafe24SsurroundAir; font-size: 16px; line-height: 1.5; text-align: center;">${musicDetail.lyrics}</p>
                
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="${CP}/resources/js/music_detail.js"></script>
</body>

</html>