<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이미지 업로드 폼</title>
<link rel="stylesheet" href="writing.css">
</head>
<body>
	 <header>
	   <div class="container">
        <a href="./" style="text-decoration: none; color: inherit;">
            <h1>BOM</h1>
        </a>
        <nav>
             <a href="./">Home</a>
            <div class="dropdown">
                <a href="b_board" class="active">Market</a>
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
            <a href="goCarWrite">Stroller</a>
               <div class="dropdown-content">
                  <a href="boyC">유모차 판매</a>
                  <a href="girlC">유모차 구입</a>
              
                </div>
            <a href="goComm">Board</a>
            <a href="goMyPage">MyPage</a>
        </nav>
         </div>
    </header>

	<main>
		<div style="text-align: left; margin-top: 20px;">
			<button onclick="goBack()" class="back-btn">← 돌아가기</button>
		</div>
		<div class="upload-container">
			<div class="image-preview">
				<img
					src="${empty file ? 'uploads/KakaoTalk_20240817_110031317.png' : file }"
					id="preview" alt="Image Preview">
			</div>
			<div class="form-container">

				<form id="upload-form" action="modifyWrite?idx=${deal.b_idx}"
					method="post" enctype="multipart/form-data">

					<!-- 카테고리 선택 -->
					<label for="category">카테고리</label> <select id="category"
						name="category">
						<option value="남아의류">남아의류</option>
						<option value="여아의류">여아의류</option>
						<option value="장난감류">장난감류</option>
						<option value="도서교구">도서교구</option>
						<option value="아이가구">아이가구</option>
						<option value="육아출산">육아출산</option>
						<option value="유모차">유모차</option>
					</select>

					<!-- 제목 입력 -->
					<label for="title">제목</label> <input type="text" id="title"
						name="b_title"
						value="${empty deal.b_title ? '제목을 입력하세요. ': deal.b_title}">

					<!-- 가격 입력 -->
					<label for="price">가격</label> <input type="text" id="price"
						name="how_much"
						value="${empty deal.how_much ? '가격을 입력하세요.' : deal.how_much}">

					<!-- 내용 입력 -->
					<label for="description">내용</label>
					<textarea id="description" name="b_content" rows="5"
						style="white-space: pre-line;">${empty deal.b_content ? '내용을 입력하세요.' : deal.b_content}</textarea>
					<!-- 파일 업로드 -->
					<div class="file-upload">
						<input type="file" id="imageUpload" name="files[]" multiple
							style="display: none;" onchange="handleFileChange(event)">
						<label for="imageUpload" class="file-select-btnx">파일선택</label>

						<!-- 파일 이름 표시 -->
						<div class="file-name-display">
							<c:if test="${not empty deal.filenames}">
            ${deal.filenames} <!-- 첫 번째 파일 이름을 표시 -->
							</c:if>
							<c:if test="${empty deal.filenames}">
            파일이 선택되지 않았습니다.
        </c:if>
						</div>
					</div>

					<!-- 파일 삭제 버튼 -->
					<button type="button" onclick="removeFile()">이미지 삭제</button>
					<br>

					<!-- 제출 버튼 -->
					<button type="submit" class="submit-btn">완료</button>
				</form>
			</div>
			<br>
		</div>
	</main>

	<script>
		let selectedFile = null; // 선택된 파일을 저장할 변수

		function handleFileChange(event) {
			const imagePreview = document.getElementById('preview');
			const fileInput = document.getElementById('imageUpload');
			const fileNameDisplay = document
					.querySelector('.file-name-display'); // 파일 이름을 표시할 요소
			const files = event.target.files;

			if (files.length > 0) {
				const file = files[0]; // 하나의 파일만 허용
				selectedFile = file; // 선택된 파일 저장

				// 파일 이름 표시
				if (fileNameDisplay) {
					fileNameDisplay.textContent = file.name;
				}

				const reader = new FileReader();
				reader.onload = function(e) {
					imagePreview.src = e.target.result; // 미리보기 이미지 업데이트
					imagePreview.alt = file.name; // alt 속성에 파일 이름 할당
				};
				reader.readAsDataURL(file); // 파일 읽기
			}
		}

		function removeFile() {
			const imagePreview = document.getElementById('preview');
			const fileInput = document.getElementById('imageUpload');
			const fileNameDisplay = document
					.querySelector('.file-name-display'); // 파일 이름을 표시할 요소

			// 미리보기 이미지와 파일 입력 초기화
			imagePreview.src = 'uploads/KakaoTalk_20240817_110031317.png'; // 기본 이미지로 변경
			imagePreview.alt = 'Image Preview';
			fileInput.value = ''; // 파일 입력 초기화
			selectedFile = null; // 선택된 파일 초기화

			// 파일 이름 초기화
			if (fileNameDisplay) {
				fileNameDisplay.textContent = '파일이 선택되지 않았습니다.';
			}
		}

		document.getElementById('upload-form').onsubmit = function(e) {
			// 선택된 파일이 없으면 기본적으로 폼이 제출되지 않도록 할 수도 있습니다.
			if (!selectedFile) {
				e.preventDefault();
				alert('파일을 선택해주세요.');
			}
		};
	</script>

</body>
</html>
