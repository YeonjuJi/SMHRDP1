let chat = {
    "id": "",
    "chat": ""
};

// 웹소켓 연결
let socket = new WebSocket("ws://localhost:8088/bompj/goChat?idx="+deal.b_idx);

// 웹소켓 이벤트 핸들러 설정
socket.onopen = onOpen;
socket.onclose = onClose;
socket.onmessage = onMessage;



// 사용자가 ID를 설정하면 웹소켓을 연결하고 버튼 상태를 변경합니다.
$(nick).on("click", function() {
    chat.id = $('#nick').val();
 

});

// 메시지를 전송하는 버튼의 클릭 이벤트 핸들러
$('#button-send').on("click", function() {
    chat.chat = $('#msg').val();
    
    if (chat.chat.trim() === "") {
        return; // 빈 메시지는 전송하지 않음
    }
    
    // 메시지를 화면에 추가
    let messageHtml = `
        <div class='row'>
            <div class='col-sm-6'></div>
            <div class='col-sm-6'>
                <div class='alert alert-secondary'>
                    <b>${chat.chat}</b>
                </div>
            </div>
        </div>
    `;
    
    $('#chatBody').append(messageHtml);
    $('#chatBody').scrollTop($('#chatBody')[0].scrollHeight);
    
    // 메시지를 JSON으로 변환하여 웹소켓을 통해 전송
    socket.send(JSON.stringify(chat));
    
    // 입력 필드를 비움
    $('#msg').val('');
});

// 웹소켓 연결이 열릴 때 호출되는 함수
function onOpen() {
    console.log("사용자 접속 완료");
}

// 웹소켓 연결이 닫힐 때 호출되는 함수
function onClose() {
    console.log("사용자 접속 해제");
}

// 웹소켓으로부터 메시지를 수신했을 때 호출되는 함수
function onMessage(msg) {
    console.log(msg.data);
    
    // 메시지 데이터를 JSON으로 파싱
    let data = JSON.parse(msg.data);
    console.log(data.id);
    console.log(data.chat);
    
    // 메시지 유형에 따라 화면에 추가
    let messageHtml;
    if (data.id === chat.id) {
        messageHtml = `
            <div class='row'>
                <div class='col-sm-6'></div>
                <div class='col-sm-6'>
                    <div class='alert alert-secondary'>
                        <b>${data.chat}</b>
                    </div>
                </div>
            </div>
        `;
    } else {
        messageHtml = `
            <div class='row'>
                <div class='col-6'>
                    <div class='alert alert-warning'>
                        <b>${data.id}: ${data.chat}</b>
                    </div>
                </div>
            </div>
        `;
    }
    
    $('#chatBody').append(messageHtml);
    $('#chatBody').scrollTop($('#chatBody')[0].scrollHeight);
}
