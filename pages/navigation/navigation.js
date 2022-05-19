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

window.onload = function(){
    document.getElementById("myForm").style.display = "none";
}

function openForm() {
    document.getElementById("myForm").style.display = "block";
  }
  
  function closeForm() {
    document.getElementById("myForm").style.display = "none";
  }

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

