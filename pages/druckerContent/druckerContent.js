class DruckerContent extends Page {
    constructor() {
        super('druckerContent');
    }
    
        async render(parentSelector) {
        const tags = 2;             //Tag 2 entspricht dem Tag Drucker
        const contents = await getArticlesContentByTags(tags);
        const contentElements = [];
        console.log('render', contents);
        const wrapper = $('<div />', { class: 'database-content-wrapper' });
        contents.forEach((content, index) => {
            const contentElement = $('<div />', { class: 'database-content' });
            contentElement.load('./pages/druckerContent/druckerContent.html', () => {
                contentElement.find('.drucker-title').text(content.title);
                contentElement.find('.test').append($(`<img class="picture" src="` + content.path + `">`));
                contentElement.find('.drucker-content').text(content.content);
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

