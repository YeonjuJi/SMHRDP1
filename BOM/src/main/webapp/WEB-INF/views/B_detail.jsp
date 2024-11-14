<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>중고거래 글 보기</title>
<link rel="stylesheet" href="market_d.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f26071dc8549ac02492f1a464b072358&libraries=services"></script>
    
        <style>
        .product-container {
            width: 100%;
        }

        .content-wrapper {
            display: flex;
            justify-content: space-around;
            align-items: flex-end;
            margin-top: 20px;
        }

        .image-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(50px, 1fr));
            gap: 10px;
            background: rgba(255, 255, 255, 0.8);
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 200px;
        }

        .image-item {
            overflow: hidden;
            border-radius: 8px;
            cursor: pointer;
        }

        .image-item img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .image-item img:hover {
            transform: scale(1.05);
        }

        .image-preview {
            background: rgba(255, 255, 255, 0.8);
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .image-preview img {
            max-width: 200px;
            max-height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        #map {
            margin-top: 20px;
        }
        
        </style>
        
        <script>
        function showPopup() { window.open("smessage?idx=${yoyo.b_idx}", "쪽지보내기", "width=860, height=907, left=100, top=50"); }
        </script>

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
            <a href="goCar">Stroller</a>
               <div class="dropdown-content">
                  <a href="car">유모차 판매</a>
                  <a href="goCar">유모차 구입</a>
              
                </div>
            <a href="goComm">Board</a>
            <a href="goMyList">MyPage</a>
        </nav>
         </div>
    </header>

	<main>

		<!-- 돌아가기 버튼 추가 -->
		<div style="text-align: left; margin: 20px 0;">
			<form action="b_board" method="get">
				<button type="submit" class="back-btn">← 돌아가기</button>
			</form>
		</div>


	<!-- 페이지 컨테이너 -->
	<div class="product-container" style="display: flex; flex-direction: column; align-items: center;">
    <!-- 첫 번째 행: 이미지와 제품 정보 -->
    <div class="content-wrapper" style="display: flex; justify-content: space-between; width: 100%; align-items: flex-start;">
        <!-- 왼쪽: 이미지 섹션 -->
        <div class="image-section" style="flex: 1; display: flex; flex-direction: column; align-items: center;">
            <!-- 이미지 갤러리 -->
            <div class="image-gallery" style="margin-bottom: 20px;">
                <c:forEach var="file" items="${fileList}">
                    <div class="image-item" style="margin-bottom: 10px;">
                        <img src="uploads/${file}" alt="Product Image" onclick="showPreview(this)" style="width: 100px; height: auto; cursor: pointer;">
                    </div>
                </c:forEach>
            </div>
            <!-- 프리뷰 이미지 -->
            <div class="image-preview">
  			  <img id="preview-image" src="uploads/${file}" alt="Preview Image" style="max-width: 300px; max-height: 300px;">
			</div>
        </div>

        <!-- 오른쪽: 제품 상세 정보 -->
        <div class="product-info" style="flex: 2; text-align: left; margin-left: 50px;">
            <div class="seller-info" style="display: flex; align-items: center; margin-bottom: 20px;">
                <img src="uploads/${duInfo}" alt="Seller Icon" class="seller-icon" style="width: 50px; height: 50px; border-radius: 50%; margin-right: 10px;">
                <div>
                    <p id="seller-name" style="font-size: 18px; font-weight: bold;">${yoyo.id}</p>
                    <p id="region" style="font-size: 14px;">${duAddr}</p>
                </div>
            </div>

            <h2 id="product-title" style="font-size: 24px; margin-bottom: 10px;">${yoyo.b_title}</h2>
            <p id="product-price" class="price" style="font-size: 20px; font-weight: bold; color: #333;">${yoyo.how_much}원</p>
            <p id="product-description" class="description" style="font-size: 16px; line-height: 1.5;">${yoyo.b_content}</p>

            <div style="margin-top: 20px;">
           
                <button onclick="showPopup();" class="message-btn">쪽지보내기</button>
                
            </div>
        </div>
    </div>


    <!-- 지도 추가 -->
    <div id="map" style="width: 100%; height: 300px; margin-top: 20px;"></div>
</div>

	</main>


	
	<script>
	<!-- 지도 스크립트 -->
	
	
        // 글 작성자의 좌표를 변수에 저장합니다. JSP에서 서버 데이터를 자바스크립트 변수로 전달
        var lat = ${user.latitude != null ? user.latitude : '37.5665'}; // 기본값으로 서울 위도 설정
        var lng = ${user.longitude != null ? user.longitude : '126.9780'}; // 기본값으로 서울 경도 설정

        // 좌표가 제대로 로드되지 않은 경우 기본값 설정을 위한 안전장치 (필요시 추가)
        if (!lat || !lng) {
            lat = 37.5665; // 서울의 기본 위도
            lng = 126.9780; // 서울의 기본 경도
        }

        // 카카오맵 API를 사용하여 지도를 표시합니다.
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다.

        // 글 작성자의 위치에 마커를 표시합니다.
        var markerPosition = new kakao.maps.LatLng(lat, lng); 
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다.
        marker.setMap(map);
        
        $(document).ready(function() {
            $.ajax({
                url: "get-last-location",
                method: "GET",
                success: function(response) {
                    console.log("좌표 응답:", response);  // 응답 확인
                    if (response && response.latitude && response.longitude) {
                        var lat = response.latitude;
                        var lng = response.longitude;

                        // 지도 생성
                        var mapContainer = document.getElementById('map');
                        var mapOption = { 
                            center: new kakao.maps.LatLng(lat, lng),
                            level: 3
                        };

                        var map = new kakao.maps.Map(mapContainer, mapOption);

                        // 마커 생성
                        var markerPosition = new kakao.maps.LatLng(lat, lng); 
                        var marker = new kakao.maps.Marker({
                            position: markerPosition
                        });
                        marker.setMap(map);
                    } else {
                        console.error("좌표가 올바르지 않습니다.", response);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 실패:", error);
                }
            });
        });

    

        <!-- 프리뷰 -->
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
        </script>
</body>
</html>

