const express = require('express');
const { optenerPromedioDeCompraProveedores, optenerPromedioDeVentasPorCliente, optenerTopGananciaProductosPorAnio, optenerTopCantPedidoPorClientePorAnio, optenerTopCantPedidoPorProveedorPorAnio } = require('../Controllers/EstadisticasController');
const router = express.Router();

// Este es la ruta para obtener clientes.

// Obtener todo los clientes mediante filtros.
router.get('/promedioCompraProveedores/:nombreProveedor/:categoria', optenerPromedioDeCompraProveedores);

router.get('/promedioVentasPorCliente/:nombreCliente/:categoria', optenerPromedioDeVentasPorCliente); // Obtener un cliente mediante su ID.

router.get('/topGananciaProductosPorAnio/:anioInicio/:anioFin', optenerTopGananciaProductosPorAnio);

router.get('/topCantPedidoPorClientePorAnio/:anioInicio/:anioFin', optenerTopCantPedidoPorClientePorAnio);

router.get('/topCantPedidoPorProveedorPorAnio/:anioInicio/:anioFin', optenerTopCantPedidoPorProveedorPorAnio);

module.exports = router;