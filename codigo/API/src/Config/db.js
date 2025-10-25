const sql = require('mssql');

const configDB = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_SERVER,
    database: process.env.DB_DATABASE,
    port: parseInt(process.env.DB_PORT),
    options: {
        encrypt: false,
        trustServerCertificate: true
    },
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 4000
    }
};

// Esperar a que se establezca la conexion con el servidor:

const conexion = new sql.ConnectionPool(configDB)
  .connect()
  .then(pool => {
    console.log('Se ha podido establecer la conexion a SQL');
    return pool;
  })
  .catch(err => {
    console.error('No se pudo conectar a SQL', err);
  });


module.exports = conexion;//sql.connect(configDB);