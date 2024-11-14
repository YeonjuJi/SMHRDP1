<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이미지 업로드 폼</title>
    <link rel="stylesheet" href=writing.css>
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
    </header>
    <main>
        <div style="text-align: left; margin-top: 20px;">
           <form action="car_main" method="get">
           		 <button type="submit" class="back-btn">← 돌아가기</button>
        	</form>
        </div>
        <div class="upload-container">
            <div class="image-preview">
                <img src="image-placeholder.png" id="preview" alt="Image Preview">
            </div>
            <div class="form-container">

              <form id="upload-form"  action="carWrite" method="post" enctype="multipart/form-data">
                    <label for="car_rank">상태</label>
                    <select id="car_rank" name="car_rank">
                        
                        <option value="S급">S급</option>
                        <option value="A급">A급</option>
                        <option value="B급">B급</option>
                       
                    </select>

                    <label for="title">제목</label>
                    <input type="text" id="title" name="car_title" placeholder="제목을 입력해 주세요">
					
                    <label for="price">가격</label>
                    <input type="text" id="price" name="car_price" placeholder="가격을 입력해 주세요">



                    <label for="description">내용</label>
                    <textarea id="description" name="car_content" rows="5" placeholder="게시글 내용을 작성해주세요."></textarea>

                    <div class="file-upload">
                        <input type="file" id="imageUpload" name="file" style="display: none;" onchange="loadImage(event)">
                        <label for="imageUpload" class="file-select-btn">파일선택</label>
                    </div><br>

                    <button type="submit" class="submit-btn">완료</button>
                </form>
            </div>
        </div>
    </main>

    <script>
        function loadImage(event) {
            const imagePreview = document.getElementById('preview');
            imagePreview.src = URL.createObjectURL(event.target.files[0]);
            imagePreview.onload = function() {
                URL.revokeObjectURL(imagePreview.src);
            }
        }

      
     
    </script>
</body>
</html>
