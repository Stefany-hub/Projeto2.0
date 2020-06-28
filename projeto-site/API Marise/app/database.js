const configuracoes = {
    banco: {
        server: "serverprojetomit.database.windows.net",
        user: "adminlocal",
        password: "#GfMIT2.0",
        database: "bdprojetomit",
        options: {
            enableArithAbort: true,
            encrypt: true
        },
        pool: {
            max: 4,
            min: 1,
            idleTimeoutMillis: 30000,
            connectionTimeout: 5000
        }
    }
}
 
const sql = require('mssql');
sql.on('error', err => {
    console.error(`Erro de Conexão: ${err}`);
});


function connection() {
//   sql.close();
  return sql.connect(configuracoes.banco)
} 

module.exports = {
    connection: connection,
    sql: sql
}