// Archivo para todo lo relacionado con los clientes.

const db = require('../Config/db');
const sql = require('mssql');


// EndPoint para obtener los clientes mediante filtros
const optenerClientes = async (req, res) => {

    try {

        let { nombreCliente, categoria, metodoEntrega  } = req.params;

        // Esto es para poder pasar convertir a null en caso de caso de que la ruta venga en 'null'.
        const procesar = (dato) => (dato === 'null' || dato === '_' || dato === '' ? null : dato);


        const conec = await db;
        let resultado = await conec.request()
            .input('NombreCliente', sql.VarChar, procesar(nombreCliente))
            .input('Categoria', sql.VarChar, procesar(categoria))
            .input('MetodoEntrega', sql.VarChar, procesar(metodoEntrega))
            .execute('sp_ObtenerClientes');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo los clientes mediante filtros.', error });
    }

};


// EndPoint para obtener un cliente especifico por su ID.
const optenerClientePorID = async (req, res) => {

    try {

        let { clienteID } = req.params;

        const conec = await db;
        let resultado = await conec.request().input('ClienteID', sql.Int, clienteID).execute('sp_ObtenerClientePorID');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo al cliente.', error });
    }

};

module.exports = {

    optenerClientePorID,
    optenerClientes

};