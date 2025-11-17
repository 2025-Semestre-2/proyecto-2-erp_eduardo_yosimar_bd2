const express = require('express');
const { optenerPromedioDeCompraProveedores, optenerPromedioDeVentasPorCliente, optenerTopGananciaProductosPorAnio, optenerTopCantPedidoPorClientePorAnio, optenerTopCantPedidoPorProveedorPorAnio } = require('../Controllers/EstadisticasController');
const router = express.Router();
const {validarAutenticacion} = require('../Config/Utils/Autenticacion_utils');

// Este es la ruta para obtener clientes.

// Obtener todo los clientes mediante filtros.
router.get('/promedioCompraProveedores/:nombreProveedor/:categoria/:sucursal', optenerPromedioDeCompraProveedores);

router.get('/promedioVentasPorCliente/:nombreCliente/:categoria/:sucursal', optenerPromedioDeVentasPorCliente); // Obtener un cliente mediante su ID.

router.get('/topGananciaProductosPorAnio/:anioInicio/:anioFin/:sucursal', optenerTopGananciaProductosPorAnio);
router.get('/topCantPedidoPorClientePorAnio/:anioInicio/:anioFin/:sucursal', optenerTopCantPedidoPorClientePorAnio);

router.get('/topCantPedidoPorProveedorPorAnio/:anioInicio/:anioFin/:sucursal', optenerTopCantPedidoPorProveedorPorAnio);

module.exports = router;