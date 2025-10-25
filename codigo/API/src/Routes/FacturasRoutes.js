const express = require('express');
const { optenerFacturas, optenerFacturaPorID, optenerDetallesPorFactura } = require('../Controllers/FacturasController');
const router = express.Router();

// Este es la ruta para obtener clientes.

// Obtener todo los clientes mediante filtros.
router.get('/filtros/:numeroFactura/:nombreCliente/:fechaMinima/:fechaMaxima/:montoMinimo/:montoMaximo', optenerFacturas);

router.get('/:numeroFactura', optenerFacturaPorID); // Obtener un cliente mediante su ID.

router.get('/detalles/:numeroFactura', optenerDetallesPorFactura);

module.exports = router;