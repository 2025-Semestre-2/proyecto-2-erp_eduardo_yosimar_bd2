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
async function obtenerFacturasFiltradas({ numeroFactura, nombreCliente, fechaMinima, fechaMaxima, montoMinimo, montoMaximo }) {

    // Procesar los datos de los filtros y pasarlos a 'null' o alguno de los que vamos a permitir.
    const numeroFacturaProcesado = numeroFactura || 'null';
    const nombreClienteProcesado = nombreCliente || 'null';
    const fechaMinimaProcesada = fechaMinima || 'null';
    const fechaMaximaProcesada = fechaMaxima || 'null';
    const montoMinimoProcesado = montoMinimo || 'null';
    const montoMaximoProcesado = montoMaximo || 'null';

    // Armar la URL para la consulta
    const url = `${base_url}facturas/filtros/${numeroFacturaProcesado}/${nombreClienteProcesado}/${fechaMinimaProcesada}/${fechaMaximaProcesada}/${montoMinimoProcesado}/${montoMaximoProcesado}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta de las facturas...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Facturas recibidas:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de facturas:", error);
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
async function obtenerFacturaPorID(numeroFactura) {

    // Armar la URL para la consulta
    const url = `${base_url}facturas/${numeroFactura}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta de la factura...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Factura recibida:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de la factura por ID:", error);
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
async function obtenerDetallePorFacturaPorID(numeroFactura) {

    // Armar la URL para la consulta
    const url = `${base_url}facturas/detalles/${numeroFactura}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta del detalle de la factura...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Detalles recibidos:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de los detalles de la factura por ID:", error);
        return [];
    }
     
}


export { obtenerFacturasFiltradas, obtenerFacturaPorID, obtenerDetallePorFacturaPorID };
