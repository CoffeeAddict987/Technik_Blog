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


/* Pop-Up Forms Javascript*/
window.onload = function(){
    document.getElementById("myLoginForm").style.display = "none";
    document.getElementById("myRegForm").style.display = "none";

}

function openLoginForm() {
    document.getElementById("myLoginForm").style.display = "block";
  }
  
  function closeLoginForm() {
    document.getElementById("myLoginForm").style.display = "none";
  }

  function openRegForm() {
    document.getElementById("myRegForm").style.display = "block";
  }
  
  function closeRegForm() {
    document.getElementById("myRegForm").style.display = "none";
  }
  function Navtoggle(){
    const toggleButton = document.getElementsByClassName('toggle-button')[0]
    const navbarLinks = document.getElementsByClassName('navbar-links')[0]
    navbarLinks.classList.toggle('active')
  }

  /* Form to JSON */
  $(() => {
    const form = $('#form');
    /* Date_test */ 
    form.on('submit', (e) => {
        e.preventDefault();
        const formData = form.serializeArray().reduce((prevValue, currentValue)=> ({
            ...prevValue, // alle Eigenschaften des vorherigen Objektes in neues Objekt übernehmen
            [currentValue.name]: currentValue.value,
        }), {}); // {} entspricht einem leeren Objekt als Startwert
        console.log(formData);
    })
});
/* --- Pop-Up Forms Javascript*/


/* JavaScript für Datum und Zeit */
setInterval(myTimer, 1000);
		
function myTimer() {
  const d = new Date();
  document.getElementById("demo").innerHTML = d.toLocaleTimeString();
  year = d.getFullYear(),
  month = d.toLocaleString('default', { month: 'long'}),
  day = d.getDate(),
  text = + day + '. ' + month + ' ' + year + ' |';
  document.getElementById('ausgabe')
  .innerHTML = text;

}

/* ---------------------------------- */
