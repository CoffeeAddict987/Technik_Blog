class Blog extends Page {
    constructor() {
        super('blog');
    }


    async render(parentSelector) {
        const contents = await getDatabaseContent();
        const contentElements = [];
        console.log('render', contents);
        const wrapper = $('<div />', { class: 'database-content-wrapper' });
        contents.forEach((content, index) => {
            const contentElement = $('<div />', { class: 'database-content' });
            contentElement.load('./pages/databaseContent/databaseContent.html', () => {
                contentElement.find('.title2').text(content.id);
                contentElement.find('.text2').text(content.name);
                if (index >= contents.length - 1) {
                    $(parentSelector).empty().append(wrapper);
                }
            });
            contentElements.push(contentElement);
        });
        wrapper.append(contentElements);
        // $(parentSelector).empty().append(wrapper);
    }

    
}

