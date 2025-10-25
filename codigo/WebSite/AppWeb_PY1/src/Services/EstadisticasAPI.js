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
async function pormedioDeCompraPorProveedor({ nombre, categoria }) {

    // Procesar los datos de los filtros y pasarlos a 'null' o alguno de los que vamos a permitir.
    const nombreProcesado = nombre || 'null';
    const categoriaProcesado = categoria || 'null';


    // Armar la URL para la consulta
    const url = `${base_url}estadisticas/promedioCompraProveedores/${nombreProcesado}/${categoriaProcesado}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta del promedio de compra por proveedore...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Datos del promedio de proveedores recibidas:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud del promedio de compra por proveedores:", error);
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
async function promedioDeVentasPorCliente({ nombre, categoria }) {

    // Procesar los datos de los filtros y pasarlos a 'null' o alguno de los que vamos a permitir.
    const nombreProcesado = nombre || 'null';
    const categoriaProcesado = categoria || 'null';


    // Armar la URL para la consulta
    const url = `${base_url}estadisticas/promedioVentasPorCliente/${nombreProcesado}/${categoriaProcesado}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta del promedio de compra por cliente...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Datos del promedio de clientes recibidas:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud del promedio de compra por cliente:", error);
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
async function topProductoPorAnio({ fechaInicio, fechaFin }) {
    // console.log("Fechas recibidas");
    // Procesar los datos de los filtros y pasarlos a 'null' o alguno de los que vamos a permitir.
    const fechaInicioProcesado = fechaInicio || 'null';
    const fechaFinProcesado = fechaFin || 'null';


    // Armar la URL para la consulta
    const url = `${base_url}estadisticas/topGananciaProductosPorAnio/${fechaInicioProcesado}/${fechaFinProcesado}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta del top de productos...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Datos del top de productos recibidas:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud del top de productos:", error);
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
async function topClientesPorAnio({ fechaInicio, fechaFin }) {

    // Procesar los datos de los filtros y pasarlos a 'null' o alguno de los que vamos a permitir.
    const fechaInicioProcesado = fechaInicio || 'null';
    const fechaFinProcesado = fechaFin || 'null';


    // Armar la URL para la consulta
    const url = `${base_url}estadisticas/topCantPedidoPorClientePorAnio/${fechaInicioProcesado}/${fechaFinProcesado}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta del top de productos...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Datos del top de productos recibidas:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud del top de productos:", error);
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
async function topProveedoresPorAnio({ fechaInicio, fechaFin }) {

    // Procesar los datos de los filtros y pasarlos a 'null' o alguno de los que vamos a permitir.
    const fechaInicioProcesado = fechaInicio || 'null';
    const fechaFinProcesado = fechaFin || 'null';


    // Armar la URL para la consulta
    const url = `${base_url}estadisticas/topCantPedidoPorProveedorPorAnio/${fechaInicioProcesado}/${fechaFinProcesado}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta del top de productos...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Datos del top de productos recibidas:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud del top de productos:", error);
        return [];
    }
     
}



export { pormedioDeCompraPorProveedor, promedioDeVentasPorCliente, topProductoPorAnio, topClientesPorAnio, topProveedoresPorAnio };
