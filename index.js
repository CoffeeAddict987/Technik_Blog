$(() => {
    registerComponents();
    registerPages();

    const navigation = new Navigation(navigatePage);
    navigation.render('#navigation');

    const footer = new Footer();
    footer.render('#my-footer');


    const feedbackBanner = $('.feedback-banner');
    const modal = new Modal('body');
    modal.create('Trage dein Feedback ein!', $('<h1>Test</h1><p>Dies ist mein Inhalt</p>'));
    feedbackBanner.on('click', async () => {
        modal.show();
        setTimeout(() => {
            modal.setTitle('Hey!');
        }, 5000);
    });

});

function navigatePage(id) {
    console.log('navigate to page', id);
    const pages = {
        home: new Home(),
        lectureContent: new LectureContent(),
        databaseContent: new DatabaseContent(),
        druckerContent: new DruckerContent(),
    };
    pages[id].render('#content');
}


function registerComponents() {
    const components = ['navigation', 'modal', 'footer'];
    const links = components.map((c) => $(`<script src="components/${c}/${c}.js"></script>`));
    const stylesheets = components.map((c) => $(`<link rel="stylesheet" href="components/${c}/${c}.css">`));
    $('head').prepend(links, stylesheets);
}

function registerPages() {
    const pages = ['home', 'lectureContent', 'databaseContent', 'druckerContent'];
    const links = pages.map((c) => $(`<script src="pages/${c}/${c}.js"></script>`));
    const stylesheets = pages.map((c) => $(`<link rel="stylesheet" href="pages/${c}/${c}.css">`));
    $('head').prepend(links, stylesheets);
}