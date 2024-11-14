<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 수정</title>
<link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="myfageRe.css">
<link rel="stylesheet" href="index.css">
<script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="nicepage.js"
	defer=""></script>
<link rel="stylesheet" href="dd.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f26071dc8549ac02492f1a464b072358&libraries=services"></script>

</head>
<body>
	<header class="u-clearfix u-gradient u-header u-header" id="sec-b9bc"
		data-animation-name="" data-animation-duration="0"
		data-animation-delay="0" data-animation-direction="">
		<div class="u-clearfix u-sheet u-sheet-1">
			<p class="u-align-center u-text u-text-body-alt-color u-text-1">
				<a
					class="u-active-none u-border-none u-btn u-button-link u-button-style u-custom-font u-hover-none u-none u-text-body-alt-color u-btn-1"
					data-href="./">BOM </a>
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
							xmlns:xlink="http://www.w3.org/2000/svg">
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

	<div class="container">
		<h2 align="center">프로필 수정</h2>
		<div align="right">
			<a href="goMyList"><button class="btn">마이페이지</button></a>
		</div>

		<form action="updateProfile" method="post"
			enctype="multipart/form-data">
			<!-- 프로필 사진 변경 -->
			<div class="profile-picture-section">
				<label for="profilePicture" class="profile-label">프로필 사진 변경</label>
				<div class="profile-picture-preview">
					<img id="profileImage" src="uploads/${user.userFile}"
						alt="프로필 사진 미리보기" />
				</div>
				<input type="file" id="profilePicture" name="profilePicture"
					accept="image/*" onchange="previewProfileImage(event)">
			</div>

			<div class="input-group">
				<label for="password">비밀번호</label> <input type="password"
					id="password" name="password" placeholder="비밀번호를 입력 해주세요">
			</div>
			<div class="input-group">
				<label for="confirmPassword">비밀번호 확인</label> <input type="password"
					id="confirmPassword" name="confirmPassword"
					placeholder="비밀번호를 다시한번 입력 해주세요">
			</div>
			<div class="input-group">
				<label for="nickname">닉네임</label> <input type="text" id="nickname"
					name="nickname" placeholder="변경하실 닉네임을 입력해주세요" value="${user.name}">
			</div>
			<div class="input-group">
				<label for="phone">전화번호</label> <input type="text" id="phone"
					name="phone" placeholder="변경하실 전화번호를 입력해주세요" value="${user.phone}">
			</div>
			<div class="input-group">
				<label for="addr">주소</label> <input type="text" id="addr"
					name="addr" placeholder="변경하실 주소를 입력해주세요" value="${user.addr}">
			</div>

			<button type="submit" class="btn">완료</button>
		</form>

		<div class="map">
			<h3>위치 변경</h3>
			<div id="map"></div>
			<button class="btn" id="changeLocationBtn" style="margin-top: 10px;">내
				위치</button>
			<button class="btn" id="loadLastMarkerBtn" style="margin-top: 10px;">저장하기</button>
		</div>
	</div>

	<script>
    let map;
    let marker;
    let rememberMarker;  // 클릭한 위치 좌표를 저장할 변수

    // 지도 초기화
    async function initMap() {
        let initialPosition = new kakao.maps.LatLng(35.1076352, 126.8809728); // 초기 위치

        map = new kakao.maps.Map(document.getElementById('map'), {
            center: initialPosition,
            level: 3 // 적절한 확대 레벨 설정
        });

        marker = new kakao.maps.Marker({
            position: initialPosition,
            map: map
        });

        // 서버에서 마지막 저장된 위치 불러오기
        await loadLastMarker();

        // 지도에 클릭 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            let latlng = mouseEvent.latLng;
            
            // 좌표가 정상적인지 확인합니다
            if (latlng.getLat() >= -90 && latlng.getLat() <= 90 && latlng.getLng() >= -180 && latlng.getLng() <= 180) {
                // 마커 위치를 클릭한 위치로 옮깁니다
                marker.setPosition(latlng);

                // 클릭한 위치를 rememberMarker에 저장
                rememberMarker = latlng;
                console.log('rememberMarker 저장:', rememberMarker);
            } else {
                console.error('잘못된 좌표값입니다:', latlng);
            }
        });
    }

    // 서버에서 마지막 저장된 위치를 불러옵니다
    async function loadLastMarker() {
    try {
        const response = await fetch('get-last-location');
        const data = await response.json();

        if (data.latitude && data.longitude) {
            const lastPosition = new kakao.maps.LatLng(data.latitude, data.longitude);

            // 마커 위치를 마지막 위치로 옮깁니다
            marker.setPosition(lastPosition);
            map.setCenter(lastPosition);

            console.log('마지막 위치가 로드되었습니다:', lastPosition);
        } else {
            console.error('마지막 위치가 없습니다.');
        }
    } catch (error) {
        console.error('마지막 위치를 불러오는 중 오류 발생:', error);
    }
}


    // 저장하기 버튼 클릭 이벤트 - rememberMarker를 서버로 전송
document.getElementById('loadLastMarkerBtn').addEventListener('click', async function() {
    if (rememberMarker) {
        const latitude = rememberMarker.getLat();
        const longitude = rememberMarker.getLng();

        try {
            const response = await fetch('save-location', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    latitude: latitude,
                    longitude: longitude
                })
            });

            const result = await response.text();
            console.log(result);

            if (result === "좌표가 성공적으로 저장되었습니다.") {
                alert('위치가 성공적으로 저장되었습니다!');
            } else {
                alert('위치 저장에 실패했습니다.');
            }
        } catch (error) {
            console.error('좌표 전송 중 오류 발생:', error);
        }
    } else {
        alert('저장할 위치가 없습니다. 먼저 지도를 클릭하세요.');
    }
});


// 내 위치 버튼 클릭 이벤트 - GPS로 현재 위치 가져오기
document.getElementById('changeLocationBtn').addEventListener('click', function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            let lat = position.coords.latitude;
            let lng = position.coords.longitude;

            let currentPos = new kakao.maps.LatLng(lat, lng);

            // 마커를 현재 위치로 이동
            marker.setPosition(currentPos);
            map.setCenter(currentPos);

            // 현재 위치를 rememberMarker에 저장
            rememberMarker = currentPos;

            console.log('현재 위치:', currentPos);
        }, function(error) {
            console.error('GPS 위치를 가져오는 중 오류 발생:', error);
        });
    } else {
        alert('GPS를 지원하지 않는 브라우저입니다.');
    }
});




    // 페이지 로드 후 지도 초기화
    window.onload = initMap;
</script>




	<script>
      // 프로필 사진 미리보기 기능
      function previewProfileImage(event) {
         const reader = new FileReader();
         reader.onload = function() {
            const output = document.getElementById('profileImage');
            output.src = reader.result;
         };
         reader.readAsDataURL(event.target.files[0]);
      }
   </script>
</body>
</html>
