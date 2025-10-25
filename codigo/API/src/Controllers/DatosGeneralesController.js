// Archivo para todo lo relacionado con los proveedores.

const db = require('../Config/db');
const sql = require('mssql');


// EndPoint para obtener las facturas mediante filtros
const optenerCategoriaClientes = async (req, res) => {

    try {

        // let { numeroFactura, nombreCliente, fechaMinima, fechaMaxima, montoMinimo, montoMaximo  } = req.params;

        const conec = await db;
        let resultado = await conec.request().execute('sp_ObtenerCategoriasClientes');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo las categorias de los clientes.', error });
    }

};

const optenerCategoriProveedores = async (req, res) => {

    try {

        // let { numeroFactura, nombreCliente, fechaMinima, fechaMaxima, montoMinimo, montoMaximo  } = req.params;

        const conec = await db;
        let resultado = await conec.request().execute('sp_ObtenerCategoriasProveedores');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo las categorias de lo proveedores.', error });
    }

};

const optenerMetodosEntrega = async (req, res) => {

    try {

        // let { numeroFactura, nombreCliente, fechaMinima, fechaMaxima, montoMinimo, montoMaximo  } = req.params;

        const conec = await db;
        let resultado = await conec.request().execute('sp_ObtenerMetodosEntrega');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo los metodos de entrega disponibles.', error });
    }

};



module.exports = {

    optenerCategoriaClientes,
    optenerCategoriProveedores,
    optenerMetodosEntrega

};



