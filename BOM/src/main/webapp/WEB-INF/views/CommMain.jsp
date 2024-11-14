<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Community Board</title>
<link rel="stylesheet" href="styles.css">
<script class="u-script" type="text/javascript" src="nicepage.js"
	defer=""></script>
<script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet">
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
                <a href="b_board">Market</a>
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
            <div class="dropdown">
                <a href="goCar">Stroller</a>
                <div class="dropdown-content">
                    <a href="car">유모차 판매</a>
                    <a href="goCar">유모차 구입</a>
                </div>
            </div>
            <a href="goComm"  class="active">Board</a>
            <a href="goMyList">MyPage</a>
        </nav>
    </div>
</header>

	<div class="container">
		<main>
			<!-- Search bar -->
			<div class="search-bar">
				<input type="text" id="searchInput" placeholder="검색어를 입력하세요"
					onkeyup="searchPosts()">
			</div>

			<!-- 작성하기 버튼 -->
			<form action="goCommWrite" align="right">
				<button type="submit" id="write-btn">작성하기</button>
			</form>

			<!-- Table of posts -->
			<table class="board-table" id="postsTable">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="post" items="${topThreePosts}">
						<tr class="popular-row">
							<td>인기글</td>
							<td><a href="goWriteDetail?idx=${post.idx}" class="cctitle">${post.cb_title}</a></td>
							<td>${post.id}</td>
							<td>${post.created_at}</td>
							<td>${post.views}</td>
						</tr>
					</c:forEach>
					<c:forEach var="post" items="${posts}">
						<tr>
							<td>${post.idx}</td>
							<td><a href="goWriteDetail?idx=${post.idx}" class="cctitle">${post.cb_title}</a></td>
							<td>${post.id}</td>
							<td>${post.created_at}</td>
							<td>${post.views}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 페이징 처리 -->
			<c:if test="${totalPages > 0}">
				<div class="pagination">
					<c:if test="${currentPage > 0}">
						<a href="goComm?page=${currentPage - 1}">Previous</a>
					</c:if>

					<c:forEach begin="0" end="${totalPages - 1}" var="i">
						<c:choose>
							<c:when test="${i == currentPage}">
								<span>${i + 1}</span>
							</c:when>
							<c:otherwise>
								<a href="goComm?page=${i}">${i + 1}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${currentPage < totalPages - 1}">
						<a href="goComm?page=${currentPage + 1}">Next</a>
					</c:if>
				</div>
			</c:if>
		</main>
	</div>
	<script src="script.js"></script>
</body>

</html>