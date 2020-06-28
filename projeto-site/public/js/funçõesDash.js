verificar();

function logoff() {
    sessionStorage.clear()
    window.location.href = 'index.html'
}

function verificar(){
    let tent = sessionStorage.getItem('login_usuario_meuapp');
    if(!tent){
      window.location.href = 'login.html'   
    }
}

function alert(){
    if(count > 75){
        alerta.style.display = 'block'
    }
    else{
        alerta.style.display = 'none'
    }
}

setInterval(alert, 1000);

function aparecer(){
    desc.style.opacity = '1'
}

function sumir(){
    desc.style.opacity = '0'
}