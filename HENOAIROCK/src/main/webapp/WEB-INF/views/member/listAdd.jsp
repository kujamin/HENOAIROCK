<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  String myListSeq = request.getParameter("myListSeq");
%>
<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/resources/css/LIST.css">
<!-- <link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
  crossorigin="anonymous"> -->
<!-- <script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
  crossorigin="anonymous"></script> -->
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>곡 정보</title>
<style>



</style>
</head>
<body class="body2">
<div id="musicList" class="mw">
<div class="meta_info">

    <img class="meta_info_img" alt="" src="${outVO.albumImg}">
    <div class="meta_info_text absolute p-16">
        <h1 id="title" class="editable" onclick="makeEditable(this)">${outVO.title}</h1>  
 <!-- 노래 모음 -->
 		<div class="additional-content">
            <button class="fs" style="border: none;">
                <img class="horizen_mmimg" src="https://api1.indj.club/api/v3/channel/image/profile/profile_51532_340788244122.jpg" alt="이미지">
                <div id="meta_info" class="ell">
                    <p class="meta_info_title ell">${outVO3.name}</p>
                    <br/>
                </div>
            </button>
        </div> 
   </div>
</div>

<div class="button-container">
    <button class="btn-basic btn-add">추가하기</button>
    <button class="btn-basic btn-reset">선택 초기화</button>
    <button class="titleMod" onclick="showInputBox()">제목 수정</button>
</div>

<table class="list-wrap">
  <thead>
    <tr>
<th scope="col" class="hd-check">선택</th>
      <th scope="col" class="hd-album" width="80">앨범</th>
      <th scope="col" class="hd-info narrow-column">가수</th>
      <th scope="col" class="hd-btns" width="400">제목</th>
      <th scope="col" class="hd-btns">장르</th>
      <th scope="col" class="hd-btns">감정</th>
      <th scope="col" class="hd-btns">뮤비</th>


    </tr>
  </thead>

  <tbody>
   <c:forEach var="vo" items="${outVO2}">
    <tr class="list">
    <!-- 선택  -->
          <td class="check"><input type="checkbox" class="select-check" title="" id="${vo.musicId}"></td>

          <!-- 앨범 이미지  -->
          <td><a href="#" class="cover" onclick="fnViewAlbumLayer('84019740');return false;">
            <span class="mask"></span>
              <img src="${vo.albumPath}" onerror="this.src='//image.genie.co.kr/imageg/web/common/blank_68.gif';" alt="NewJeans 2nd EP 'Get Up'"></a>
          </td>
          
          <!-- 가수  -->
          <td class="link"><a href="#" class="btn-basic btn-info">${vo.artist}</a></td>
          
          <!-- 제목  -->
          <td class="info">   
              <a href="#" class="title ellipsis" title="재생">${vo.title}</a>
          </td>
          
          <!-- 장르  -->   
          <td class="btns"><a href="#" class="btn-basic btn-listen" title="재생">${vo.genre}</a></td>
          
          <!-- 감정  -->   
          <td class="btns"><a href="#" class="btn-basic btn-listen" title="재생">${vo.feeling}</a></td>
          <!-- 뮤비 -->
          <td class="btns">
              <div class="toggle-button-box lyr-mv" id="list-mv_102563175">
                  <a href="${vo.embedLink}" target='_blank' class="btn btn-basic btn-mv" title="뮤비">링크</a>
              </div>
          </td>
      </tr>
      
      
      </c:forEach>
  </tbody>
  
</table>
</div>
<script>


$(".btn-reset").on("click", function (e) {
    // 모든 체크박스를 언체크
    $(".select-check").prop("checked", false);
});

$(".btn-add").on("click", function (e) {
    // 체크된 체크박스들을 선택합니다.
    let selectedCheckboxes = $(".select-check:checked");
    // 선택된 체크박스의 ID 값을 저장할 배열을 생성합니다.
    let selectedIds = [];
    // 선택된 체크박스의 ID 값을 배열에 추가합니다.
    let myListSeq = "<%= myListSeq %>";

    selectedCheckboxes.each(function() {
        selectedIds.push($(this).attr("id"));
    });
    
<%--     selectedIds.forEach(function(id) {
        // 여기에서 선택된 ID에 해당하는 항목을 삭제하실 수 있습니다.
        // 예를 들어, 해당 ID를 서버로 전송하여 삭제 작업을 수행하거나,
        // 화면에서 직접 해당 항목을 삭제할 수 있습니다.
        // 이 예제에서는 console.log를 사용하여 ID 목록을 출력합니다.
        console.log("추가할 ID: " + id);

        // JSP에서 전달한 myListSeq 값을 JavaScript 변수에 할당합니다.
        let myListSeq = "<%= myListSeq %>";
        // 이제 myListSeq 변수를 사용하여 JavaScript 코드를 작성할 수 있습니다.
        console.log("myListSeq 값: " + myListSeq);
        
    }); --%>
    console.log("추가할 selectedIds: " + selectedIds);
    console.log("myListSeq 값: " + myListSeq);
    
    let requestData = {
          myListSeq: myListSeq,
          musicIds: selectedIds
      };
    $.ajax({
        type: "POST",
        url: "/mypage/addCustom",
        async: "true",
        dataType: "html",
        contentType: "application/json", // JSON 데이터 전송을 위해 contentType 설정
        data: JSON.stringify(requestData), // JSON 문자열로 변환하여 전송
        success: function(data) {
            let parsedJson = JSON.parse(data);

            if ("0" == parsedJson.msgId) {
                alert(parsedJson.msgContents);

                location.reload();
                
                
            } else {
                alert(parsedJson.msgContents);
                let popupUrl = "http://localhost:8080/mypage/list_detail/?myListSeq=" + myListSeq;

                window.location.href = popupUrl;
            }
        },
        error: function(data) {
            console.log("error:" + data);
        }
    });

    // 추가 로직을 구현한 후, 필요에 따라 다른 동작을 수행할 수 있습니다.
});
 





</script>
</body>
</html>