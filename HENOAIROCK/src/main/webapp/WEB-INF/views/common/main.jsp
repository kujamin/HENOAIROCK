<%@page import="com.heno.airock.dto.ChatMessageDetailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<!-- 차트그리기 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>음악 사이트</title>
<style>
@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.truncate-text {
  white-space: nowrap;       /* 줄바꿈 금지 */
  overflow: hidden;          /* 내용 넘치는 부분 숨김 */
  text-overflow: ellipsis;   /* 넘치는 부분 "..."으로 표시 */
}
.chat-container {
  bottom: 60px; /* .message-container의 높이 + 여백 */
  right: 232px;
  overflow-y: auto;
  max-height: calc(100vh - 60px); /* 화면 높이에서 .message-container 높이와 여백을 뺀 값 */
}

  .message-container {
    background-color: white;
    padding: 10px;
    margin-top: auto;
  }
.sidebar.sidebar-right {
    left: auto;
    right: 0;
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    height: 100%;
    overflow-y: auto; /* Y축 스크롤 활성화 */
}

             .message-container {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #333; /* 배경색 변경 */
            padding: 15px 260px; /* 패딩 조정 */
            box-shadow: 0px -2px 10px rgba(0, 0, 0, 0.2);
            z-index: 1; /* 다른 내용 위에 나타나게 설정 */
            text-align: center; /* 가운데 정렬 */
            color: white; /* 텍스트 색상 변경 */
            display: flex;
            justify-content: space-between; /* 입력창과 버튼 간 여백 유지 */
            align-items: center; /* 수직 가운데 정렬 */
        }

        /* 입력창 스타일 */
        #userInput {
            flex: 1; /* 남은 공간을 차지하도록 설정 */
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #444; /* 배경색 변경 */
            color: white; /* 텍스트 색상 변경 */
            margin-right: 10px; /* 오른쪽 여백 추가 */
            font-size: 14px;
        }

        /* 보내기 버튼 스타일 */
        #sendMessageBtn {
            padding: 10px 20px;
            background-color: #ff5500; /* 배경색 변경 */
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 14px;
        }

        #sendMessageBtn:hover {
            background-color: #cc4400; /* 배경색 변경 */
        }
        .chatTable {
  width: 1600px;
  table-layout: fixed;
}

.chatTable td {
  word-wrap: break-word;
}
</style>
</head>
<body>
<input type="hidden" id= "userId" value="${sessionScope.userId}" name="userId" >

<div class="sidebar sidebar-right">
  <div>
     <!-- ... 이하 채팅 로그 등의 내용 ... -->
     <table id="boardTable">
       <thead>
         <tr>
           <th></th>
           <th style="display:none;">SEQ</th>
         </tr>
        </thead>
        <tbody class="table-group-divider">
        <c:choose>
           <c:when test="${not empty MsgList }">
             <c:forEach var="vo" items="${MsgList}">
                 <tr>
                   <td style="display:none;">${vo.chatSeq}</td>
                   <td>${vo.chatDt}</td>
                 </tr>
                 <tr>
                    <td style="display:none;">${vo.chatSeq}</td>
                   <td> ${vo.chatContents}</td>
                 </tr>
                 <tr>
                    <td style="display:none;">${vo.chatSeq}</td>
                    <td><hr></td>
                 </tr>
             </c:forEach>
            </c:when>
           </c:choose>
         </tbody>
      </table>
      </div> <!-- chat-container -->
    </div>
   <div class="chat-container">
      <table class="chatTable">
       <tbody class="table-group-divider">
            <c:choose>
          <c:when test="${not empty contentsList }">
            <c:forEach var="conVO" items="${contentsList}">
                <tr>
                  <td class="text-right">${sessionScope.user.userId}: <c:out value="${conVO.chatContents }"/></td>      
                </tr>
                <c:forEach var="resVO" items="${respondList}">
                    <c:if test="${resVO.chatContentsId == conVO.chatContentsId}">
                        <tr> 
                          <td class="text-left"><c:out value="${resVO.chatResContents}"/></td>  
			                  </tr>
			                  <tr>
			                   <td>저희가 분석한 결과는 아래와 같아요</td>
			                  </tr>
			                  <tr>
                           <td class="text-left"><div class="graphBox"><canvas id="myRadarChart_${conVO.chatContentsId}" width="300" height="250"></canvas></div></td>
                        </tr>
                        <tr>
							            <td>
							                <script>
							                    var ctx = document.getElementById('myRadarChart_${conVO.chatContentsId}').getContext('2d');
							                    var hurt = ${resVO.hurt};
							                    var happy = ${resVO.happy};
							                    var embarrassed = ${resVO.embarrassed};
							                    var anger = ${resVO.anger};
							                    var unrest = ${resVO.unrest};
							                    var sad = ${resVO.sad};
							                    var data = {
							                    	    labels: ['상처', '기쁨', '당황', '분노', '불안', '슬픔'],
							                    	    datasets: [{
							                    	        label: '감정 수치',
							                    	        data: [hurt, happy, embarrassed, anger, unrest, sad],
							                    	        backgroundColor: [
							                    	            'rgba(255, 99, 132, 0.2)', // 상처
							                    	            'rgba(75, 192, 192, 0.2)', // 기쁨
							                    	            'rgba(255, 205, 86, 0.2)', // 당황
							                    	            'rgba(255, 159, 64, 0.2)', // 분노
							                    	            'rgba(54, 162, 235, 0.2)', // 불안
							                    	            'rgba(153, 102, 255, 0.2)' // 슬픔
							                    	        ],
							                    	        borderColor: [
							                    	            'rgba(255, 99, 132, 1)', // 상처
							                    	            'rgba(75, 192, 192, 1)', // 기쁨
							                    	            'rgba(255, 205, 86, 1)', // 당황
							                    	            'rgba(255, 159, 64, 1)', // 분노
							                    	            'rgba(54, 162, 235, 1)', // 불안
							                    	            'rgba(153, 102, 255, 1)' // 슬픔
							                    	        ],
							                    	        borderWidth: 1
							                    	    }]
							                    	};

							                    	var options = {
							                    	    // 옵션 설정
							                    	};

							                    	var myDoughnutChart = new Chart(ctx, {
							                    	    type: 'doughnut',
							                    	    data: data,
							                    	    options: options
							                    	});
							                </script>
							            </td>
							        </tr>
								        <tr onclick="musicClick(this);">
								          <td class="text-left">따라서  이 노래를 추천드려요!</td>
								          <td class="text-left">${resVO.artist}에 ${resVO.title}</td>
								          <td class="text-left"><img src = "${resVO.albumPath}" width="60px" height="60px"></td>
								          <td style="display:none;" data-musicid="<c:out value="${resVO.musicId}" />"></td>
								        </tr>
								        <tr>
								           <td><hr></td>
								        </tr>
                    </c:if>
                </c:forEach>    
            </c:forEach>
           </c:when>
           </c:choose>
      </tbody>
     </table>
        </div>
    

          <div class="message-container" id="messageContainer">
            <input maxlength="80" type="text" id="userInput" class="form-control" placeholder="메세지를 입력하세요.">
            <button id="sendMessageBtn" class="btn btn-primary" onclick="sendMessage()">보내기</button>
          </div>
  <script>
//이미지 클릭스 음악 상세 페이지 출력
  function musicClick(row) {
    var musicId = $(row).find("[data-musicid]").data("musicid");
    console.log("Clicked Music ID:", musicId);
    // 팝업 창 열기
    let popupUrl = "/music/music_detail/?musicId=" + musicId;
    let popupName = "MusicDetailPopup";
    let popupOptions = "width=800,height=600,resizable=yes,scrollbars=yes";
    window.open(popupUrl, popupName, popupOptions);
    }
  
  
  function sendMessage() {
      const userInput = document.getElementById("userInput").value.trim();
      console.log("user-message")
      const chatSeq = new URLSearchParams(window.location.search).get("chatSeq"); // 기존의 chatSeq를 체크
      const userMessage = userInput;
      if (!chatSeq && userInput === "") {
          alert("대화를 입력하세요.");
          return;
      }
      if (userInput !== "") {
          // Create a new message element and append to the container
          const messageElement = document.createElement("div");
          messageElement.className = "user-message";
          messageElement.textContent = userInput;
          document.getElementById("messageContainer").appendChild(messageElement);

          // Clear the input field using jQuery
          $("#userInput").val("");

          
          if (!chatSeq) {
              // Create a new chat sequence and send the message
              $.ajax({
                  type: "POST",
                  url: "${CP}/main/start",
                  dataType: "json",
                  data: {
                      userId: $('#userId').val()
                  },
                  success: function(parsedJSON) {
                      if (parsedJSON.msgId === "1") {
                          const newChatSeq = parsedJSON.msgContents;
                          sendChatMessage(newChatSeq, userInput); // Send the message after creating a new chat sequence
                      } else if (parsedJSON.msgId === "2") {
                          alert(parsedJSON.msgContents);
                          location.reload();
                      } else {
                          alert(parsedJSON.msgContents);
                          window.location.href = "${CP}/member/login";
                      }
                  },
                  error: function(data) {
                      console.log("Communication error");
                  }
              });
          } else {
              sendChatMessage(chatSeq, userInput); // Send the message using the existing chat sequence
          }

          // Function to send the message
          function sendChatMessage(chatSeq, message) {
              $.ajax({
                  url: "${CP}/main/chat",
                  type: "POST",
                  dataType : "html",
                  data: {
                      chatSeq: chatSeq,
                      chatContents: message
                  },
                  success: function(data) {
                	  let parsedJSON = JSON.parse(data)
                	  const chatContentsId = parsedJSON.msgContents;
                	  if ("1" == parsedJSON.msgId) {
                		  let url = 'http://127.0.0.1:8000/pybo/boot/rest/';
                          $.ajax({
                              type: "POST",
                              url:url,
                              asyn:"true",
                              dataType:"html",
                              data:{
                                  rest: userInput
                              },
                              success:function(data){//통신 성공
                                  console.log("success data:"+data);
                                  var decodedData = data.replace(/\\u[\dA-F]{4}/gi, function(match) {
                                      return String.fromCharCode(parseInt(match.replace(/\\u/g, ''), 16));
                                  });
                                  console.log("decoded data:" + decodedData);
                                  // Spring 컨트롤러에 decodedData 전송
                                  $.ajax({
                                      type: "POST",
                                      url: "/main/decode", // Spring 컨트롤러의 엔드포인트 URL
                                      data: {
                                         chatSeq: chatSeq,
                                         encodedData: decodedData,
                                         chatContentsId: chatContentsId
                                      },
                                      success: function(response) {
                                          console.log("Processing result: " + response);
                                          const newURL = "${CP}/main/selectOne?chatSeq=" + chatSeq;
                                          window.location.href = newURL;
                                      },
                                      error: function(error) {
                                          console.log("Error processing data: " + error);
                                      }
                                  });
                                  },
                                  error:function(data){//실패시 처리
                                    console.log("error:"+data);
                                  }
                            });
                          
					          } else {
					        	   alert("알 수 없는 오류 발생 재접속 바랍니다.")
	                     window.location.href= '/main';
					          }
                  },
                  error: function() {
                      alert("알 수 없는 오류 발생 재접속 바랍니다.")
                      window.location.href= '/main';
                  }
              });
          }

      }
  }
  
  $("#boardTable>tbody").on("click", "tr", function() {
	    let tdArray = $(this).children();
      var chatSeqValue = tdArray.eq(0).text();
      console.log("Clicked chatSeq:", chatSeqValue);

      // Create a new URL with the chatSeqValue
      const newURL = "${CP}/main/selectOne?chatSeq=" + chatSeqValue;
      window.location.href = newURL;
  });
  
  
  </script>
  <script src="${CP}/resources/js/main.js"></script>
</body>

</html>