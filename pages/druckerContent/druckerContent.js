class DruckerContent extends Page {
    constructor() {
        super('druckerContent');
    }

    async render(parentSelector) {
        const tag = 2;             //Tag 2 = printer Tag
        const quantity = 2;        //2 Articles
        const contents = await getArticlesContentByTags(quantity, tag);
        const contentElements = [];
        console.log('render', contents);
        const wrapper = $('<div />', { class: 'database-content-wrapper' });
        contents.forEach((content, index) => {
            const contentElement = $('<div />', { class: 'database-content' });
            contentElement.load('./pages/druckerContent/druckerContent.html', () => {
                contentElement.find('.articlesTitle').text(content.title);
                contentElement.find('.articlesPicture').append($(`<img class="articlesImg" src="` + content.path + `">`));
                contentElement.find('.articlesText').text(content.content);
                if (index >= contents.length - 1) {
                    $(parentSelector).empty().append(wrapper);
                }
            });
            contentElements.push(contentElement);
        });
        wrapper.append(contentElements);
    }

}

