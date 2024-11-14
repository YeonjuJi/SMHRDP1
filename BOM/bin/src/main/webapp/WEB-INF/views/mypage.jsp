<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="mypage.css">
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

	<section class="profile-section">
		<div class="profile-info">
			<img src="./images/free-icon-person-4203951.png"
				class="profile-image"> <span class="username">${userName}님</span>
			<span class="favorite-heart">❤️</span>
			<button class="profile-btn" id="profileBtn">프로필 보기</button>
		</div>
	</section>

	<section class="menu-section">
		<ul class="menu-list">
			<li><a href="messageList">내 쪽지함</a></li>
			<li><a href="#favorites">관심 목록</a></li>
			<li><a href="#sales">판매 목록</a></li>
			<li><a href="#purchases">구매 목록</a></li>
			<li><a href="#board-activity">게시판 활동 내역</a></li>
			<li><a href="#stroller-trades">유모차 매매 내역</a></li>
			<li><a href="#logout">로그아웃</a></li>
			<li><a href="#delete-account">탈퇴 하기</a></li>
		</ul>
	</section>
</body>

</html>