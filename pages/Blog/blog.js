class Blog extends Page {
    constructor() {
        super('blog');
    }

    async render(parentSelector) {
        const tag = randomIntFromInterval(1, 9);
        const quantity = 1;
        const contents = await getArticlesContentByTags(quantity, tag);
        const contentElements = [];
        console.log('render', tag, contents);
        const wrapper = $('<div />', { class: 'database-content-wrapper' });
        contents.forEach((content, index) => {
            const contentElement = $('<div />', { class: 'database-content' });
            contentElement.load('./pages/Blog/blog.html', () => {
                contentElement.find('.blogTitle').text(content.title);
                contentElement.find('.blogPicture').append($(`<img class="blogImg" src="` + content.path + `">`));
                contentElement.find('.blogText').text(content.content);
                if (index >= contents.length - 1) {
                    $(parentSelector).empty().append(wrapper);
                }
            });
            contentElements.push(contentElement);
        });
        wrapper.append(contentElements);
    }

}

function randomIntFromInterval(min, max) { // min and max included 
    return Math.floor(Math.random() * (max - min + 1) + min)
}
