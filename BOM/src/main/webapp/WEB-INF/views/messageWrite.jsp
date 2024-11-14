<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보낸 쪽지</title>
    <link rel="stylesheet" href="messagedetail.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
    <script>
        
    <!-- 팝업창 닫는 기능 -->
    	function closePopup() {
            window.close();
        }

    <!-- 폼태그로 서버에 데이터를 전송하고 창을 닫는 기능 -->
        function submitForm() {
            // Ajax로 폼 데이터를 전송하고 창을 닫는 기능
            var form = document.querySelector('form');
            var formData = new FormData(form);

            fetch('sendMessage', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                // 서버 응답 후 창을 닫음
                closePopup();
            })
            .catch(error => {
                console.error('Error:', error);
            });

            // 폼의 기본 제출을 막음
            return false;
        }
    </script>
</head>
<body>
    <div class="container">
        <header>
            <div class="header-container">
                <nav class="main-nav">
                    <div class="logo">
                        <h1>BOM</h1>
                    </div>
                </nav>
            </div>
        </header>

        <main>
            <div class="message-detail-box">
                <form onsubmit="return submitForm()">
                    <div class="message-header">
                        <div>
                            <strong>보낸 사람: </strong>${id}
                        </div>
                        <div>
                            <strong>받는 사람: </strong>${sender}
                            <input type="hidden" name="accept" value="${sender}">
                        </div>
                    </div>
                    <div class="message-subject">
                        <strong>제목:</strong> 
                        <input type="text" id="title" name="m_title" placeholder="제목을 입력해 주세요" style="width: 695px; height: 50px;">
                    </div>
                    <div class="message-body" style="padding: 0; margin: 0;">
                        <textarea id="description" name="m_content" rows="5" placeholder="게시글 내용을 작성해주세요." style="width: 700px; height: 500px; margin: 0; padding: 10px; box-sizing: border-box; resize: none; overflow-y: auto;"></textarea>
                       
                        <button class="inbox-btn" type="submit">완료</button>
                        <a href="messageList" class="inbox-btn">쪽지함으로 돌아가기</a>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
