

var ctx = document.getElementById('canvas1').getContext('2d');
var acion = new Chart(ctx, {
	type: 'line',
	data: {
		labels: [],
		datasets: [{
			label: 'Acionamentos',
			steppedLine: true,
			backgroundColor: "rgba(0, 209, 0, 0.237)",
			borderColor: "green",
			data: [],
		}]
	},
	options: {
		responsive: true,
		tooltips: {
			mode: 'index',
			intersect: false,
		},
		hover: {
			mode: 'nearest',
			intersect: true
		},
		scales: {
			yAxes: [{
				ticks: {
					min: 0,
					max: 1,
					stepSize: 1
				}
			}]
		}
	}
});

count = 0;

function atualizarGrafico1() {

	// console.log(`Dados recebidos: ${JSON.stringify(novoRegistro)}`);
	const nivel = parseInt(Math.random() * 2);
	if(nivel == 1){
		if(count < 100){
			count++;
		}
		else
		{
			count = 0;
			count++;
		}
	}
	const momento = new Date().toLocaleTimeString();
	if (window.acion.data.datasets[0].data.length > 4) {
		window.acion.data.datasets[0].data.shift();
		window.acion.data.labels.shift();
	}
	window.acion.data.datasets[0].data.push(nivel);
	window.acion.data.labels.push(momento);
	window.acion.update();
}

setInterval(() => {
	atualizarGrafico1();
}, 1000);