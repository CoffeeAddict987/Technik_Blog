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
  const links = components.map((c) => $(`<script src="../components/${c}/${c}.js"></script>`));
  const stylesheets = components.map((c) => $(`<link rel="stylesheet" href="../components/${c}/${c}.css">`));
  $('head').prepend(links, stylesheets);
}

function registerPages() {
  const pages = ['home', 'lectureContent', 'databaseContent', 'druckerContent'];
  const links = pages.map((c) => $(`<script src="../pages/${c}/${c}.js"></script>`));
  const stylesheets = pages.map((c) => $(`<link rel="stylesheet" href="../pages/${c}/${c}.css">`));
  $('head').prepend(links, stylesheets);
}

const getDatabaseContent = () => {
  const content = [];
  for(let i = 0; i < 15; i++) {
      content.push({
          id: i,
          title: `Element ${i}`,
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vestibulum nunc enim, in placerat dui finibus sed. Pellentesque eleifend orci quis feugiat ultricies. Sed congue, ex nec posuere luctus, purus diam elementum lacus, et consectetur mauris neque eu nisl. Sed sapien nisl, feugiat et dictum eu, commodo sit amet ante. Suspendisse accumsan tincidunt sapien, id ullamcorper lacus ullamcorper vitae. Cras iaculis lectus massa, eget porttitor lectus placerat eget. Suspendisse sollicitudin nulla a felis luctus varius. Mauris laoreet mi nisl, a scelerisque ipsum condimentum et. Ut sagittis diam id nisi dictum blandit. Suspendisse potenti. Nulla laoreet blandit laoreet. Quisque molestie a turpis id egestas. Sed accumsan ultricies dictum. Sed interdum non neque id aliquam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc posuere placerat sapien vel gravida.',
      });
  }  
  return content;
};