

$("#doSave").on("click", function() {
	
	if (eUtil.ISEmpty($("#title").val()) == true) {
		alert("제목을 입력 하세요.");
		$("#title").focus();
		return;
	}


	// confirm
	if (confirm('등록 하시겠습니까') == false)
		return;

	$.ajax({
		type : "POST",
		url : "/mypage/save",
		asyn : "true",
		dataType : "html",
		data : {
			title : $("#title").val(),
			userId : $("#regId").val()
		},
		success : function(data) {// 통신 성공
			console.log("success data:" + data);
			let parsedJson = JSON.parse(data);

			if ("1" == parsedJson.msgId) {
				alert(parsedJson.msgContents);
				window.location.href = '/mypage';

				
			} else {
				alert(parsedJson.msgContents);
			}
		},
		error : function(data) {// 실패시 처리
			console.log("error:" + data);
		}
	});
	
	

});// --doSave
