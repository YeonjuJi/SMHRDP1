<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>
    <link rel="stylesheet" href="writing.css">
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="nicepage.css">
    <link rel="stylesheet" href="dd.css">
</head>
<body>
    <header class="u-clearfix u-gradient u-header u-header" id="sec-b9bc"
		data-animation-name="" data-animation-duration="0"
		data-animation-delay="0" data-animation-direction="">
		<div class="u-clearfix u-sheet u-sheet-1">
			<p class="u-align-center u-text u-text-body-alt-color u-text-1">
				<a
					class="u-active-none u-border-none u-btn u-button-link u-button-style u-custom-font u-hover-none u-none u-text-body-alt-color u-btn-1"
					href="./">BOM </a>
			</p>
			<nav class="u-menu u-menu-one-level u-offcanvas u-menu-1">
				<div class="menu-collapse u-custom-font"
					style="font-size: 1rem; letter-spacing: 0px; font-family: PretendardVariable; font-weight: 700;">
					<a
						class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-active-color u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
						href="#"> <svg class="u-svg-link" viewBox="0 0 24 24">
							<use xlink:href="#menu-hamburger"></use></svg> <svg
							class="u-svg-content" version="1.1" id="menu-hamburger"
							viewBox="0 0 16 16" x="0px" y="0px"
							xmlns:xlink="http://www.w3.org/1999/xlink"
							xmlns="http://www.w3.org/2000/svg">
							<g>
							<rect y="1" width="16" height="2"></rect>
							<rect y="7" width="16" height="2"></rect>
							<rect y="13" width="16" height="2"></rect>
</g></svg>
					</a>
				</div>
				<div class="u-custom-menu u-nav-container">
					<ul class="u-custom-font u-nav u-unstyled u-nav-1">
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="./" style="padding: 10px 20px;">Home</a></li>
						
						
						<li class="u-nav-item">
						<div class="dropdown">
						<a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="b_board" style="padding: 10px 20px;">Market</a>
							<div class="dropdown-content">
                     <a href="boyC">남아의류</a>
                  <a href="girlC">여아의류</a>
                  <a href="toy">장난감류</a>
                  <a href="book">도서교구</a>
                  <a href="furniture">아이가구</a>
                  <a href="newBorn">육아출산</a>
                  <a href="babyCar">유모차</a>
                </div>
							</div>
							</li>
						<li class="u-nav-item">
						
						<li class="u-nav-item">
							<div class="dropdown">
						<a id="car"
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="goCar" style="padding: 10px 20px;">Stroller</a>
							<div class="dropdown-content">
									<a href="car">유모차 매입 신청</a> <a href="goCar">유모차 구매</a>
									
								</div>
						</div>
						</li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="goComm" style="padding: 10px 20px;">Board</a></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="goMyList" style="padding: 10px 20px;">MyPage</a></li>
					</ul>
				</div>
				<div class="u-custom-menu u-nav-container-collapse">
					<div
						class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
						<div class="u-inner-container-layout u-sidenav-overflow">
							<div class="u-menu-close"></div>
							<ul
								class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2">
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="./">Home</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="b_board">Market</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="car">Stroller</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="goComm">Board</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="goMyList">MyPage</a></li>
							</ul>
						</div>
					</div>
					<div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
				</div>
			</nav>
		</div>
	</header>

    <main>
        <div class="upload-container">
            <div class="image-preview">
                <img src="image-placeholder.png" id="preview" alt="Image Preview">
            </div>
            <div class="form-container">
                <form action="commContent" method="POST" enctype="multipart/form-data">

                    <label for="title">제목</label>
                    <input type="text" id="title" name="cb_title" placeholder="제목을 입력해 주세요">
                    
                    <label for="writer">작성자</label>
                    <input type="text" name="id" value="<%=session.getAttribute("userId") %>" placeholder="제목을 입력해 주세요" required readonly>

                    <label for="description">내용</label>
                    <textarea id="description" name="cb_content" rows="5" placeholder="게시글 내용을 작성해주세요."></textarea>

                    <div class="file-upload">
                        <input type="file" id="imageUpload" name="cb_file" accept="image/*" style="display: none;">
                        <label for="imageUpload" class="file-select-btnx">파일선택</label>           
                    </div><br>
                    <button type="submit" class="submit-btn">작성</button>
                </form>
            </div>
        </div>
    </main>
    <script>
	    document.addEventListener('DOMContentLoaded', function () {
	        const fileInput = document.getElementById('imageUpload');
	        const imagePreview = document.getElementById('preview');
	
	        fileInput.addEventListener('change', function () {
	            const file = fileInput.files[0]; // 첫 번째 파일을 선택합니다.
	
	            if (file) {
	                const reader = new FileReader();
	
	                reader.onload = function (event) {
	                    imagePreview.src = event.target.result; // 파일의 데이터를 이미지의 src에 설정합니다.
	                    imagePreview.style.display = 'block'; // 이미지가 표시되도록 합니다.
	                };
	
	                reader.readAsDataURL(file); // 파일을 Data URL로 읽습니다.
	            } else {
	                imagePreview.src = 'image-placeholder.png'; // 파일이 없으면 기본 이미지로 설정합니다.
	                imagePreview.style.display = 'none'; // 이미지가 없을 때는 숨깁니다.
	            }
	        });
	    });
    </script>
    <script src="writing.js"></script>
</body>
</html>
