// 팝업 창 열기
document.getElementById("openPopupBtn").addEventListener("click", function() {
    var popupUrl = "/music/music_reg"; // music.jsp 경로
    var popupName = "MusicPopup";
    var popupOptions = "width=800,height=600,resizable=yes,scrollbars=yes";
    var popupWindow = window.open(popupUrl, popupName, popupOptions);
});

function moveToListView() {
	window.location.href = "/post?div=" + $("#div").val();
}

$("#moveToList").on("click", function() {
	console.log($("#musicId").val())
	if (confirm('목록 화면으로 이동 하시겠습니까?') == false)
		return;

	moveToListView();
});

$("#doSave").on("click", function() {
	if (eUtil.ISEmpty($("#regId").val()) == true) {
		alert("등록자를 입력 하세요.");
		$("#regId").focus();
		return;
	}
	
	if (eUtil.ISEmpty($("#title").val()) == true) {
		alert("제목을 입력 하세요.");
		$("#title").focus();
		return;
	}

	if (eUtil.ISEmpty($("#contents").val()) == true) {
		alert("내용을 입력 하세요.");
		$("#contents").focus();
		return;
	}

	// confirm
	if (confirm('등록 하시겠습니까') == false)
		return;

	// console.log("확인:");

	// ajax
	$.ajax({
		type : "POST",
		url : "/post/save",
		asyn : "true",
		dataType : "html",
		data : {
			postDiv : $("#div").val(),
			postTitle : $("#title").val(),
			userId : $("#regId").val(),
			postContents : $("#contents").val(),
			musicId : $("#musicId").val()
		},
		success : function(data) {// 통신 성공
			console.log("success data:" + data);
			let parsedJson = JSON.parse(data);
			// title 미 입력
			if ("10" == parsedJson.msgId) {
				alert(parsedJson.msgContents);
				$("#title").focus();
				return;
			}

			// 등록자 미 입력
			if ("20" == parsedJson.msgId) {
				alert(parsedJson.msgContents);
				$("#regId").focus();
				return;
			}

			// 등록자 미 입력
			if ("30" == parsedJson.msgId) {
				alert(parsedJson.msgContents);
				$("#contents").focus();
				return;
			}

			if ("1" == parsedJson.msgId) {
				alert(parsedJson.msgContents);
				// javascript
				// window.location.href
				// ="${CP}/board/boardView.do?div="+$("#div").val();
				moveToListView();
			} else {
				alert(parsedJson.msgContents);
			}
		},
		error : function(data) {// 실패시 처리
			console.log("error:" + data);
		}
	});

});// --doSave
