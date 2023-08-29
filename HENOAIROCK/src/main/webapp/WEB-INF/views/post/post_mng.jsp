<%@page import="com.heno.airock.dto.PostVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%       
         String title    = "자유게시판";//10:자유게시판, 20:공지사항
       
         request.setAttribute("title", title);
%>

<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link rel="shortcut icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
<link rel="stylesheet" type="text/css"
  href="/resources/css/post_reg.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>${title}</title>
</head>
<body>
  <!-- contents  -->  
  <div class="container">
  <!-- 소 제목 -->
  <div class="page-title">
    <h2>${title}</h2>
  </div>
    <input type="hidden" name="div" id="div" value="${inVO.getPostDiv()}">
    <input type="hidden" name="seq" id="seq" value="${inVO.getPostSeq()}">
    <input type="hidden" name="userId" id="userId" value="${sessionScope.user.userId}">
    
      <div class="content">
      <form action="#"  name="reg_frm" id="reg_frm">
      <section>
        <table class="table table-striped table-hover">
          <colgroup>
            <col style="width: 10%;" />
            <col style="width: 23%;" />
            <col style="width: 10%;" />
            <col style="width: 23%;" />
          </colgroup>
          <tbody>
            <tr>
              <c:if test="${not empty outVO.musicId}">
                <th scope="row">음악 정보</th>
                <td><img class="album-cover" src="${outVO.albumPath }"
                  alt="앨범커버" width="60px" height="60px" id=musicClick name=musicClick></td>
                <th scope="row">곡이름</th>
                <td>${outVO.title} - ${outVO.artist }</td>
                <th scope="row">등록일</th>
                <td>${outVO.postDt}</td>
              </c:if>
              <c:if test="${empty outVO.musicId}">
                <th scope="row">음악 정보</th>
                <td>음악 정보가 없습니다.</td>
                <th scope="row">등록일</th>
                <td colspan="2">${outVO.postDt}</td>
              </c:if>
            </tr>
            <tr>
              <th scope="row">제목</th>
              <td><input type="text" class="form-control title_cls" id="title"  name="title"
             placeholder="제목을 입력 하세요." required="required" maxlength="66"  value="${outVO.postTitle}"></td>
              <th scope="row">조회</th>
              <td colspan="4">${outVO.readCnt}</td>
            </tr>
            <tr>
              <th scope="row">글쓴이</th>
              <td colspan="5">${outVO.userId}</td>
            </tr>
            <tr>
              <th scope="row">내용</th>
              <td colspan="5"></td>
            </tr>
            <tr>
              <th scope="row" colspan="8"> <div class="content">
          <textarea class="form-control" id="contents" name="contents" rows="3" required="required">${outVO.postContents}</textarea>
        </div></th>
            </tr>
            <tr>
              <th scope="row">곡 추가하기</th>
              <td colspan="4"><div id="albumImageContainer" class="album-info-container">
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
      </div></td>
      <td><div class="row g-1 d-flex justify-content-end">
        <div class="col-auto">
          <input type="button" class="btn btn-secondary" value="음악 선택"
            id="openPopupBtn">
        </div>
      </div></td>
          </tbody>
        </table>
        
        <hr class="my-2">
        <p class="btn_set">
          <c:set var="writer" value="${outVO.userId }" />
          <c:set var="currentUser" value="${sessionScope.user.userId}" />
          
          <c:if test="${writer eq currentUser}">
          <input type="button" class="btn btn-secondary" value="수정하기"
            id="doUpdate">
          </c:if>
            <input type="button" class="btn btn-secondary" value="돌아가기" id="moveToList">
        </p>
      </section> 
      </form>  
    </div>
    </div>
  <!--// contents  ------------------------------------------------------------>
  <script>
  
  //음악 선택시 팝업 창 열기
  document.getElementById("openPopupBtn").addEventListener("click", function() {
	    var popupUrl = "/music/music_reg"; // music.jsp 경로
	    var popupName = "MusicPopup";
	    var popupOptions = "width=800,height=600,resizable=yes,scrollbars=yes";
	    var popupWindow = window.open(popupUrl, popupName, popupOptions);
	});
  
      //수정
      $("#doUpdate").on("click",function(){
        console.log("doUpdate");
        //제목,내용,div,mod_id(session),seq
        
        if(eUtil.ISEmpty($("#title").val()) == true){
           alert("제목을 입력 하세요.");
           $("#title").focus();
           return;
        }
        
        if(eUtil.ISEmpty($("#contents").val()) ==true  ){
           alert("내용을 입력 하세요.");
           $("#contents").focus();
           return;
        } 
        console.log('modId:'+'${sessionScope.user.userId}');
        if(confirm('수정 하시겠습니까?') == false) return;
        
        //ajax로 비동기 통신 
        $.ajax({
            type: "POST",
            url:"/post/update",
            asyn:"true",
            dataType:"html",
            data:{
              postTitle: $("#title").val(),
              postContents: $("#contents").val(),
              userId: '${sessionScope.user.userId}',
              postSeq: $("#seq").val(),
              musicId: $("#musicId").val()
            },
            success:function(data){//통신 성공
              console.log("success data:"+data);
              let parsedJson = JSON.parse(data);
              if("1" == parsedJson.msgId){
                alert(parsedJson.msgContents);
                moveToListView();
              }else{
                alert(parsedJson.msgContents);
              }
            },
            error:function(data){//실패시 처리
              console.log("error:"+data);
            }
         });
        
        
      });
      //--수정-------------------------------------------------------------------
      function moveToListView(){
    	  window.location.href = "/post/select?div="+$("#div").val()+"&seq="+$("#seq").val();
      }
      $("#moveToList").on("click",function(){
          if(confirm('수정을 취소하시고 돌아가겠습니까? (변경된 사항은 저장되지 않습니다.)')==false)return;
          
          moveToListView();
      });//--moveToList
      

  </script>  
</body>
</html>