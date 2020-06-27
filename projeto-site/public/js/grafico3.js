var ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'doughnut',

        // The data for our dataset
        data: {
            labels: ["Nível 0 - Vazia", "Nível 1 - OK", "Nível 2 - Médio", "Nível 3 - Cheia"],
            datasets: [{
                label: "My First dataset",
                backgroundColor: ['green', 'yellow', 'orange', 'red'],
                borderColor: '#fff',
                data: [25,25,25,25],
            }]
        },

        // Configuration options go here
        options: {
            circumference: 1 * Math.PI,
            rotation: 1 * Math.PI,
            cutoutPercentage: 80
        }
    });
