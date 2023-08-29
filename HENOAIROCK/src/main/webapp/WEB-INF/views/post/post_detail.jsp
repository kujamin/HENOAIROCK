<%@page import="com.heno.airock.dto.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  PostVO vo = (PostVO) request.getAttribute("inVO");
String divValue = vo.getPostDiv();
String title = "자유게시판";//10:자유게시판, 20:공지사항
if ("20".equals(divValue)) {
  title = "공지사항";
}
request.setAttribute("title", title);
%>

<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<!-- <link rel="stylesheet" type="text/css"
  href="/resources/css/post_detail.css"> -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
  crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
  crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<script src="/resources/js/post_detail.js"></script>
<title>${title}</title>
<style>
.h5{
font-weight: bold;
}

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
  margin-left: 97px;
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
  margin-top: 0px;
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

.comment-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 0;
  margin-bottom: -35px;
  margin-top: -20px;
  border-top: 2px solid #e5e5e5;
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
  margin-bottom: 10px;
}

.butera{
  font-size: 14px;
  color: gray;
  float: right;
}

.text-right{
  text-align: right;
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
</style>
</head>

<body>

  <div class="container">

    </br>

      <div class="containerbox">

  <div class="page-title">
    <h2>${title}</h2>
  </div>

    <div class="row g-1 d-flex justify-content-end">
      <div class="col-auto">
        <input type="button" class="btn btn-primary" value="목록" id="moveToList">
      </div>
    </div>

    <form action="#" name="reg_frm" id="reg_frm">
        <input type="hidden" name="div" id="div" value="${inVO.getPostDiv()}">
        <input type="hidden" name="musicId" id="musicId" value="${outVO.musicId}">
        <input type="hidden" name="seq" id="seq" value="${inVO.getPostSeq()}">
        <input type="hidden" name="userId" id="userId" value="${sessionScope.user.userId}">
        
        <div class="post-info">
            <div>
                <p><strong>제목:</strong> ${outVO.postTitle}</p>
            </div>
            <div>
            <p class="ariana"><strong>작성자:</strong> ${outVO.userId}</p>
            <div>
                <p class="butera"><strong>&nbsp&nbsp&nbsp등록일:</strong>${outVO.postDt}
                    <c:if test="${not empty outVO.updateDt}">
                <strong> / 수정일:</strong> ${outVO.updateDt}
                </c:if></p></div>
                
                <div>
                <p class="grande"><strong>조회:</strong> ${outVO.readCnt}</p>
            </div>
            </div>
        </div>
		      <c:if test="${not empty outVO.musicId}">
        <div class="music-info" onclick="musicClick" id="musicClick">
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

			<p class="btn_set">
			    <c:set var="writer" value="${outVO.userId }" />
			    <c:set var="currentUser" value="${sessionScope.user.userId}" />
    </br>
			    <c:if test="${writer eq currentUser}">
			        <input type="button" class="btn btn-secondary" value="수정" id="doUpdate">
			        <input type="button" class="btn btn-secondary" value="삭제" id="doDelete">
			    </c:if>
			</p>
    </br>
    <div class="comment-info"></div>
</br>
                <h5 class="h5">댓글 작성</h5>

    <div class="comment-input text-right">
        <textarea class="form-control" id="comments" name="comments" rows="4"></textarea>
        </br>
        <button class="btn btn-secondary btn-rg" type="button" id="doAddComment">댓글 추가</button>
    </div>

    <div id="commentList">

    </div>



        <div class="comments">
<h5>댓글 ${comments.size()}개</h5>
<c:forEach var="comment" items="${comments}">
    <div class="comment mb-3 p-3 border rounded">
        <div class="d-flex justify-content-between align-items-center">
            <div class="comment-user">${comment.userId}</div>
            <c:if test="${comment.userId eq currentUser}">
                <div class="comment-actions">
                    <button class="btn btn-secondary btn-sm edit-comment-button" data-comment-id="${comment.cmtSeq}">수정</button>
                    <button class="btn btn-secondary btn-sm delete-comment-button" data-comment-id="${comment.cmtSeq}">삭제</button>
                </div>
            </c:if>
        </div>
        <div class="comment-text mt-2">${comment.cmtContents}</div>
        <c:if test="${not empty comment.cmtUpdateDt}">
          <div class="comment-time text-muted mt-2">${comment.cmtUpdateDt} (수정됨)</div>
        </c:if>
        <c:if test="${empty comment.cmtUpdateDt}">
          <div class="comment-time text-muted mt-2">${comment.cmtDt}</div>
        </c:if>
        
        <div class="comment-edit-form mt-2" style="display: none;">
            <textarea class="form-control editedComment comment-input" rows="4"></textarea>
            <input type="hidden" class="commentId" value="${comment.cmtSeq}">
            <button type="button" class="btn btn-secondary btn-sm submitEdit mt-2">수정 완료</button>
            <button type="button" class="btn btn-secondary btn-sm cancelEdit mt-2">취소</button>
        </div>
    </div>
</c:forEach>
</div>
</form>
</div>

</br>
</br>
</br>

</div>

</body>
</html>