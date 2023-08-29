$('#fn_email').on("click",function() {
		console.log("bnt_click")
			$.ajax({
				type : "POST",
				url : "/admin/login",
				dataType : "html",
				data : {
					userId : $('#userId').val(),
					password : $('#password').val()
				},
				success : function(data) {// 통신 성공
					let paredJSON = JSON.parse(data)
					if ("1" == paredJSON.msgId) {
						alert(paredJSON.msgContents);
						window.location.href = '/admin/users';
					} else if("2" == paredJSON.msgId){
						alert(paredJSON.msgContents);
						window.location.href = '/member/login';
					}
				},
				error : function(data) {// 실패시 처리
					console.log("통신 오류");
				}
			});

		});// --end doLogin------------------

