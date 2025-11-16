const sql = require('mssql');

// const configDB = {
//     user: process.env.DB_USER,
//     password: process.env.DB_PASSWORD,
//     server: process.env.DB_SERVER,
//     database: process.env.DB_DATABASE,
//     port: parseInt(process.env.DB_PORT),
    // options: {
    //     encrypt: false,
    //     trustServerCertificate: true
    // },
    // pool: {
    //     max: 10,
    //     min: 0,
    //     idleTimeoutMillis: 4000
    // }
// };


const configs = {
  sanjose: {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD_SANJOSE,
    server: process.env.DB_SERVER_SANJOSE,
    database: process.env.DB_DATABASE_SANJOSE,
    port: parseInt(process.env.DB_PORT_SANJOSE),
        options: {
        encrypt: false,
        trustServerCertificate: true
    },
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 6000
    }
  },
  limon: {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD_LIMON,
    server: process.env.DB_SERVER_LIMON,
    database: process.env.DB_DATABASE_LIMON,
    port: parseInt(process.env.DB_PORT_LIMON),
        options: {
        encrypt: false,
        trustServerCertificate: true
    },
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 6000
    }
  },
  corporativo: {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD_CORP,
    server: process.env.DB_SERVER_CORP,
    database: process.env.DB_DATABASE_CORP,
    port: parseInt(process.env.DB_PORT_CORP),
        options: {
        encrypt: false,
        trustServerCertificate: true
    },
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 6000
    }
  }
};




// Esperar a que se establezca la conexion con el servidor:

// const conexion = new sql.ConnectionPool(configDB)
//   .connect()
//   .then(pool => {
//     console.log('Se ha podido establecer la conexion a SQL');
//     return pool;
//   })
//   .catch(err => {
//     console.error('No se pudo conectar a SQL', err);
//   });

// const sql = require('mssql');

async function establecerConexion(dbKey) {
  const config = configs[dbKey];
  if (!config) throw new Error(`No existe configuración para ${dbKey}`);

  // Si ya existe un pool conectado, lo reutilizamos
  if (pools[dbKey]) {
    return pools[dbKey];
  }

  try {
    const pool = await new sql.ConnectionPool(config).connect();
    console.log(`Conectado a ${dbKey}`);
    pools[dbKey] = pool; // Guardamos el pool para reutilizarlo
    return pool;
    
  } catch (err) {
    console.error(`Error conectando a ${dbKey}`, err);
    throw err;
  }
}


module.exports = { establecerConexion };//conexion;//sql.connect(configDB);