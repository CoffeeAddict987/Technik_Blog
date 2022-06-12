class User extends Page {
    constructor() {
        super('user');
    }

    render(parentSelector) {
        $(parentSelector).load(`./pages/${this.pageName}/${this.pageName}.html`, () => {
            const form = $('#myLoginForm');
            form.on('submit', (e) => {
                e.preventDefault();
          
                const formData = form.serializeArray().reduce((prevValue, currentValue)=> ({
                    ...prevValue, // alle Eigenschaften des vorherigen Objektes in neues Objekt übernehmen
                    ["name"]:  "",
                    [currentValue.name]:  currentValue.value,
                }), {}); // {} entspricht einem leeren Objekt als Startwert
                console.log(formData);
          
            })
        });
    }
}

function addInput() { 
    var old = document.getElementById('inp').innerHTML; 
    document.getElementById('inp').innerHTML = old + "<b>Passwort bestätigen</b> <input type='password' placeholder='Repeat Password' name='repeat' value='' required/><br>"; 
    document.getElementById('login-btn').innerHTML = "Registrieren";
    InputObj = document.getElementById('registration');
    document.getElementById('myLoginForm').removeChild(InputObj);
} 



  
  
  


  

  