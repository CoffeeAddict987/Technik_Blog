class Home extends Page {
    constructor() {
        super('home');
    }

    async render(parentSelector) {
       $(parentSelector).load(`./pages/${this.pageName}/${this.pageName}.html`, () => {
            showSlides(slideIndex)          //Show Slides when page is renderd for the first time
            
        });

        //Probiert, aber leider nicht ganz sauber funktioniert
        const contents = await getInterestsContent();
        const contentElements = [];
        console.log('render', contents);
        const wrapper = $('<div />', { class: '' });
        contents.forEach((content, index) => {
            const contentElement = $(`<button class="tags-container btn btn-dark btn-style">` + content.name + `</button>`);
    
                contentElement.find('.tags-container').text(content.name);
                    if (index >= contents.length - 1) {
                        $(sectionTags).empty().append(wrapper);
                    }
                //});
                contentElements.push(contentElement);
            });
            wrapper.append(contentElements);
            // $(parentSelector).empty().append(wrapper);
      
            
        
        

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