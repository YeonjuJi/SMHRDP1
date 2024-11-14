<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 프로필</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
    <link rel="stylesheet" href="MyList.css">
    <link rel="stylesheet" href="index.css">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
<link rel="stylesheet" href="dd.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
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
                     xmlns:xlink="http://www.w3.org/1999/xlink"
                     xmlns="http://www.w3.org/2000/svg">
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
                     <a href="boyC">남아의류</a>
                  <a href="girlC">여아의류</a>
                  <a href="toy">장난감류</a>
                  <a href="book">도서교구</a>
                  <a href="furniture">아이가구</a>
                  <a href="newBorn">육아출산</a>
                  <a href="babyCar">유모차</a>
                </div>
                     </div>
                     </li>
                  <li class="u-nav-item">
                     <div class="dropdown">
                  <a id="car"
                     class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
                     href="goCar" style="padding: 10px 20px;">Stroller</a>
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
                           href="goCar">Stroller</a></li>
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

    <section class="profile-section">
        <div class="profile-info">
            <img src="uploads/${user.userFile}" class="profile-image">
            <span class="username">${user.name}</span>
            <span class="favorite-heart">❤️</span><span class="faborite-score">${user.score}</span>
            <a href="goMyPage"><button class="profile-btn" id="profileBtn">프로필 수정</button></a>
        </div>
    </section>

    <section class="menu-section">
        <ul class="menu-list">
           <li><a href="messageList" class="list">내 쪽지함</a></li>
            <li><a href="#favorites" class="list">관심 목록</a></li>
            <li><a href="deal?id=${user.id}" class="list">판매 목록</a></li>
            <li><a href="#purchases" class="list">구매 목록</a></li>
            <li><a href="#board-activity" class="list">게시판 활동 내역</a></li>
            <li><a href="#stroller-trades" class="list">유모차 매매 내역</a></li>
            <li><a href="logout" class="list">로그아웃</a></li>
            <li><a href="exit" class="list">탈퇴 하기</a></li>
        </ul>
    </section>
</body>

</html>
