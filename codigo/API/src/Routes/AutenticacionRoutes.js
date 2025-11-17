const express = require('express');
const { validarCredenciales } = require('../Controllers/AuntenticacionController');
const router = express.Router();

// Este es la ruta para obtener clientes.

// Validar que las credenciales sean validas para inciar sesion.
router.post('/iniciar', validarCredenciales);

module.exports = router;