const express = require('express');
const { optenerInventario, optenerProductoPorID, optenerListaDeGruposPorProducto } = require('../Controllers/InventarioController');
const router = express.Router();

// Este es la ruta para obtener clientes.

// Obtener todo los clientes mediante filtros.
router.get('/filtros/:nombreProducto/:grupo/:cantidadMinima/:cantidadMaxima', optenerInventario);

router.get('/:productoID', optenerProductoPorID); // Obtener un cliente mediante su ID.

router.get('/gruposProducto/:productoID', optenerListaDeGruposPorProducto);

module.exports = router;