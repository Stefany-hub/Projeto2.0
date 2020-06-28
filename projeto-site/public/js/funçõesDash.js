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
    if(count <= 50){
        alerta.style.backgroundColor = 'green';
        alerta.innerHTML = `<h3>Capacidade Mínima. <br> Sua Smart-Trash está entre 0% e 25% preenchida</h3>`;
    }
    else if (count > 50 && count <= 75){
        alerta.style.backgroundColor = 'yellow';
        alerta.innerHTML = `<h3>Capacidade Média. <br> Sua Smart-Trash está estre 50% e 75% preenchida</h3>`;
    }
    else if (count > 75){
        alerta.style.backgroundColor = 'red';
        alerta.innerHTML = `<h3>Capacidade Máxima. <br> Sua Smart-Trash está acima de 75% preenchida</h3>`;
    }
}

setInterval(alert, 1000);

function aparecer(){
    desc.style.opacity = '1'
}

function sumir(){
    desc.style.opacity = '0'
}