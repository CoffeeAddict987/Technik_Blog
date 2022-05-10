class Modal {
    // private variables
    #parent;
    #parentJs;
    #modal;
    #titleElement;
    #contentElement;

    constructor(parentSelector) {
        this.#parent = $(parentSelector);
        this.#parentJs = document.querySelector(parentSelector);
        this.#modal = $('.modal-overlay');
        $('head').append('<link rel="stylesheet" href="./components/modal/modal.css" />');
    }

    create(title = 'Title', content = 'Content') {
        console.log('creating modal');
        if (!this.#parent) return;
        const modalOverlay = $('<div />', { class: 'modal-overlay' });
        modalOverlay.on('click', (e) => {
            if (e.target === e.currentTarget) {
                this.hide();
            }
        });
        modalOverlay.load('./components/modal/modal.html', () => {
            this.#titleElement = modalOverlay.find('.modal-title');
            this.#contentElement = modalOverlay.find('.content-container');
            this.setContent(content);
            this.setTitle(title);
            this.#parent.prepend(modalOverlay);
            this.#modal = modalOverlay;
        });
    }

    setTitle(title) {
        this.#titleElement.text(title);
    }

    setContent(content) {
        this.#contentElement.empty().append(content);
    }

    async createWithJs() {
        console.log(await (await fetch('./components/modal/modal.html')).text());
        const modalOverlay = document.createElement('div');
        modalOverlay.className = 'modal-overlay';
        modalOverlay.addEventListener('click', (e) => {
            if (e.target === e.currentTarget) {
                this.hide();
            }
        });
        modalOverlay.innerHTML = await (await fetch('./components/modal/modal.html')).text();
        this.#parentJs.prepend(modalOverlay);
        this.#modal = $('.modal-overlay');
    }

    show() {
        console.log('showing modal');
        if (!this.#modal) return;
        this.#modal.addClass('visible');
    }

    hide() {
        console.log('hiding modal');
        if (!this.#modal) return;
        this.#modal.removeClass('visible');
    }

    toggle() {
        console.log('toggle modal');
        if (!this.#modal) return;
        this.#modal.toggleClass('visible');
    }
}