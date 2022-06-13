

class DatabaseContent extends Page {
    constructor() {
        super('databaseContent');
    }

    render(parentSelector) {
        const contents = getDatabaseContent();
        const contentElements = [];
        console.log('render', contents);
        const wrapper = $('<div />', { class: 'database-content-wrapper'  });
        contents.forEach(content => {
            const contentElement = $('<div />', { class:  'database-content'  });
            contentElement.load('./pages/databaseContent/databaseContent.html', () => {
                contentElement.find('.title2').text(content.title),
                contentElement.find('.text2').text(content.text);
            });
            contentElements.push(contentElement);
        });
        wrapper.append(contentElements);
        $(parentSelector).empty().append(wrapper);
        
    }
}
