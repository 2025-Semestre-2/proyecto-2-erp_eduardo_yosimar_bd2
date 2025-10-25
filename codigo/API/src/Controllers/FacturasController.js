// Archivo para todo lo relacionado con los proveedores.

const db = require('../Config/db');
const sql = require('mssql');


// EndPoint para obtener las facturas mediante filtros
const optenerFacturas = async (req, res) => {

    try {

        let { numeroFactura, nombreCliente, fechaMinima, fechaMaxima, montoMinimo, montoMaximo  } = req.params;

        // Esto es para poder pasar convertir a null en caso de caso de que la ruta venga en 'null'.
        const procesar = (dato) => (dato === 'null' || dato === '_' || dato === '' ? null : dato);

        const conec = await db;
        let resultado = await conec.request()
            .input('NumeroFactura', sql.Int, procesar(numeroFactura))
            .input('NombreCliente', sql.VarChar, procesar(nombreCliente))
            .input('FechaMinima', sql.Date, procesar(fechaMinima))
            .input('FechaMaxima', sql.Date, procesar(fechaMaxima))
            .input('MontoMinimo', sql.Int, procesar(montoMinimo))
            .input('MontoMaximo', sql.Int, procesar(montoMaximo))
            .execute('sp_ObtenerFacturas');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo los productos del inventario mediante filtros.', error });
    }

};


// EndPoint para obtener un cliente especifico por su ID.
const optenerFacturaPorID = async (req, res) => {

    try {

        let { numeroFactura } = req.params;

        const conec = await db;
        let resultado = await conec.request().input('NumeroFactura', sql.Int, numeroFactura).execute('sp_ObtenerFacturaPorID');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo la factura por su ID.', error });
    }

};


// EndPoint para obtener un cliente especifico por su ID.
const optenerDetallesPorFactura = async (req, res) => {

    try {

        let { numeroFactura } = req.params;

        const conec = await db;
        let resultado = await conec.request().input('NumeroFactura', sql.Int, numeroFactura).execute('sp_ObtenerDetalleFacturaPorID');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo los de talles de una factura por su ID.', error });
    }

};



module.exports = {

    optenerFacturas,
    optenerFacturaPorID,
    optenerDetallesPorFactura

};



