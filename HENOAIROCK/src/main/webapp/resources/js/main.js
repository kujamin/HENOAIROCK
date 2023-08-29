/*function sendMessage(){
	$.ajax({
		type :"POST",
		url : "/main/start",
		dataType : "html",
		data : { 
			"userId" : $('#userId').val()
		},	
		success : function(data) {// 통신 성공
			let paredJSON = JSON.parse(data)
			if ("1" == paredJSON.msgId) {
				alert(paredJSON.msgContents);
				window.location.href = '/main/selectOne?chatSeq=' + parsedJSON.chatSeq; // 수정한 부분
			} else if("2" == paredJSON.msgId){
				alert(paredJSON.msgContents);
				location.reload();
			} else {
				alert(paredJSON.msgContents);
				window.location.href = '/member/login';
			}
		},
		error : function(data) {// 실패시 처리
			console.log("통신 오류");
		}
	});
}

function chatContents(element){
	 var chatSeqValue = element.textContent; // Get the text content of the clicked cell
	 console.log("Clicked chatSeq:", chatSeqValue);
	 
	 window.location.href = "/main/selectOne?chatSeq=" + chatSeqValue;

}*/
$(".restclass").on('click', function(){
    console.log('restCall');
    console.log("#rest")
    let url = 'http://127.0.0.1:8000/pybo/boot/rest/';
    $.ajax({
        type: "POST",
        url:url,
        asyn:"true",
        dataType:"html",
        data:{
            rest: message
        },
        success:function(data){//통신 성공
            console.log("success data:"+data);
            var decodedData = data.replace(/\\u[\dA-F]{4}/gi, function(match) {
                return String.fromCharCode(parseInt(match.replace(/\\u/g, ''), 16));
            });
          console.log("decoded data:" + decodedData);
          },
          error:function(data){//실패시 처리
            console.log("error:"+data);
          }
      });
  });





