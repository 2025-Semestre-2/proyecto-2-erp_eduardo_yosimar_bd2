// Archivo para todo lo relacionado con los proveedores.

const db = require('../Config/db');
const sql = require('mssql');


// EndPoint para obtener los proveedores mediante filtros
const optenerProveedores = async (req, res) => {

    try {

        let { nombreProveedor, categoria, metodoEntrega  } = req.params;

        // Esto es para poder pasar convertir a null en caso de caso de que la ruta venga en 'null'.
        const procesar = (dato) => (dato === 'null' || dato === '_' || dato === '' ? null : dato);

        const conec = await db;
        let resultado = await conec.request()
            .input('NombreProveedor', sql.VarChar, procesar(nombreProveedor))
            .input('Categoria', sql.VarChar, procesar(categoria))
            .input('MetodoEntrega', sql.VarChar, procesar(metodoEntrega))
            .execute('sp_ObtenerProveedores');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo los proveedores mediante filtros.', error });
    }

};


// EndPoint para obtener un cliente especifico por su ID.
const optenerProveedorPorID = async (req, res) => {

    try {

        let { proveedorID } = req.params;

        const conec = await db;
        let resultado = await conec.request().input('ProveedorID', sql.Int, proveedorID).execute('sp_ObtenerProveedorPorID');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo al proveedor por su ID.', error });
    }

};

module.exports = {

    optenerProveedores,
    optenerProveedorPorID

};