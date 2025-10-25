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
async function obtenerInventarioFiltrado({ nombreproducto, grupo, cantidadMinima, cantidadMaxima }) {


    // Procesar los datos de los filtros y pasarlos a 'null' o alguno de los que vamos a permitir.
    const nombreProcesado = nombreproducto || 'null';
    const grupoProcesado = grupo || 'null';
    const cantMinProcesado = cantidadMinima || 'null';
    const cantMaxProcesado = cantidadMaxima || 'null';

    // console.log("Filtro por grupo:", nombreproducto );
    // console.log("Filtro por nombre:", nombreProcesado );
    // Armar la URL para la consulta
    const url = `${base_url}inventario/filtros/${nombreProcesado}/${grupoProcesado}/${cantMinProcesado}/${cantMaxProcesado}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta del inventario...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Inventario recibido:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de inventario:", error);
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
async function obtenerProductoPorID(productoID) {

    // Armar la URL para la consulta
    const url = `${base_url}inventario/${productoID}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta del producto...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Producto recibido:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud del producto por ID:", error);
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
async function obtenerGruposPorProductoPorID(productoID) {

    // Armar la URL para la consulta
    const url = `${base_url}inventario/gruposProducto/${productoID}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta del grupodel producto...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Grupos recibido:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de los grupos del producto por ID:", error);
        return [];
    }
     
}


export { obtenerInventarioFiltrado, obtenerProductoPorID, obtenerGruposPorProductoPorID };
