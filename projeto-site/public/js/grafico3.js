var ctx = document.getElementById('myChart').getContext('2d');
    var chart_nivel = new Chart(ctx, {
        // The type of chart we want to create
        type: 'bar',

        // The data for our dataset
        data: {
            labels: [],
            datasets: [{
                label: "0% - Vazia, 25% - OK, 50% - Médio, 75% - Alta",
                backgroundColor: ['green', 'yellow', 'orange', 'red'],
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
                    const momento = novoRegistro.momento_grafico;
                    const self = window.chart_nivel.data.datasets[0].data;
                    const podeAdicionar = nivel !== self[self.length - 1];
                    if (podeAdicionar) {
                        if (window.chart_nivel.data.datasets[0].data.length > 4) {
                            window.chart_nivel.data.datasets[0].data.shift();
                            window.chart_nivel.data.labels.shift();
                        }
                        window.chart_nivel.data.datasets[0].data.push(nivel);
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

    setInterval(() => {
        atualizarGrafico();
    }, 3000);