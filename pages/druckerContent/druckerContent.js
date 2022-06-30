class DruckerContent extends Page {
    constructor() {
        super('druckerContent');
    }
    
        async render(parentSelector) {
        const tag = 2;             //Tag 2 entspricht dem Tag Drucker
        const quantity = 2;        //Entspricht 2 Artikel
        const contents = await getArticlesContentByTags(quantity, tag);
        const contentElements = [];
        console.log('render', contents);
        const wrapper = $('<div />', { class: 'database-content-wrapper' });
        contents.forEach((content, index) => {
            const contentElement = $('<div />', { class: 'database-content' });
            contentElement.load('./pages/druckerContent/druckerContent.html', () => {
                contentElement.find('.druckerTitle').text(content.title);
                contentElement.find('.druckerPicture').append($(`<img class="druckerImg" src="` + content.path + `">`));
                contentElement.find('.druckerText').text(content.content);
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

