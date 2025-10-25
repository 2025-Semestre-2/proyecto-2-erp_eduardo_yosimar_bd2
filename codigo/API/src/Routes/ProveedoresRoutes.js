const express = require('express');
const { optenerProveedores, optenerProveedorPorID } = require('../Controllers/ProveedoresController');
const router = express.Router();

// Este es la ruta para obtener clientes.

// Obtener todo los clientes mediante filtros.
router.get('/filtros/:nombreProveedor/:categoria/:metodoEntrega', optenerProveedores);

router.get('/:proveedorID', optenerProveedorPorID); // Obtener un cliente mediante su ID.

module.exports = router;