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

  /* Form to JSON Login Form 
  $(() => {
    const form = $('#myLogin');
    const button = $('#btn');
    form.on('submit', (e) => {
        e.preventDefault();
  
        const formData = form.serializeArray().reduce((prevValue, currentValue)=> ({
            ...prevValue, // alle Eigenschaften des vorherigen Objektes in neues Objekt übernehmen
            ["id"]:   'id' + (new Date()).getTime(),
            [currentValue.name]:  currentValue.value,
        }), {}); // {} entspricht einem leeren Objekt als Startwert
        console.log(formData);
  
    })
    button.on('click', (e) =>{
        var uniq = 'id' + (new Date()).getTime();
        console.log(uniq);
    })
  
  }); */
  
  


/*Nav-Toggle*/
  function Navtoggle(){
    const toggleButton = document.getElementsByClassName('toggle-button')[0]
    const navbarLinks = document.getElementsByClassName('navbar-links')[0]
    navbarLinks.classList.toggle('active')
  }


/* --- Nav-Toggle*/


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
