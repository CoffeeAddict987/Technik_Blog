class Home extends Page {
    constructor() {
        super('home');
    }

    render(parentSelector) {
        $(parentSelector).load(`./pages/${this.pageName}/${this.pageName}.html`, () => {
            showSlides(slideIndex)          //Show Slides when page is renderd for the first time
        });
    }
}

//Begin SlideShow Logic
let slideIndex = 1;
function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("mySlides");
    if (n > slides.length) { slideIndex = 1 }
    if (n < 1) { slideIndex = slides.length }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex - 1].style.display = "block";
}
//End Slideshow Logic