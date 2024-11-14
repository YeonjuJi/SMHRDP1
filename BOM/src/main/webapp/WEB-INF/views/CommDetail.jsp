<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Post Detail</title>
<link rel="stylesheet" href="styles.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<header>
		<a href="./" style="text-decoration: none; color: inherit;">
			<h1>BOM</h1>
		</a>
		<nav>
			<a href="./">Home</a>
			<div class="dropdown">
				<a href="b_board" class="active">Market</a>
				<div class="dropdown-content">
					<a href="boyC">남아의류</a> <a href="girlC">여아의류</a> <a href="toy">장난감류</a>
					<a href="book">도서교구</a> <a href="furniture">아이가구</a> <a
						href="newBorn">육아출산</a> <a href="babyCar">유모차</a>
				</div>
			</div>
			<a href="goCar">Stroller</a>
			<div class="dropdown-content">
				<a href="car">유모차 판매</a> <a href="goCar">유모차 구입</a>

			</div>
			<a href="goComm">Board</a> <a href="goMyList">MyPage</a>
		</nav>
	</header>

	<div class="container">
		<main>
			<div class="post-detail">
				<div class="post-header">
					<div class="author-info">
						<div class="author-icon"></div>
						<span class="author-name">작성자: ${post.id}</span> <span
							class="post-date">작성일: ${post.created_at}</span>
					</div>
					<div class="view-count">
						조회수: <span id="viewCount">${post.views}</span>
					</div>
				</div>

				<div class="post-content">
					<h2 id="postTitle">${post.cb_title}</h2>
					<p style="white-space: pre-line;">${post.cb_content}</p>
				</div>

				<!-- If there's an attached file -->
				<c:if test="${post.cb_file != null}">
					<div class="post-file">
						<c:choose>
							<c:when
								test="${post.cb_file.toLowerCase().endsWith('.jpg') || 
				            				post.cb_file.toLowerCase().endsWith('.jpeg') || 
				            				post.cb_file.toLowerCase().endsWith('.png') || 
				            				post.cb_file.toLowerCase().endsWith('.gif')}">
								<!-- 이미지 파일일 경우 이미지를 본문에 표시 -->
								<img src="forComm/${post.cb_file}" alt="첨부 이미지"
									style="max-width: 100%; height: auto;">
							</c:when>
							<c:otherwise>
								<!-- 이미지가 아닌 파일은 다운로드 링크로 표시 -->
								<p>
									<strong>첨부파일:</strong> <a href="${uploadDir}/${post.cb_file}"
										download>${post.cb_file}</a>
								</p>
							</c:otherwise>
						</c:choose>
					</div>
				</c:if>

				<div class="post-footer">
					<div class="like-comment-section">
						<!-- <span class="like-count">좋아요 0</span> -->
						<span class="comment-count">댓글 ${comments.size()}</span>
					</div>
				</div>

				<div class="comment-section">
					<div class="comment-bot-warning">클린봇이 악성 댓글을 감지합니다.</div>
					<!-- 댓글 작성 폼 -->
					<form action="addComment" method="POST">
						<textarea name="ccmt_content" placeholder="댓글을 남겨보세요"></textarea>
						<input type="hidden" name="cb_idx" value="${post.idx}">
						<button type="submit">등록</button>
					</form>

					<!-- 댓글 목록 -->
					<div class="comments">
						<c:choose>
							<c:when test="${empty comments}">
								<p>댓글이 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="comment" items="${comments}">
									<div class="comment-item">
										<p>
											<strong>${comment.id}</strong>: ${comment.ccmt_content} /
											${comment.created_at}
										</p>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>

			<div class="back-button">
				<a href="goPostList" class="button">목록</a>
				<!-- 수정 및 삭제 버튼 -->
				<c:if test="${sessionScope.userId == post.id}">
					<a href="editPost?idx=${post.idx}" class="button">수정</a>
					<a href="deletePost?idx=${post.idx}" class="button"
						onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
				</c:if>
			</div>
		</main>

	</div>
	<script>
		/*         // URL에서 쿼리 파라미터를 가져오는 함수
		 function getQueryParam(param) {
		 let urlParams = new URLSearchParams(window.location.search);
		 return urlParams.get(param);
		 }

		 // 페이지 로드 시, 제목을 설정
		 window.onload = function() {
		 let postTitle = getQueryParam('title');
		 if (postTitle) {
		 document.getElementById('postTitle').textContent = decodeURIComponent(postTitle);
		 }
		 } */
	</script>
</body>
</html>
