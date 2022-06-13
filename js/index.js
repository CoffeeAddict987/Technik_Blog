$(() => {
    registerPages();

    const navigation = new Navigation(navigatePage);
    navigation.render('#navigation');

    const footer = new Footer();
    footer.render('#my-footer');

});

function navigatePage(id) {
    console.log('navigate to page', id);
    const pages = {
        home: new Home(),
        blog: new Blog(),
        databaseContent: new DatabaseContent(),
        druckerContent: new DruckerContent(),
        user: new User(),
    };
    pages[id].render('#content');
}

function registerPages() {
    const pages = ['home', 'blog', 'databaseContent', 'druckerContent','footer','navigation','user'];
    const links = pages.map((c) => $(`<script src="pages/${c}/${c}.js"></script>`));
    const stylesheets = pages.map((c) => $(`<link rel="stylesheet" href="pages/${c}/${c}.css">`));
    $('head').prepend(links, stylesheets);
}

