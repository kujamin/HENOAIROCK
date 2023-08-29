document.querySelector('form').addEventListener('submit', function(event) {
    event.preventDefault();
    const Email = document.getElementById('Email').value;
    const password = document.getElementById('login_password').value;
});
var eye_icon_login = document.getElementById('eye_icon_login');
var login_password = document.getElementById("password");
eye_icon_login.addEventListener('click', () => {
    hideAndShowPass(eye_icon_login, login_password);
});
const hideAndShowPass = (eye_icon, password) => {
    if (eye_icon.classList.contains("fa-eye-slash")) {
        eye_icon.classList.remove('fa-eye-slash');
        eye_icon.classList.add('fa-eye');
        password.setAttribute('type', 'text');
    } else {
        eye_icon.classList.remove('fa-eye');
        eye_icon.classList.add('fa-eye-slash');
        password.setAttribute('type', 'password');
    }
};
//비밀번호 페이지 이동 및 페이지 넘김 효과 적용
document.getElementById('to_passup').addEventListener('click', function(event) {
    event.preventDefault();
    const container = document.querySelector('.container');
    container.classList.add('flip-page');
    setTimeout(() => {
        window.location.href = event.target.href;
        container.classList.remove('flip-page'); // 페이지 돌아올 때 효과 제거
    }, 500);
});
//회원가입 페이지 이동 및 페이지 넘김 효과 적용
document.getElementById('to_signup').addEventListener('click', function(event) {
    event.preventDefault();
    const container = document.querySelector('.container');
    container.classList.add('flip-page');
    setTimeout(() => {
        window.location.href = event.target.href;
        container.classList.remove('flip-page'); // 페이지 돌아올 때 효과 제거
    }, 500);
});
$('#fn_email').on("click",function() {
		console.log("bnt_click")
			$.ajax({
				type : "POST",
				url : "/member/login",
				dataType : "html",
				data : {
					userId : $('#userId').val(),
					password : $('#password').val()
				},
				success : function(data) {// 통신 성공
					let paredJSON = JSON.parse(data)
					if ("1" == paredJSON.msgId) {
						alert(paredJSON.msgContents);
						window.location.href = '/main';
					} else if("2" == paredJSON.msgId){
						alert(paredJSON.msgContents);
						window.location.href = '/member/login';
					} else {
						alert("알수없는 오류 발생 재접속 바랍니다.")
						window.location.href = '/member/login';
					}
				},
				error : function(data) {// 실패시 처리
					console.log("통신 오류");
				}
			});
		});// --end doLogin------------------