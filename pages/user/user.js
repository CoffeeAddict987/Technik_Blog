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
    document.getElementById('inp').innerHTML = old + "<b>Passwort bestätigen</b> <input type='password' minlength='4' placeholder='Repeat Password' name='repeat' value='' class='form-input' id='password-repeat' required/><br>"; 
    document.getElementById('reg-btn').innerHTML = "<button type='submit' class='btn' onclick='checkPassword()'  id='reg-btn'>Registrieren</button>";
    InputObj = document.getElementById('registration');
    document.getElementById('myLoginForm').removeChild(InputObj);
    InputObj2 = document.getElementById('login-btn');
    document.getElementById('myLoginForm').removeChild(InputObj2);

} 

function checkPassword()
{
    var pw1 = document.getElementById("password").value;
    var pw2 = document.getElementById("password-repeat").value;

    if (pw1 != pw2)
    {
        alert("Passwörter müssen gleich sein!")
        document.getElementById("password").focus();
        return false;
    }

    return true;
}


  
  
  


  

  