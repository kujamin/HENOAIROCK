<%@page import="com.heno.airock.dto.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }" />
<%
	PostVO vo = (PostVO) request.getAttribute("inVO");
String divValue = vo.getPostDiv();
String title = "자유게시판"; //10:자유게시판, 20:공지사항
if ("20".equals(divValue)) {
	title = "공지사항";
}

request.setAttribute("title", title);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link rel="shortcut icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
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
<title>${title}</title>
</head>
<body>
	<!-- contents  -->
	<div class="container">
		<!-- 소 제목 -->
		<div class="page-title">
			<h2>${title}</h2>
		</div>

		<!--// 소 제목 end ------------------------------------------------------------->

		<!-- 버튼 -->
		<div class="row g-1 d-flex justify-content-end">
			<div class="col-auto">
				<input type="button" class="btn btn-primary" value="목록"
					id="moveToList"> <input type="button"
					class="btn btn-primary" value="등록" id="doSave">
			</div>
		</div>
		<!--// 버튼 ----------------------------------------------------------------->
		<form action="#" name="reg_frm" id="reg_frm">
			<input type="hidden" name="div" id="div" value="${inVO.getPostDiv()}">
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

			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea class="form-control" id="contents" name="contents"
					rows="3" required="required"></textarea>
			</div>

			<div class="mb-3">
				<label for="musicContents" class="form-label musicContents">곡정보</label>
			</div>

			<div id="albumImageContainer" class="album-info-container">
				<div class="album-content">
					<img class="selected-album-image">
					<div class="info">
						<span class="selected-title"></span>
						<span class="selected-artist"></span>
					</div>
				</div>
				<div class="album-info">
					<div class="selected-album"></div>
					<input type="hidden" class="selected-musicId" name="musicId"
						id="musicId">
				</div>
			</div>

			<div class="row g-1 d-flex justify-content-end">
				<div class="col-auto">
					<input type="button" class="btn btn-primary" value="음악 선택"
						id="openPopupBtn">
				</div>
			</div>

		</form>
	</div>
	<!--// contents  ------------------------------------------------------------>
	<script src="/resources/js/post_reg.js"></script>
</body>
</html>