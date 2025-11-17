// Archivo para todo lo relacionado con los proveedores.

const db = require('../Config/db');
const sql = require('mssql');


// EndPoint para obtener las facturas mediante filtros
const optenerPromedioDeCompraProveedores = async (req, res) => {

    try {

        let { nombreProveedor, categoria, sucursal} = req.params;

        // Esto es para poder pasar convertir a null en caso de caso de que la ruta venga en 'null'.
        const procesar = (dato) => (dato === 'null' || dato === '_' || dato === '' ? null : dato);

        const pool = await establecerConexion(procesar(sucursal));
        let resultado = await pool.request()
            .input('NombreProveedor', sql.VarChar, procesar(nombreProveedor))
            .input('Categoria', sql.VarChar, procesar(categoria))
            .input('Sucursal', sql.VarChar, procesar(sucursal))
            .execute('sp_EstadisticasDeComprasPorProveedor_Consolidado');

        // Agrupar los elementos por clave.
        const datosProcesador = agruparPorClave(resultado.recordset, "NombreProveedor");

        res.status(200).json(datosProcesador);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo las estadisticas de compra por proveedor', error });
    }

};


// EndPoint para obtener un cliente especifico por su ID.
const optenerPromedioDeVentasPorCliente = async (req, res) => {

    try {

        let { nombreCliente, categoria, sucursal } = req.params;

        // Esto es para poder pasar convertir a null en caso de caso de que la ruta venga en 'null'.
        const procesar = (dato) => (dato === 'null' || dato === '_' || dato === '' ? null : dato);


        const pool = await establecerConexion(procesar(sucursal));
        let resultado = await pool.request()
            .input('NombreCliente', sql.VarChar, procesar(nombreCliente))
            .input('CategoriaCliente', sql.VarChar, procesar(categoria))
            .input('Sucursal', sql.VarChar, procesar(sucursal))
            .execute('sp_EstadisticasVentasPorCliente_Consolidado');

        // Agrupar los elementos por clave.
        const datosProcesador = agruparPorClave(resultado.recordset, 'NombreCliente');

        res.status(200).json(datosProcesador);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo las estadisticas de compra por cliente', error });
    }

};


// EndPoint para obtener un cliente especifico por su ID.
const optenerTopGananciaProductosPorAnio = async (req, res) => {

    try {

        let { anioInicio, anioFin, sucursal } = req.params;

        const pool = await establecerConexion(procesar(sucursal));
        let resultado = await pool.request()
            .input('AnioInicio', sql.Int, anioInicio)
            .input('AnioFin', sql.Int, anioFin)
            .input('Sucursal', sql.VarChar, sucursal)
            .execute('sp_TopProductosPorGananciaPorAnio_Consolidado');

        // Agrupar los elementos por clave.
        const datosProcesador = agruparPorClave(resultado.recordset, 'Anio')

        res.status(200).json(datosProcesador);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo el top de ganancia por producto por año.', error });
    }
};

const optenerTopCantPedidoPorClientePorAnio = async (req, res) => {

    try {

        let { anioInicio, anioFin, sucursal } = req.params;

        const pool = await establecerConexion(procesar(sucursal));
        let resultado = await pool.request()
            .input('AnioInicio', sql.Int, anioInicio)
            .input('AnioFin', sql.Int, anioFin)
            .input('Sucursal', sql.VarChar, sucursal)
            .execute('sp_TopClientesPorPedidosPorAnio_Consolidado');

        // Agrupar los elementos por clave.
        const datosProcesador = agruparPorClave(resultado.recordset, 'Anio')

        res.status(200).json(datosProcesador);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo el top de facturas emitidas por cliente.', error });
    }
};

const optenerTopCantPedidoPorProveedorPorAnio= async (req, res) => {

    try {

        let { anioInicio, anioFin, sucursal } = req.params;

        const pool = await establecerConexion(procesar(sucursal));
        let resultado = await pool.request()
            .input('AnioInicio', sql.Int, anioInicio)
            .input('AnioFin', sql.Int, anioFin)
            .input('Sucursal', sql.VarChar, sucursal)
            .execute('sp_TopProveedoresPorOrdenesPorAnio_Consolidado');

        // Agrupar los elementos por clave.
        const datosProcesador = agruparPorClave(resultado.recordset, 'Anio');


        res.status(200).json(datosProcesador);
        
    } catch (error) {
        res.status(500).json({ message: 'Error obteniendo el top de pedido por proveedor por año.', error });
    }
};

/**
 * Nombre: agruparPorClave
 * 
 * Descripcion: Funcion para agrupar elementos de una lista de objetos, los elementos que tengan una clave en comun sera agruapdos en un nuevo objeto que tiene
 *  una lista de los elmentos que tienen esa clave.
 * 
 * @param {*} lista Una lista de objetos.
 * 
 * @param {string} agrupador El elemento del objeto mediante el cual se van a agrupar.
 * 
 * @returns Una lista agrupada de la forma [clave1:[{}], clave2:[{}]...]
 */
function agruparPorClave(lista, agrupador) {
    const agrupado = {};

    lista.forEach((item) => {
        const agrupador2 = item[agrupador];

        if (!agrupado[agrupador2]) {
            agrupado[agrupador2] = []
        };

        agrupado[agrupador2].push(item);
    });

    return agrupado; // Los devuelve agrupados por año
}


module.exports = {

    optenerPromedioDeCompraProveedores,
    optenerPromedioDeVentasPorCliente,
    optenerTopGananciaProductosPorAnio,
    optenerTopCantPedidoPorClientePorAnio,
    optenerTopCantPedidoPorProveedorPorAnio

};



