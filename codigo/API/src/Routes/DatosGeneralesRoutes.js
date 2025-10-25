const express = require('express');
const { optenerCategoriaClientes, optenerCategoriProveedores, optenerMetodosEntrega } = require('../Controllers/DatosGeneralesController');
const router = express.Router();

// Este es la ruta para obtener clientes.

// Obtener las categorias disponibles para los clientes
router.get('/categoriasClientes', optenerCategoriaClientes);

// Obtener las categorias disponibles para los proveedores
router.get('/categoriasProveedores', optenerCategoriProveedores); 

// Obtener los metodos de entrega disponibles.
router.get('/metodosEntrega', optenerMetodosEntrega);

module.exports = router;