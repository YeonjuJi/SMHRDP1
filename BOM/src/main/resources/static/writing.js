function loadImage(event) {
    const preview = document.getElementById('preview');
    preview.src = URL.createObjectURL(event.target.files[0]);
    preview.onload = () => {
        URL.revokeObjectURL(preview.src); // 이미지 로드 후 메모리 해제
    }
}

/*function submitForm(event) {
    event.preventDefault();
    const formData = new FormData(document.getElementById('upload-form'));

    const setAsMain = formData.get('setAsMain') ? '대표 이미지로 설정됨' : '일반 이미지로 설정됨';
    console.log('제목:', formData.get('b_title'));
    console.log('가격:', formData.get('how_much'));
	console.log('카테고리:', formData.get('category'));
    console.log('설명:', formData.get('b_content'));
    console.log(setAsMain);
    // 실제 서버로 전송하는 부분은 구현 필요
}*/

// 저장안하고 그냥 게시판으로가기
function goBack() {
    window.location.href = 'b_board';  // dd.html로 이동
}