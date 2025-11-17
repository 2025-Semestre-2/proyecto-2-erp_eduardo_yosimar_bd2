const express = require('express');
const { optenerPromedioDeCompraProveedores, optenerPromedioDeVentasPorCliente, optenerTopGananciaProductosPorAnio, optenerTopCantPedidoPorClientePorAnio, optenerTopCantPedidoPorProveedorPorAnio } = require('../Controllers/EstadisticasController');
const router = express.Router();
const {validarAutenticacion} = require('../Config/Utils/Autenticacion_utils');

// Este es la ruta para obtener clientes.

// Obtener todo los clientes mediante filtros.
router.get('/promedioCompraProveedores/:nombreProveedor/:categoria/:sucursal',validarAutenticacion, optenerPromedioDeCompraProveedores);

router.get('/promedioVentasPorCliente/:nombreCliente/:categoria/:sucursal',validarAutenticacion, optenerPromedioDeVentasPorCliente); // Obtener un cliente mediante su ID.

router.get('/topGananciaProductosPorAnio/:anioInicio/:anioFin/:sucursal',validarAutenticacion, optenerTopGananciaProductosPorAnio);
router.get('/topCantPedidoPorClientePorAnio/:anioInicio/:anioFin/:sucursal',validarAutenticacion, optenerTopCantPedidoPorClientePorAnio);

router.get('/topCantPedidoPorProveedorPorAnio/:anioInicio/:anioFin/:sucursal',validarAutenticacion, optenerTopCantPedidoPorProveedorPorAnio);

module.exports = router;