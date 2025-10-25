// Esta es la URL base para realizar la consultas a los clientes.
const base_url = 'http://localhost:5000/api/';

/**
 *  Nombre:
 * 
 *  Descripcion:
 * 
 * @param {string} nombre 
 * @returns 
 */
async function obtenerProveedoresFiltrados({ nombre, categoria, metodoEntrega }) {

    // Procesar los datos de los filtros y pasarlos a 'null' o alguno de los que vamos a permitir.
    const nombreProcesado = nombre?.trim() || 'null';
    const categoriaProcesado = categoria || 'null';
    const metodoProcesado = metodoEntrega || 'null';

    // Armar la URL para la consulta
    const url = `${base_url}proveedores/filtros/${nombreProcesado}/${categoriaProcesado}/${metodoProcesado}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta de proveedores...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Proveedores recibidos:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de proveedores:", error);
        return [];
    }
     
}


/**
 *  Nombre: obtenerProveedorPorID
 * 
 *  Descripcion:
 * 
 * @param {int} proveedorID 
 * @returns Los datos del proveedor solicitado en caso de existir.
 */
async function obtenerProveedorPorID(proveedorID) {

    // Armar la URL para la consulta
    const url = `${base_url}proveedores/${proveedorID}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta de proveedor...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Proveedor recibido:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de proveedor por ID:", error);
        return [];
    }
     
}








export { obtenerProveedoresFiltrados, obtenerProveedorPorID };
