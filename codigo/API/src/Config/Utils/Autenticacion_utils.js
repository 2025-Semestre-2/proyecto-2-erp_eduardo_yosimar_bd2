
/**
 * Nombre: validarAutenticacion
 * 
 * Descripcion: Funcion encargada de procesar el token que se envia desde el cliente, ese token contiene las credenciales del cliente con las cuales se podra acceder a la base de datos.
 * esto sin importar el cliente que se conecte, ya que cada uno tendra un token diferente y no dara problemas si quieren ingresar varios a distintos partes. * 
 * 
 * @param {*} req 
 * @param {*} res 
 * @param {*} next 
 * @returns 
 */
function validarAutenticacion(req, res, next) {
  const token = req.headers['authorization']?.split(' ')[1];
  if (!token) return res.status(401).send('Error: El token de autorizacion es requerido.');

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded; // Decodificar el token para que sea posible usarlo en los demas endpoints del API.
    next();
    
  } catch (err) {
    res.status(403).send('Error: El token recibido no ecuenta con un formato valido para procesarlo.');
  }
}


module.exports = {validarAutenticacion};