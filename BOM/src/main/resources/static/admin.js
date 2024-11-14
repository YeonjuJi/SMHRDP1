/*// 상태 처리 함수
function processStatus(postId) {
    // 드롭다운 메뉴에서 선택된 값을 가져옵니다.
    const selectedStatus = document.getElementById(`status-${postId}`).value;

    // 상태 처리 로직 (AJAX를 통해 서버에 상태를 전송하는 부분)
    console.log(`Processing Post ID: ${postId}, Status: ${selectedStatus}`);

    // 예시: 서버로 상태 변경을 보낼 때
    fetch(`/updateStatus`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            postId: postId,
            status: selectedStatus
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('상태가 성공적으로 업데이트되었습니다.');
        } else {
            alert('상태 업데이트에 실패했습니다.');
        }
    })
    .catch((error) => {
        console.error('Error:', error);
    });*/
/*}*/

// 검색 기능 (추가적인 기능이 필요할 경우 작성)
function searchPosts() {
    const input = document.getElementById('searchInput').value.toLowerCase();
    const table = document.getElementById('postsTable');
    const tr = table.getElementsByTagName('tr');

    for (let i = 1; i < tr.length; i++) { // 0번 행은 제목이므로 1번부터 시작
        const tdTitle = tr[i].getElementsByTagName('td')[1]; // 두 번째 열 (제목)
        if (tdTitle) {
            const txtValue = tdTitle.textContent || tdTitle.innerText;
            if (txtValue.toLowerCase().indexOf(input) > -1) {
                tr[i].style.display = '';
            } else {
                tr[i].style.display = 'none';
            }
        }
    }
}
