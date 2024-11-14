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
