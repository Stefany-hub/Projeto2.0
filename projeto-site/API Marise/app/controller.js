const express = require('express');
const { ArduinoDataTemp } = require('./newserial')
const { ArduinoDataHumidity } = require('./serialHumidity')
const { ArduinoDataSwitch } = require('./serialSwitch')
const { ArduinoDataLuminosity} = require('./serialLuminosidity')
const db = require('./database')
const router = express.Router();


router.get('/', (request, response, next) => {

    let sum = ArduinoDataTemp.List.reduce((a, b) => a + b, 0);
    let average = (sum / ArduinoDataTemp.List.length).toFixed(2);
	let sumHour = ArduinoDataTemp.ListHour.reduce((a, b) => a + b, 0);
	let averageHour = (sumHour / ArduinoDataTemp.ListHour.length).toFixed(2);
    
    response.json({
        data: ArduinoDataTemp.List,
        total: ArduinoDataTemp.List.length,
        average: isNaN(average) ? 0 : average,
		dataHour: ArduinoDataTemp.ListHour,
		totalHour: ArduinoDataTemp.ListHour.length,
		averageHour: isNaN(averageHour) ? 0 : averageHour
    });

});

router.get('/humidity', (request, response, next) => {

    let sum = ArduinoDataHumidity.List.reduce((a, b) => a + b, 0);
    let average = (sum / ArduinoDataHumidity.List.length).toFixed(2);
	let sumHour = ArduinoDataHumidity.ListHour.reduce((a, b) => a + b, 0);
	let averageHour = (sumHour / ArduinoDataHumidity.ListHour.length).toFixed(2);

    response.json({
        data: ArduinoDataHumidity.List,
        total: ArduinoDataHumidity.List.length,
        average: isNaN(average) ? 0 : average,
		dataHour: ArduinoDataHumidity.ListHour,
		totalHour: ArduinoDataHumidity.ListHour.length,
		averageHour: isNaN(averageHour) ? 0 : averageHour
    });

});

router.get('/switch', (request, response, next) => {

    let sum = ArduinoDataSwitch.List.reduce((a, b) => a + b, 0);
    let average = (sum / ArduinoDataSwitch.List.length).toFixed(2);
	let sumHour = ArduinoDataSwitch.ListHour.reduce((a, b) => a + b, 0);
	let averageHour = (sumHour / ArduinoDataSwitch.ListHour.length).toFixed(2);

    response.json({
        data: ArduinoDataSwitch.List,
        total: ArduinoDataSwitch.List.length,
        average: isNaN(average) ? 0 : average,
		dataHour: ArduinoDataSwitch.ListHour,
		totalHour: ArduinoDataSwitch.ListHour.length,
		averageHour: isNaN(averageHour) ? 0 : averageHour
    });

});

router.get('/luminosity', (request, response, next) => {

    let sum = ArduinoDataLuminosity.List.reduce((a, b) => a + b, 0);
    let average = (sum / ArduinoDataLuminosity.List.length).toFixed(2);
	let sumHour = ArduinoDataLuminosity.ListHour.reduce((a, b) => a + b, 0);
	let averageHour = (sumHour / ArduinoDataLuminosity.ListHour.length).toFixed(2);

    response.json({
        data: ArduinoDataLuminosity.List,
        total: ArduinoDataLuminosity.List.length,
        average: isNaN(average) ? 0 : average,
		dataHour: ArduinoDataLuminosity.ListHour,
		totalHour: ArduinoDataLuminosity.ListHour.length,
		averageHour: isNaN(averageHour) ? 0 : averageHour
    });

    function agora(){
        const momento_atual = new Date();
        const retorno = `${momento_atual.toLocaleDateString()} ${momento_atual.toLocaleTimeString()}`;
        return retorno;
    }
    
let contador = 0;
let nivel = 0;
router.post('/sendData', (request, response) => {


    // temperature = ArduinoDataTemp.List[ArduinoDataTemp.List.length -1];
    // Humidity = ArduinoDataHumidity.List[ArduinoDataHumidity.List.length -1];
    //luminosidade = ArduinoDataLuminosity.List[ArduinoDataLuminosity.List.length -1]
    // Switch = ArduinoDataSwitch.List[ArduinoDataSwitch.List.length -1];
    const Switch = parseInt(Math.random()*2);

    // var sql = `INSERT into StatusSensor (NivelTotal, DataHora, Lixeira_idLixeira) VALUES (?, CONVERT(Datetime, '${agora()}', 120), '1');`
    // var values = [
    //   "0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1"
    // ];

    // db.connection().then(() => {
    //     for (i = 0; i < values.length; i++) {
    //         db.sql.query(`INSERT into StatusSensor (NivelTotal, DataHora, Lixeira_idLixeira) VALUES (${values[i]}, CONVERT(Datetime, '${agora()}', 120), '1');`)
    //         .catch(erro => {
    //             console.log('Erro: ' + erro)
    //         });
    //       }
    // }).catch(erro => {
    //     console.error(`Erro ao tentar registrar aquisição na base: ${erro}`);
    // });


const registros_mantidos_tabela_leitura = 8;
// função que recebe valores de temperatura e umidade
// e faz um insert no banco de dados
    console.log('\nIniciando inclusão de novo registro...');
    console.log(`Contador: ${contador}`)
    
    db.connection().then(() => {

        if (Switch) {
            console.log("Funcionando")
            contador++;
            if (contador < 10) {
                nivel = 0;
                console.log(nivel)
            } else if (contador < 40) {
                nivel = 1;
                console.log(nivel)
            } else if (contador < 70) {
                nivel = 2;
                console.log(nivel)
            } else if (contador < 100) {
                nivel = 3;
                console.log(nivel)
            } else {
                contador = 0;
            }
        }
        return db.sql.query(`INSERT into StatusSensor (NivelTotal, DataHora, Lixeira_idLixeira) 
        VALUES (${nivel}, CONVERT(Datetime, '${agora()}', 120), '1');
        
        delete from StatusSensor where idMovimentacao not in 
        (select top ${registros_mantidos_tabela_leitura} idMovimentacao from StatusSensor order by idMovimentacao desc);`)
            .then(() => {
                console.log('Registro inserido com sucesso!');
            });


    })
    .catch(erro => {

        console.error(`Erro ao tentar registrar aquisição na base: ${erro}`);

    })
    .finally(() => {
        db.sql.close();
    });

    response.sendStatus(200);
});
});

module.exports = router, Switch;