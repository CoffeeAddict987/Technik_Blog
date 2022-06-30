class ComputerContent extends Page {
    constructor() {
        super('computerContent');
    }

    async render(parentSelector) {
        const tag = 1;             //Tag 1 = computer Tag
        const quantity = 2;        //2 Articles
        const contents = await getArticlesContentByTags(quantity, tag);
        const contentElements = [];
        console.log('render', contents);
        const wrapper = $('<div />', { class: 'database-content-wrapper' });
        contents.forEach((content, index) => {
            const contentElement = $('<div />', { class: 'database-content' });
            contentElement.load('./pages/computerContent/computerContent.html', () => {
                contentElement.find('.computerTitle').text(content.title);
                contentElement.find('.computerPicture').append($(`<img class="computerImg" src="` + content.path + `">`));
                contentElement.find('.computerText').text(content.content);
                if (index >= contents.length - 1) {
                    $(parentSelector).empty().append(wrapper);
                }
            });
            contentElements.push(contentElement);
        });
        wrapper.append(contentElements);
    }

}
