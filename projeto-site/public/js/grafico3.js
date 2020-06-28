var ctx = document.getElementById('myChart1').getContext('2d');
    var chart_nivel = new Chart(ctx, {
        // The type of chart we want to create
        type: 'bar',

        // The data for our dataset
        data: {
            labels: [],
            datasets: [{
                label: "0% - Vazia, 25% - OK, 50% - Médio, 75% - Alta",
                backgroundColor: [],
                borderColor: '#fff',
                data: [],
            }]
        },

        // Configuration options go here
        options: {
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                        suggestedMin: 0,
                        suggestedMax: 100,    // minimum will be 0, unless there is a lower value.
                        // OR //
                        beginAtZero: true   // minimum value will be 0.
                    }
                }]
            }
        }
    });

    function atualizarGrafico() {

        fetch('/leituras/tempo-real', { cache: 'no-store' }).then(function (response) {
            if (response.ok) {
                response.json().then(function (novoRegistro) {

                    console.log(`Dados recebidos: ${JSON.stringify(novoRegistro)}`);
                    const nivel = novoRegistro.NivelTotal * 25;
                    // const min = novoRegistro.NivelTotal;
                    // const max = min + 25;
                    // const sorteio = parseInt(Math.random() * max);
                    // const nivelSort = nivel + sorteio;
                    const momento = novoRegistro.momento_grafico;
                    const self = window.chart_nivel.data.datasets[0].data;
                    const podeAdicionar = nivel !== self[self.length - 1];
                    const cor = pegaCor(nivel);
                    if (podeAdicionar) {
                        if (window.chart_nivel.data.datasets[0].data.length > 4) {
                            window.chart_nivel.data.datasets[0].data.shift();
                            window.chart_nivel.data.datasets[0].backgroundColor.shift();
                            window.chart_nivel.data.labels.shift();
                        }
                        window.chart_nivel.data.datasets[0].data.push(nivel);
                        window.chart_nivel.data.datasets[0].backgroundColor.push(cor);
                        window.chart_nivel.data.labels.push(momento);
                        window.chart_nivel.update();
                    }
                });
            } else {
                console.error('Nenhum dado encontrado ou erro na API');
                setTimeout(atualizarGrafico, 5000);
            }
        })
            .catch(function (error) {
                console.error(`Erro na obtenção dos dados p/ gráfico: ${error.message}`);
            });

    }

    function pegaCor(nivel) {
        if(nivel <= 25) return 'yellow';
        else if (nivel <= 50) return 'orange';
        else if (nivel <= 75) {return 'red'};
        return 'red';
    }

    setInterval(() => {
        atualizarGrafico();
    }, 3000);