
<%@page import="com.heno.airock.dto.PostVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admin_dashboard.jsp"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%     
         PostVO vo = (PostVO)request.getAttribute("inVO");
         String divValue = vo.getPostDiv();
         String title    = "자유게시판";//10:자유게시판, 20:공지사항
         
         if("20".equals(divValue)){
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
<style>
@font-face {
  font-family: 'Cafe24SsurroundAir';
  src:
    url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff')
    format('woff');
  font-weight: normal;
  font-style: normal;
}

body {
  font-family: 'Cafe24SsurroundAir';
  src:
    url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff')
    format('woff');
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
  box-shadow: 0 0px 3px rgb(71 69 69);
}

.page-title {
  text-align: center;
  margin-bottom: 30px;
}

.post-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
  padding: 10px 0;
  border-bottom: 2px solid #e5e5e5;
}

.post-content {
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0px 4px rgba(0, 0, 0, 0.3);
  margin-top: 15px;
}

.comment {
  padding: 10px;
  margin-top: 15px;
  border: 1px solid #e5e5e5;
  border-radius: 5px;
  background-color: #f9f9f9;
}

.btn-primary {
  padding: 8px 20px;
  background-color: #2a2c33;
  border: none;
  border-radius: 25px;
  cursor: pointer;
}

.btn-primary:hover {
  background-color: #757677;
}

.music-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 0;
  margin-bottom: 15px;
  margin-top: -15px;
  border-bottom: 2px solid #e5e5e5;
}

.comment-user{
font-size: 13px;
font-weight: bold;
}

.comment-time{
  font-size: 12px;
}

.comment-text{
  font-size: 12px;
}

.album-cover {
  width: 60px;
  height: 60px;
  margin-right: 15px;
  object-fit: cover;
}

.music-details {
  flex: 1;
}

.music-details h3 {
  margin: 0;
  font-size: 18px;
}

.music-details p {
  margin: 5px 0;
  font-size: 14px;
  color: #555;
}
.comment-count {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
    color: #888;
}

.ariana {
  font-size: 14px;
  color: gray;
  float: right;
}

.grande{
  font-size: 14px;
  color: gray;
  float: right;
}

.butera{
  font-size: 14px;
  color: gray;
  float: right;
}
</style>
</head>
<body>

<div class="container">

    <div class="containerbox">

  <div class="page-title">
    <h2>${title}</h2>
  </div>


    <div class="row g-1 d-flex justify-content-end">
      <div class="col-auto">
        <input type="button" class="btn btn-primary" value="목록" id="moveToList">
        <input type="button" class="btn btn-primary delete-button" value="삭제" id="doDelete"
           data-post-seq="${outVO.postSeq}"
           <c:if test="${isAdminLoggedIn}">
               disabled="disabled" <%-- 어드민으로 로그인되지 않은 경우 버튼 비활성화 --%>
           </c:if>
    >
      </div>
    </div>  

    <form action="#" name="reg_frm" id="reg_frm">
        <input type="hidden" name="div" id="div" value="${inVO.getPostDiv()}">
        <input type="hidden" name="musicId" id="musicId" value="${outVO.musicId}">

        <div class="post-info">
            <div>
                <p><strong>제목:</strong> ${outVO.postTitle}</p>
                
            </div>
            <div>
            <p class="ariana"><strong>작성자:</strong> ${outVO.userId}</p>
            <div>
                <p class="butera"><strong>등록일:</strong> ${outVO.postDt}
                    <c:if test="${not empty outVO.updateDt}">
                <strong> / 수정일:</strong> ${outVO.updateDt}
                </c:if></p></div>
                <div>
                <p class="grande"><strong>조회:</strong> ${outVO.readCnt}</p>
            </div>
            </div>
        </div>

    <c:if test="${not empty outVO.musicId}">
        <div class="music-info">
            <img class="album-cover" src="${outVO.albumPath}" alt="앨범커버">
            <div class="music-details">
                <h3>${outVO.title} - ${outVO.artist}</h3>
            </div>
        </div>
      </c:if>

        <div class="post-content">
            <p>${outVO.postContents}</p>
        </div>

    </br>

        <div class="comments">
            <h3>댓글 ${comments.size()}개</h3>

<c:forEach var="comment" items="${comments}">
    <div class="comment mb-3 p-3 border rounded">
        <div class="d-flex justify-content-between align-items-center">
            <div class="comment-user">${comment.userId}</div>

                <div class="comment-actions">
                    <button class="btn btn-secondary btn-sm delete-comment-button" data-comment-id="${comment.cmtSeq}">삭제</button>
                </div>

        </div>
        <div class="comment-text mt-2">${comment.cmtContents}</div>
        <c:if test="${not empty comment.cmtUpdateDt}">
          <div class="comment-time text-muted mt-2">수정됨: ${comment.cmtUpdateDt}</div>
        </c:if>
        <c:if test="${empty comment.cmtUpdateDt}">
          <div class="comment-time text-muted mt-2">${comment.cmtDt}</div>
        </c:if>
        </div>
        </c:forEach>

       </div>
    </form>
    </div>
  </div>
  </br>
  </br>
  <script>
  $(document).on("click", ".delete-comment-button", function() {
	  console.log('버튼클릭');
	    var commentId = $(this).data("comment-id");

	    $.ajax({
	        type: "POST",
	        url: "/post/deleteComment",
	        data: {
	            cmtSeq: commentId
	        },
	        success: function(response) {
	            if (response.success) {
	                // 삭제 성공 시에 필요한 로직을 추가하세요.
	                alert("댓글이 삭제되었습니다.");
	                location.reload(); // 댓글 삭제 후 페이지 리로드
	            } else {
	                alert("댓글 삭제에 실패했습니다.");
	            }
	        },
	        error: function() {
	            alert("댓글 삭제에 실패했습니다.");
	        }
	    });
	});
  
  // 삭제 버튼 클릭 시 실행되는 함수
  $(".delete-button").on("click", function () {
      console.log("doDelete");
      var seq = $(this).data("post-seq"); // 삭제할 게시물의 번호 가져오기
      
      // 어드민으로 로그인되었는지 확인
      if (!isAdminLoggedIn) {
          alert("어드민으로 로그인해주세요!");
          return;
      }

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
                  moveToListView();
              } else {
                  alert(result.msgContents);
              }
          },
          error: function (data) { // 서버 응답 실패 시 실행되는 함수
              console.log("error:", data);
          }
      });
  });

  function moveToListView() {
      window.location.href = "/admin/post?div=" + $("#div").val();
  }

  $("#moveToList").on("click", function () {
      if (confirm('목록 화면으로 이동 하시겠습니까?') == false) return;

      moveToListView();
  }); //--moveToList
  </script>  
</body>
</html>