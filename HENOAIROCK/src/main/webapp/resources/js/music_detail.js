function toggleLyrics() {
    var lyricsBox = document.getElementById("lyricsBox");
    if (lyricsBox.style.display === "none") {
        lyricsBox.style.display = "block";
    } else {
        lyricsBox.style.display = "none";
    }
};
var like = $('#like').val();
var music_Id = $('#musicId').val();
var user_Id = $('#userId').val();

if(like > 0) {
	document.getElementById("LikeBtn").value = "좋아요 취소";
} else {
	document.getElementById("LikeBtn").value = "좋아요";
}

function fn_like() {
	var likeBtn = $("#LikeBtn");
	if(like > 0) {
		$('#LikeBtn').attr('src','/resources/images/heart_line.png');
		document.getElementById("LikeBtn").value  = "좋아요 취소";
		console.log(like);
		console.log(music_Id);
		console.log(user_Id);
		$.ajax({
			type :"POST",
			url : "/music/deleteHeart",
			dataType : "html",
			contentType: 'application/json',
			data : JSON.stringify({
				"userId" : $('#userId').val(),
				"musicId" : music_Id,
			}),	
			success : function(data) {// 통신 성공
				let paredJSON = JSON.parse(data)
				if ("1" == paredJSON.msgId) {
					alert(paredJSON.msgContents);
					location.reload();
				} else if("2" == paredJSON.msgId){
					alert(paredJSON.msgContents);
					location.reload();
				}
			},
			error : function(data) {// 실패시 처리
				console.log("통신 오류");
			}
		});
	} else {
		$('#LikeBtn').attr('src','/resources/images/heart_full.png');		
		document.getElementById("LikeBtn").value = "좋아요";
		console.log(like);
		console.log(music_Id);
		console.log(user_Id);
		$.ajax({
			type :"POST",
			url : "/music/saveHeart",
			dataType : "html",
			contentType: 'application/json',
			data : JSON.stringify({ 
				userId : $('#userId').val(),
				musicId : music_Id
			}),
			success : function(data) {
				let paredJSON = JSON.parse(data)
				if ("1" == paredJSON.msgId) {
					alert(paredJSON.msgContents);
					location.reload();
				} else if("2" == paredJSON.msgId){
					alert(paredJSON.msgContents);
					location.reload();
				}
			},
			error : function(data) {// 실패시 처리
				console.log("통신 오류");
			}
		});
	}
}