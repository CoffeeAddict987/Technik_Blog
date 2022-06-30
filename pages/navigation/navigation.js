class Navigation extends Page {
  onClickCallback;
  constructor(onClick) {
    super('navigation');
    this.onClickCallback = onClick;
  }

  render(parentSelector) {
    $(parentSelector).load('./pages/navigation/navigation.html', () => {
      $('.navigation-container a').on('click', (e) => {
        this.navigateTo(e.target.id);
        if (this.onClickCallback)
          this.onClickCallback(e.target.id);
      })
      this.navigateTo('home');
      if (this.onClickCallback)
        this.onClickCallback('home');
    });
  }

  navigateTo(id) {
    $('.navigation-container a').removeClass('active');
    $(`.navigation-container a#${id}`).addClass('active');
  }

}

/*Nav-Toggle*/
function Navtoggle() {
  const toggleButton = document.getElementsByClassName('toggle-button')[0]
  const navbarLinks = document.getElementsByClassName('navbar-links')[0]
  navbarLinks.classList.toggle('active')
}
/* --- Nav-Toggle*/

/* JavaScript Date and Time */
setInterval(myTimer, 1000);

function myTimer() {
  const d = new Date();
  document.getElementById("demo").innerHTML = d.toLocaleTimeString();
  year = d.getFullYear(),
    month = d.toLocaleString('default', { month: 'long' }),
    day = d.getDate(),
    text = + day + '. ' + month + ' ' + year + ' |';
  document.getElementById('ausgabe')
    .innerHTML = text;
}
/* ---------------------------------- */
