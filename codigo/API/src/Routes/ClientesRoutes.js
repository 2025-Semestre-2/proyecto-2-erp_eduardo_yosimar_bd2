const express = require('express');
const { optenerClientePorID, optenerClientes } = require('../Controllers/ClientesController');
const router = express.Router();

// Este es la ruta para obtener clientes.

// Obtener todo los clientes mediante filtros.
router.get('/filtros/:nombreCliente/:categoria/:metodoEntrega', optenerClientes);

router.get('/:clienteID', optenerClientePorID); // Obtener un cliente mediante su ID.

module.exports = router;