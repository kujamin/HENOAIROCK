$(document).ready(function () {
    $('#chat-submit').on('click', function () {
        let message = $('#chat-input').val().trim();
        if (message.length > 0) {
            sendMessage(message);
        }
        $('#chat-input').val('');
    });

    $('#chat-input').on('keypress', function (e) {
        if (e.which === 13) {
            let message = $('#chat-input').val().trim();
            if (message.length > 0) {
                sendMessage(message);
            }
            $('#chat-input').val('');
        }
    });
});

function sendMessage(message) {
    // 메시지를 채팅창에 추가
    $('#chat-output').append(`<div class="message user">User: ${message}</div>`);
    $.ajax({
        type: "POST",
        url: "/processMessage",
        data: {
            inputText: message
        },
        success: function (response) {
            // 응답을 채팅창에 추가
            $('#chat-output').append(`<div class="message assistant">Assistant: ${response}</div>`);
            $('#chat-output').scrollTop($('#chat-output')[0].scrollHeight);
        },
        error: function () {
            alert("에러가 발생했습니다.");
        }
    });
}
