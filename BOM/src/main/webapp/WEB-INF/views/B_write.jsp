<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>중고거래 게시글 작성</title>
<link rel="stylesheet" href="writing.css">
</head>
<body>
	<header>
		<a href="./" style="text-decoration: none; color: inherit;">
			<h1>BOM</h1>
		</a>
		<nav>
			<a href="./">Home</a>
			<div class="dropdown">
				<a href="b_board" class="active">Market</a>
				<div class="dropdown-content">
					<a href="boyC">남아의류</a> <a href="girlC">여아의류</a> <a href="toy">장난감류</a>
					<a href="book">도서교구</a> <a href="furniture">아이가구</a> <a
						href="newBorn">육아출산</a> <a href="babyCar">유모차</a>
				</div>
			</div>
			<a href="goCar">Stroller</a>
			<div class="dropdown-content">
				<a href="car">유모차 판매</a> <a href="goCar">유모차 구입</a>

			</div>
			<a href="goComm">Board</a> <a href="goMyList">MyPage</a>
		</nav>
	</header>

	<main>
		<div style="text-align: left; margin-top: 20px;">
			<button onclick="goBack()" class="back-btn">← 돌아가기</button>
		</div>


		<div class="product-container"
			style="display: flex; flex-direction: column; align-items: center;">
			<!-- 첫 번째 행: 이미지와 제품 정보 -->
			<div class="content-wrapper"
				style="display: flex; justify-content: space-between; width: 100%; align-items: flex-start;">
				<!-- 왼쪽: 이미지 섹션 -->
				<div class="image-section"
					style="flex: 1; display: flex; flex-direction: column; align-items: center;">
					<!-- 이미지 갤러리 -->
					<div class="image-gallery" style="margin-bottom: 20px;">
						<c:forEach var="file" items="${fileList}">
							<div class="image-item" style="margin-bottom: 10px;">
								<img src="uploads/${file}" alt="Product Image"
									onclick="showPreview(this)"
									style="width: 100px; height: auto; cursor: pointer;">
							</div>
						</c:forEach>
					</div>
					<!-- 프리뷰 이미지 -->
					<div class="image-preview">
						<img id="preview-image" src="uploads/${file}" alt="Preview Image"
							style="max-width: 300px; max-height: 300px;">
					</div>
				</div>

				<div>
				
					<form id="upload-form" action="dealWrite" method="post"
						enctype="multipart/form-data">
						<label for="category">카테고리</label> <select id="category"
							name="category">

							<option value="남아의류">남아의류</option>
							<option value="여아의류">여아의류</option>
							<option value="장난감류">장난감류</option>
							<option value="도서교구">도서교구</option>
							<option value="아이가구">아이가구</option>
							<option value="육아출산">육아출산</option>
							<option value="유모차">유모차</option>
						</select> <label for="title">제목</label> <input type="text" id="title"
							name="b_title" placeholder="제목을 입력해 주세요"> <label
							for="price">가격</label> <input type="text" id="price"
							name="how_much" placeholder="가격을 입력해 주세요"> <label
							for="description">내용</label>
						<textarea id="description" name="b_content" rows="5"
							placeholder="게시글 내용을 작성해주세요."></textarea>

						<div class="file-upload">
							<input type="file" id="imageUpload" name="files[]" multiple
								style="display: none;" onchange="loadImage(event)"> <label
								for="imageUpload" class="file-select-btnx">파일선택</label>
						</div>
						<br>

						<button type="submit" class="submit-btn">완료</button>
					</form>
				</div>
			</div>
			</div>
	</main>

	<script>
    
	window.onload = function () {
        const previewImage = document.getElementById('preview-image');

        

        // 이미지 클릭 시 프리뷰로 설정하는 함수
        document.querySelectorAll('.image-item img').forEach(img => {
            img.addEventListener('click', function() {
                showPreview(this);
            });
        });
    };

    function showPreview(imageElement) {
        const previewImage = document.getElementById('preview-image');
        previewImage.src = imageElement.src;
    }
    
    // 페이지 상단으로 스크롤하는 함수
    function scrollToTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    // 스크롤을 감지해서 버튼의 표시 여부를 결정하는 함수
    window.onscroll = function() {
        const scrollToTopBtn = document.querySelector('.scroll-to-top');
        if (document.documentElement.scrollTop > 100) {
            scrollToTopBtn.style.display = 'block'; // 스크롤이 100px 이상 내려가면 버튼 보이기
        } else {
            scrollToTopBtn.style.display = 'none';  // 상단에 있으면 버튼 숨기기
        }
    };
</script>

</body>
</html>