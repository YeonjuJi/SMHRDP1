<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쪽지함</title>
<link rel="stylesheet" href="message.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet">
</head>

<body>
	<div class="container">
		<header>
			<div class="header-container">
				<nav class="main-nav">
					<div class="logo">
						<h1>BOM</h1>
					</div>
				</nav>
				<nav class="main-nav">
					<ul>
						<!-- Home, Market, Stroller, Board, MyPage 순서로 정렬 -->
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="home" style="padding: 10px 20px;">Home</a></li>
						<li class="u-nav-item">
							<div class="dropdown">
								<a
									class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
									href="b_board" style="padding: 10px 20px;">Market</a>
								<div class="dropdown-content">
									<a href="boyC">남아의류</a> <a href="girlC">여아의류</a> <a href="toy">장난감류</a>
									<a href="book">도서교구</a> <a href="furniture">아이가구</a> <a
										href="newBorn">육아출산</a> <a href="babyCar">유모차</a>
								</div>
							</div>
						</li>
						<li class="u-nav-item">
							<div class="dropdown">
								<a id="car"
									class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
									href="car" style="padding: 10px 20px;">Stroller</a>
								<div class="dropdown-content">
									<a href="car">유모차 매입 신청</a> <a href="goCar">유모차 구매</a>
								</div>
							</div>
						</li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="b_board" style="padding: 10px 20px;">Board</a></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="myPage" style="padding: 10px 20px; color: #f44336;">MyPage</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>


		<main>
			<!-- 탭 섹션 -->
			<div class="tabs">
				<button class="tab-link active" onclick="openTab(event, 'received')">받은
					쪽지</button>
				<button class="tab-link" onclick="openTab(event, 'sent')">보낸
					쪽지</button>
			</div>

			<!-- 받은 쪽지 컨테이너 -->
			<div id="received" class="tab-content container-box"
				style="display: block;">
				<h2>받은 쪽지</h2>
				<table class="message-table">
					<thead>
						<tr>
							<th>보낸 사람</th>
							<th>제목</th>
							<th>날짜</th>
							<th>작업</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="message" items="${selectMessage}">
							<tr>
								<td>${message.send_m}</td>
								<td><a href="rMessage?idx=${message.m_idx}">${message.m_title}</a></td>
								<td><fmt:formatDate value="${message.send_at}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><a href="reSendMessage?idx=${message.m_idx}"><button
											class="reply-btn">답장</button></a> <a
									href="deleteMessage?idx=${message.m_idx}"><button
											class="delete-btn">삭제</button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- 보낸 쪽지 컨테이너 -->
			<div id="sent" class="tab-content container-box">
				<h2>보낸 쪽지</h2>
				<table class="message-table">
					<thead>
						<tr>
							<th>받는 사람</th>
							<th>제목</th>
							<th>날짜</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="messageSend" items="${sendMessage}">
							<tr>
								<td>${messageSend.accept_m}</td>
								<td><a href="sMessage?idx=${messageSend.m_idx}">${messageSend.m_title}</a></td>
								<td><fmt:formatDate value="${messageSend.send_at}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>
									<a
									href="deleteMessage?idx=${messageSend.m_idx}"><button
											class="delete-btn">삭제</button></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>

	</div>

	<script>
		function openTab(evt, tabName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tab-content");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tab-link");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(tabName).style.display = "block";
			evt.currentTarget.className += " active";
		}
	</script>
</body>

</html>
