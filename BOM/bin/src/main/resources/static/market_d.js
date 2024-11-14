let currentSlide = 0;

function moveSlide(direction) {
    const slides = document.querySelector('.slides');
    const slideCount = slides.children.length;
    const slideWidth = slides.children[0].clientWidth;

    currentSlide += direction;

    if (currentSlide < 0) {
        currentSlide = slideCount - 1;
    } else if (currentSlide >= slideCount) {
        currentSlide = 0;
    }

    slides.style.transform = `translateX(-${currentSlide * slideWidth}px)`;
}

function renderProducts(products) {
    const productGrid = document.getElementById('product-grid');
    productGrid.innerHTML = '';  // 기존 내용을 비우고 새로 추가

    products.forEach((product, index) => {
        const productHTML = `
            <article class="product-card">
                <a class="card-link" href="#" onclick="viewProduct(${index})">
                    <div class="image">
                        <img alt="${product.title}" src="${product.image}" />
                    </div>
                    <div class="card-desc">
                        <h2 class="card-title">${product.title}</h2>
                        <div class="price">
                            ${product.price}
                        </div>
                        <div class="region">
                            ${product.region}
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
            </article>
        `;
        productGrid.innerHTML += productHTML;
    });
}

function viewProduct(index) {
    // 로컬 스토리지에 선택된 상품 인덱스를 저장
    localStorage.setItem('selectedProductIndex', index);

    // market_d.html로 이동
    window.location.href = 'b_board';
}

document.addEventListener("DOMContentLoaded", function() {
    // 로컬 스토리지에서 선택된 상품 인덱스와 모든 상품 데이터를 가져옴
    const selectedProductIndex = localStorage.getItem('selectedProductIndex');
    const products = JSON.parse(localStorage.getItem('products')) || [];

    if (selectedProductIndex !== null && products[selectedProductIndex]) {
        const product = products[selectedProductIndex];

        // 페이지의 각 요소에 데이터를 채워 넣기
        document.getElementById('product-title').textContent = product.title;
        document.getElementById('product-price').textContent = product.price;
        document.getElementById('product-description').textContent = product.description; 

        // 슬라이드 이미지도 변경해주어야 함 (여기서는 단일 이미지로 처리)
        document.querySelector('.slides .slide').src = product.image;
    } else {
        // 선택된 상품이 없는 경우 또는 잘못된 접근의 경우 처리
        alert("상품 정보를 불러올 수 없습니다.");
        window.location.href = 'b_board';
    }
});

function goBack() {
    window.location.href = 'b_board';  // dd.html로 이동
}