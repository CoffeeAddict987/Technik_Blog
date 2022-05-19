class Footer {
    constructor() {
    
    }
    render(parentSelector) {
        $(parentSelector).load('./pages/footer/footer.html', () => {
           
        });
    }
}