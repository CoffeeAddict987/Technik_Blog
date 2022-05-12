class Footer {
    constructor() {
    
    }
    render(parentSelector) {
        $(parentSelector).load('./components/footer/footer.html', () => {
           
        });
    }
}