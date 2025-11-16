// ====================Intructivas de uso=========================
//  Se deben de utilizar los siguientes comandos para poder ejecutar las funciones basicas del API,
//  cuando se va a usar por primera vez en el dispositivo:
// npm install express 
// npm isntall cors 
// npm install dotenv
// npm install mssql
// npm i express dotenv cors mssql

// En caso de no tener instalado nodemon, puede usar el comando: npm install -g nodemon

// Una vez instalado todo, se utiliza el comando: nodemon src/Index.js   | para la inicializacion del api
// Tambien de puede usar el comando: node src/Index.js
// =================== Fin intructivos de uso =============================

// Los inports que se ocupan para el funcionamiento.
const express = require('express');
const cors = require('cors');// Para el certificado de las peticiones
require('dotenv').config(); // Para configuracion segura de variables de entorno


const app = express();

app.use(cors({
  origin: '*', 
  methods: 'GET,POST,PUT,DELETE',
  allowedHeaders: 'Content-Type,Authorization'
}));

app.use(express.json());

// Rutas especificas para los ednpoints del API
const clientes = require('./Routes/ClientesRoutes');
const proveedores = require('./Routes/ProveedoresRoutes');
const inventario = require('./Routes/InventarioRoutes');
const facturas = require('./Routes/FacturasRoutes');
const estadisticas = require('./Routes/EstadisticasRoutes');
const datosGenerales = require('./Routes/DatosGeneralesRoutes');
const sesion = require('./Routes/AutenticacionRoutes')

// // Se agregan los endpoints al servidor.
app.use('/api/clientes', clientes);
app.use('/api/proveedores', proveedores);
app.use('/api/inventario', inventario);
app.use('/api/facturas', facturas);
app.use('/api/estadisticas', estadisticas);
app.use('/api/datosGenerales', datosGenerales);
app.use('/api/sesion', sesion);



const PORT = process.env.PORT || 5000; // Puerto local de escucha
// http://localhost:5000/api/
app.listen(PORT, () => {
  console.log(`Servidor corriendo en el puerto ${PORT}`);
});