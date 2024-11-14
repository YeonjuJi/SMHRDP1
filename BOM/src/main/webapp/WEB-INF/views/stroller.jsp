<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BOM</title>

<link rel="stylesheet" href="dd.css">
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
            <a href="goCar"  class="active">Stroller</a>
               <div class="dropdown-content">
                  <a href="car">유모차 판매</a>
                  <a href="goCar">유모차 구입</a>
              
                </div>
            <a href="goComm">Board</a>
            <a href="goMyList">MyPage</a>
        </nav>
         </div>
    </header>

	<main>
		<section class="products" id="product-grid">
			<c:forEach items="${stList}" var="stList">
				<article class="product-card">
					<a class="card-link" href="goCarDetail?idx=${stList.car_idx}">
						<div class="image">
							<img alt="파일 경로 확인" src="stroller/${stList.car_file}" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">${stList.car_title}</h2>
							<div class="price">${stList.car_price}원</div>
							<div class="rank"> ${stList.car_rank}급</div>
							<div class="card-counts">
								<span class="like-counts"> 관심 0 </span> ∙ <span
									class="chat-counts"> 채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
			</c:forEach>
		</section>
		<a href="gogo"><button class="write-btn">글 쓰기</button></a>
		<button class="scroll-to-top" onclick="scrollToTop()">↑</button>
	</main>



	<script>


function renderProducts(deal) {
    const productGrid = document.getElementById('product-grid');
    productGrid.innerHTML = '';  // 기존 내용을 비우고 새로 추가

    products.forEach((deal, index) => {
        const productHTML = `
            <article class="product-card">
           /* onclick="viewProduct(${index})" */
           <c:forEach items="${deal}" var="deal" > 
                <a class="card-link" href="goDetail?idx=${deal.b_idx}" >
                    <div class="image">
                        <img alt="${product.title}" src="${product.image}" />
                    </div>
                    <div class="card-desc">
                        <h2 class="card-title">${product.title}</h2>
                        <div class="price">
                            ${product.price}
                        </div>
                        <div class="rank">
                            ${product.rank}
                        </div>
                        <div class="card-counts">
                            <span class="like-counts">
                                관심 0
                            </span>
                            ∙
                            <span class="chat-counts">
                                채팅 0
                            </span>
                        </div>
                    </div>
                </a>
                </c:forEach>
            </article>
        `;
        productGrid.innerHTML += productHTML;
    });
}


// 페이지 상단으로 스크롤하는 함수
function scrollToTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// 스크롤을 감지해서 버튼의 표시 여부를 결정하는 함수
window.onscroll = function() {
    const scrollToTopBtn = document.querySelector('.scroll-to-top');
    if (document.documentElement.scrollTop > 100) {
        scrollToTopBtn.style.display = 'block'; // 스크롤이 100px 이상 내려가면 버튼 보이기
    } else {
        scrollToTopBtn.style.display = 'none';  // 상단에 있으면 버튼 숨기기
    }
};
</script>

</body>

</html>
