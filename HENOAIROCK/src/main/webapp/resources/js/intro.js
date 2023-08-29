		$(function() {
			var welcomSection = $('.welcome-section'), enterButton = welcomSection
					.find('.enter-button');

			setTimeout(function() {
				welcomSection.removeClass('content-hidden');
			}, 800);

			enterButton.on('click', function(e) {
				e.preventDefault();
				welcomSection.addClass('content-hidden').fadeOut();
			})
		})
		        // function openSidebar() {
            // var sidebar = document.getElementById('sidebar');
            // sidebar.style.marginLeft = '0';
        // }

// function closeSidebar() {
  // var sidebar = document.getElementById('sidebar');
    // sidebar.style.marginLeft = '-270px'; // Sidebar width + some space
// }
function openNewChat() {
    // 여기에 채팅을 열거나 필요한 동작을 추가하세요.
}
        function appendMessage(sender, message) {
            const chatLogs = document.getElementById('chatLogs');
            const messageElement = document.createElement('div');
            messageElement.textContent = sender + ': ' + message;
            if (sender === 'ChatGPT') {
                messageElement.className = 'bot-message';
            } else {
                messageElement.className = 'user-message';
            }
            chatLogs.appendChild(messageElement);
            chatLogs.scrollTop = chatLogs.scrollHeight;
        }

        function sendMessage() {
            const userInput = document.getElementById('userInput');
            const userMessage = userInput.value;
            if (userMessage.trim() !== '') {
                appendMessage('사용자', userMessage);
                userInput.value = '';
                // 여기에 ChatGPT와 상호작용하는 로직을 추가할 수 있습니다.
                // 예를 들면, fetch 또는 XMLHttpRequest를 사용하여 서버로 사용자 입력을 보내고 응답을 받을 수
				// 있습니다.
                // 이 예제에서는 단순히 미리 정의된 응답을 보여줍니다.
                setTimeout(() => {
                    appendMessage('ChatGPT', '사용자가 입력한 메시지에 대한 응답입니다.');
                }, 1000);
            }
        }