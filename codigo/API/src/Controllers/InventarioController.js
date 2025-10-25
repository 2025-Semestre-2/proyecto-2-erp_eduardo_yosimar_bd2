// Archivo para todo lo relacionado con los proveedores.

const db = require('../Config/db');
const sql = require('mssql');


// EndPoint para obtener los proveedores mediante filtros.
const optenerInventario = async (req, res) => {

    try {

        let { nombreProducto, grupo, cantidadMinima, cantidadMaxima  } = req.params;

        // Esto es para poder pasar convertir a null en caso de caso de que la ruta venga en 'null'.
        const procesar = (dato) => (dato === 'null' || dato === '_' || dato === '' ? null : dato);

        // console.log("Nombre producto:", procesar(nombreProducto));
        // console.log("Grupo:", procesar(grupo));
        const conec = await db;
        let resultado = await conec.request()
            .input('NombreProducto', sql.VarChar, procesar(nombreProducto))
            .input('Grupo', sql.VarChar, procesar(grupo))
            .input('CantidadMinima', sql.Int, procesar(cantidadMinima))
            .input('CantidadMaxima', sql.Int, procesar(cantidadMaxima))
            .execute('sp_ObtenerInventario');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo los productos del inventario mediante filtros.', error });
    }

};


// EndPoint para obtener un cliente especifico por su ID.
const optenerProductoPorID = async (req, res) => {

    try {

        let { productoID } = req.params;

        const conec = await db;
        let resultado = await conec.request().input('ProductID', sql.Int, productoID).execute('sp_ObtenerProductoPorID');

        res.status(200).json(resultado.recordset[0]);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo al producto por su ID.', error });
    }

};


// EndPoint para obtener un cliente especifico por su ID.
const optenerListaDeGruposPorProducto= async (req, res) => {

    try {

        let { productoID } = req.params;

        const conec = await db;
        let resultado = await conec.request().input('ProductID', sql.Int, productoID).execute('sp_ObtenerListaGruposPorProducto');

        res.status(200).json(resultado.recordset);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo la lista de grupos de un producto por su ID.', error });
    }

};



module.exports = {

    optenerInventario,
    optenerProductoPorID,
    optenerListaDeGruposPorProducto

};