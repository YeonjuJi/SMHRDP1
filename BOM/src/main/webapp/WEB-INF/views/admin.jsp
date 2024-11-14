<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자용 유모차페이지</title>
<link rel="stylesheet" href="styles.css">
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
                  <a href="goCar">유모차 구매</a>
              
                </div>
            <a href="goComm">Board</a>
            <a href="goMyList">MyPage</a>
        </nav>
         </div>
    </header>
	<div class="container">
		<main>
			<!-- Search bar -->
			<div class="search-bar">
				<input type="text" id="searchInput" placeholder="Search posts..."
					onkeyup="searchPosts()">
			</div>

			<!-- Table of posts -->
			<table class="board-table" id="postsTable">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- 게시물 목록 반복 -->
					<c:forEach var="deal" items="${deal}">
						<tr>
							<td>${deal.car_idx}</td>
							<td><a href="goCarDetail?idx=${deal.car_idx}">${deal.car_title}</a></td>
							<td>${deal.id}</td>
							<td>${deal.card_at}</td>
							<td>
								<div class="status-action">
									<form action="updateStatus?idx=${deal.car_idx}" method="post">
										<select name="car_cours">
											<option value="신청"
												${deal.car_cours == '신청' ? 'selected' : ''}>신청</option>
											<option value="접수"
												${deal.car_cours == '접수' ? 'selected' : ''}>접수</option>
											<option value="심사"
												${deal.car_cours == '심사' ? 'selected' : ''}>심사</option>
											<option value="매입"
												${deal.car_cours == '매입' ? 'selected' : ''}>매입</option>
											<option value="거절"
												${deal.car_cours == '거절' ? 'selected' : ''}>거절</option>
											<option value="완료"
												${deal.car_cours == '완료' ? 'selected' : ''}>완료</option>
										</select>
										<!-- 숨겨진 필드로 car_idx 전송 -->
										<input type="hidden" name="car_idx" value="${deal.car_idx}" />
										<button class="submit-btn" type="submit">처리</button>
									</form>
								</div>
							</td>
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

	<!-- 외부 JS 파일을 포함합니다 -->
	<script src="admin.js"></script>
</body>

</html>
