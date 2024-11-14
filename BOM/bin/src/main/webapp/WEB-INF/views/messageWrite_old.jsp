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
                <nav class="main-nav">
                    <ul>
                        <li class="u-nav-item">
							<div class="dropdown">
								<a
									class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
									href="b_board" style="padding: 10px 20px;">Market</a>
								<div class="dropdown-content">
									<a href="boyC">남아의류</a> <a href="girlC">여아의류</a> <a href="toy">장난감류</a>
									<a href="book">도서교구</a> <a href="furniture">아이가구</a> <a
										href="newBorn">육아출산</a> <a href="babyCar">유모차</a>
								</div>
							</div>
						</li>
						<li class="u-nav-item">
							<div class="dropdown">
								<a id="car"
									class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
									href="car" style="padding: 10px 20px;">Stroller</a>
								<div class="dropdown-content">
									<a href="car">유모차 매입 신청</a> <a href="goCar">유모차 구매</a>

								</div>
							</div>

						</li>
                    </ul>
                </nav>
            </div>
        </header>

        <main>
            <!-- 쪽지 상세 정보 -->
            <div class="message-detail-box">
                       <form action="sendMessage" method="post">
                <div class="message-header">
                    <div>
                        <strong>보낸 사람: </strong>${id}
                    </div>
                    <div>
                        <strong>받는 사람: </strong>${sender}
                        <!-- 숨겨진 필드로 write 값을 전송 -->
            			<input type="hidden" name="write" value="${sender}">
                    </div>
                </div>
                <div class="message-subject">
                    <strong>제목:</strong> 
<input type="text" id="title" name="m_title" placeholder="제목을 입력해 주세요">
                </div>
                <div class="message-body">
                 <textarea id="description" name="m_content" rows="5" placeholder="게시글 내용을 작성해주세요."></textarea>
                </div>
                <div class="message-actions">
                    <div class="message-actions">
                        <button class="inbox-btn" type="submit"> 완료</button>
                         <a href="#"> <button class="inbox-btn" >쪽지함으로 돌아가기</button></a>
                        
                        
                    
                    </div>
                </div>
                   </form>
                  
            </div>
        </main>

    </div>
</body>

</html>
