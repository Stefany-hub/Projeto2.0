var config = {
			type: 'bar',
			data: {
				labels: ['0','1', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1'],
				datasets: [{
					label: 'Acionamentos',
                    // steppedLine: true,
					backgroundColor: "rgba(0, 209, 0, 0.537)",
					borderColor: "green",
					data: [
						"0", "1","0", "1","0", "1","0", "1","0", "1","0", "1"
					],
					fill: false,
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
                        ticks:{
                            min: 0,
                            max: 1,
                            stepSize: 1
                        }
                    }]
                }
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('canvas1').getContext('2d');
			window.myLine = new Chart(ctx, config);
		};