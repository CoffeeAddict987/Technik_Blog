class Blog extends Page {
    constructor() {
        super('blog');
    }


    render(parentSelector) {
        const contents = getDatabaseContent();
        console.log(contents);
        
    }
    
}

