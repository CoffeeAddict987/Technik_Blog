class Home extends Page {
    constructor() {
        super('home');
    }

    async render(parentSelector) {
       $(parentSelector).load(`./pages/${this.pageName}/${this.pageName}.html`, () => {
            showSlides(slideIndex)          //Show Slides when page is renderd for the first time
            
        });

    load_dynamicTags();
    load_dynamicMainContent();
    }
}


async function load_dynamicTags(){
    const contents = await getInterestsContent();
    const contentElements = [];
    console.log('render', contents);
    const wrapper = $('<div />', { class: '' });
        contents.forEach((content, index) => {
            const contentElement = $(`<button class="tags-container btn btn-dark btn-style">` + content.name + `</button>`);
                    if (index >= contents.length - 1) {
                        $(sectionTags).empty().append(wrapper);
                    }
                contentElements.push(contentElement);
            });
        wrapper.append(contentElements);
}


async function load_dynamicMainContent(){
    const tags = 2;             //Tag 2 entspricht dem Tag Drucker
    const contents = await getArticlesContentByTags(2, tags);
    const contentElements = [];
    console.log('render', contents);
    const wrapper = $('<div />', { class: '' });
        contents.forEach((content, index) => {
            const contentElement = $(`<tr class="blog-element">
            <td class="blog-element-picture">
                <div class="blogtitel-table">` + content.title + ` </div>
                <img src="`+ content.path + `"></td>
            <td class="blog-element-text">
                <p>` + content.content + `</p>
            </td>
            </tr>`);
                    if (index >= contents.length - 1) {
                        $(tableMainContent).empty().append(wrapper);
                    }
                contentElements.push(contentElement);
            });
        wrapper.append(contentElements);
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