<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="login.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <div class="login-icon">
                <img src="./images/login_lcon.png" alt="User Icon">
            </div>
            <h2>Login Now</h2>
        </div>
        <form action="loginCh" method="post">
            <label for="userid">아이디</label>
            <input type="text" id="userid" name="id" placeholder="아이디를 입력해주세요">
            
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="pw" placeholder="비밀번호를 입력해주세요">
            
            <div class="remember-me">
                <input type="checkbox" id="remember-me">
                <label for="remember-me">아이디 기억하기</label>
            </div>
            
            <button type="submit">로그인</button>
            
            <div class="extra-links">
                <a href="goJoin">아직 회원이 아니신가요?</a>
            </div>
        </form>
    </div>
     <!-- 로그인 실패 시 팝업 띄우기 -->
    <% if (request.getAttribute("loginError") != null) { %>
    <script>
        $(document).ready(function() {
            alert("<%= request.getAttribute("loginError") %>");
        });
    </script>
    <% } %>
</body>
</html>
