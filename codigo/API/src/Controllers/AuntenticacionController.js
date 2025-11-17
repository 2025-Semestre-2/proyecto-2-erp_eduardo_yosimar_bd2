
const jwt = require('jsonwebtoken');
const sql = require('mssql');
const { establecerConexion } = require('../Config/db');

// EndPoint para realizar el inicio de sesion 
const validarCredenciales = async (req, res) => {

    const estado = false;

    try {

       const { email, password, servidor } = req.body;

        // Establecer la 
        const pool = await establecerConexion(servidor);

        // Ejecutar la conexion y el proceso de validacion.
        const result = await pool.request()
        .input('Email', sql.VarChar, email)
        .input('Password', sql.VarChar, password) // Esta es la contrasela cifrada.
        .execute('sp_ValidarUsuario');

        
        if (result.recordset.length === 0) {
            return res.status(401).json({ message: 'Error: credenciales invalidas o usuario inactivo.' });
        }

        const user = result.recordset[0];

        // Generar JWT con targetDB = sucursal del usuario
        const token = jwt.sign(
        {
            iduser: user.iduser,
            username: user.username,
            rol: user.rol,
            idDB: user.sucursal // SanJose, Limon o Corporativo
        },
        process.env.JWT_SECRET,
        { expiresIn: '1h' }
        );


        estado = true;
        res.json({ estado, token, user });
        
    } catch (error) {
        res.status(500).json({ estado, message: 'Error: No se pudo validar las credenciales de inicio de sesion.', error });
    }

};

module.exports = { validarCredenciales };