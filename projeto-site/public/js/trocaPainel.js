function troca(){
        areaMapa.style.animation = 'trocarMapa 1s linear 1';
        areaDash.style.animation = 'trocarDash 1s linear 1';
        setTimeout(() => {
            alerta.style.display = 'block' 
        }, 1500);
        setTimeout(() => {
            areaMapa.style.right = '1030px';
            areaDash.style.right = '0px';
        }, 900);
    }

function voltar(){
    areaMapa.style.animation = 'voltarMapa 1s linear 1';
    areaDash.style.animation = 'voltarDash 1s linear 1';
    alerta.style.display = 'none'
    setTimeout(() => {
        areaMapa.style.right = '0px';
        areaDash.style.right = '-1030px';
    }, 900);
}

// segundo dash

function troca2(){
        areaMapa.style.animation = 'trocarMapa2 1s linear 1';
        areaDash2.style.animation = 'trocarDash2 1s linear 1';
        setTimeout(() => {
            areaMapa.style.right = '-1030px';
            areaDash2.style.right = '0px';
        }, 900);
    }

function voltar2(){
    areaMapa.style.animation = 'voltarMapa2 1s linear 1';
    areaDash2.style.animation = 'voltarDash2 1s linear 1';
    setTimeout(() => {
        areaMapa.style.right = '0px';
        areaDash2.style.right = '1030px';
    }, 900);
}