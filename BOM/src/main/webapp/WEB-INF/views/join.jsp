<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입</title>
<link rel="stylesheet" href="join.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('.check-btn').click(function() {
			console.log('중복 확인 버튼 클릭됨');
			var userId = $('#id').val();

			if (userId === '') {
				alert('아이디를 입력해주세요.');
				return;
			}

			$.ajax({
				url : 'checkId',
				type : 'GET',
				data : {
					id : userId
				},
				success : function(response) {
					if (response === 'duplicate') {
						alert('이미 사용 중인 아이디입니다.');
					} else {
						alert('사용 가능한 아이디입니다.');
					}
				},
				error : function() {
					alert('중복 확인 중 오류가 발생했습니다.');
				}
			});
		});

		// 폼 제출 시 비밀번호 일치 확인
		$('.submit-btn').click(function(event) {
			var password = $('#pw').val();
			var confirmPassword = $('#confirm-password').val();

			if (password !== confirmPassword) {
				alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
				event.preventDefault(); // 폼 제출 중지
			}
		});

		// 신분증 등록 버튼 클릭 시 파일 입력 필드 열기
		$('.id-btn').click(function() {
			$('#idCardFile').click();
		});

		// 파일 선택 후, 파일 이름을 확인하거나 다른 작업을 할 수 있음
		$('#idCardFile').change(function() {
			var formData = new FormData();
			formData.append("file", $('#idCardFile')[0].files[0]);

			$.ajax({
				url : 'uploadFile', // Spring Boot 서버의 업로드 엔드포인트
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(response) {
					console.log('파일이 성공적으로 전송되었습니다: ' + response);
					$('#extractedText').val(response);
					$('#popupTextarea').val(response); // 팝업에 텍스트 표시
                    $('#popup').show(); // 팝업 열기
				},
				error : function(xhr, status, error) {
					console.log('파일 전송 중 오류가 발생했습니다: ' + error);
				}
			});

		});
		
		// 팝업에서 "저장" 버튼 클릭 시
        $('#savePopupText').click(function() {
            var updatedText = $('#popupTextarea').val();
            var nameFieldText = $('#name').val();
            var parsedText = JSON.parse(updatedText);
            
            if (parsedText["이름"] !== nameFieldText.trim()) {
                alert('입력하신 이름과 추출된 정보가 일치하지 않습니다!');
                return; // 일치하지 않으면 저장하지 않고 함수 종료
            }else{
            	// 주소 값을 HTML input 요소에 넣기
            	document.getElementById('addr').value = parsedText["주소"];
                $('#extractedText').val(updatedText); // hidden input에 수정된 텍스트 저장
                $('#popup').hide(); // 팝업 닫기
            }
        });

	});
	
</script>
</head>
<body>
	<div class="signup-container">
		<h1>회원 가입</h1>
		<form action="join" method="post" enctype="multipart/form-data">
			<!-- 아이디 -->
			<label for="id">아이디</label>
			<div class="input-group">
				<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요"
					required>
				<button type="button" class="check-btn">중복확인</button>
			</div>

			<!-- 비밀번호 -->
			<label for="pw">비밀번호</label> <input type="password" id="pw" name="pw"
				placeholder="비밀번호를 입력해주세요" required>

			<!-- 비밀번호 확인 -->
			<label for="confirm-password">비밀번호 확인</label> <input type="password"
				id="confirm-password" name="confirmPassword"
				placeholder="비밀번호를 다시 입력해주세요" required>

			<!-- 성명 -->
			<label for="name">성명</label> <input type="text" id="name" name="name"
				placeholder="성명을 입력해주세요" required>

			<!-- 전화번호 -->
			<label for="phone">전화번호</label> <input type="text" id="phone"
				name="phone" placeholder="전화번호를 입력해주세요" required>

			<!-- 주소 -->
			<label for="addr">주소</label> <input type="text" id="addr" name="addr"
				placeholder="신분증 등록 시 자동 입력됩니다." required readonly>

			<!-- Flask로부터 받은 extractedText를 저장할 hidden 필드 -->
			<input type="hidden" id="extractedText" name="extractedText" value="">

			<div class="button-group">
				<!-- 신분증 등록 버튼 -->
				<button type="button" class="id-btn">신분증 등록</button>
				<!-- 파일 입력 필드 (숨겨진 상태) -->
				<input type="file" id="idCardFile" name="idCardFile"
					style="display: none;" accept="image/*">
				<!-- 확인 버튼 (폼 제출) -->
				<button type="submit" class="submit-btn">확인</button>
			</div>
		</form>
	</div>

	<!-- 팝업 창 -->
	<div id="popup">
		<textarea id="popupTextarea"></textarea>
		<div class="button-group">
			<button type="button" id="savePopupText">저장</button>
		</div>
	</div>

</body>
</html>
