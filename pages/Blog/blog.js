class Blog extends Page {
    constructor() {
        super('blog');
    }


    async render(parentSelector) {

        //Hier soll Zufallsgenerator für die ID hin
        const id = 1;
        const contents = await getArticlesContentById(id); //Erster Artikel
        const contentElements = [];
        console.log('render', contents);
        const wrapper = $('<div />', { class: 'database-content-wrapper' });

        const contentElement = $('<div />', { class: 'database-content' });
            contentElement.load('./pages/databaseContent/databaseContent.html', () => {
                contentElement.find('.title2').text(contents.title);
                contentElement.find('.text2').text(contents.content);
                $(parentSelector).empty().append(wrapper);
            });
            contentElements.push(contentElement);
            wrapper.append(contentElements);

        
    
    }

    
}

