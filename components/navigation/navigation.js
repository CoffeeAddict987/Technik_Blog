class Navigation {
    onClickCallback;
    constructor(onClick) {
        this.onClickCallback = onClick;
    }

    render(parentSelector) {
        $(parentSelector).load('./components/navigation/navigation.html', () => {
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