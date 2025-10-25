// Esta es la URL base para realizar las consultas al API.
const base_url = 'http://localhost:5000/api/';


/**
 *  Nombre:
 * 
 *  Descripcion:
 * 
 * @param {int} clienteID 
 * @returns Los datos del cliente solicitado en caso de existir.
 */
async function obtenerCategoriasClientes() {

    // Armar la URL para la consulta
    const url = `${base_url}datosGenerales/categoriasClientes`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta de datos generales...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Categorias de clientes recibidas:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de datos generales de categorias de clientes:", error);
        return [];
    }
     
}


/**
 *  Nombre:
 * 
 *  Descripcion:
 * 
 * @param {int} clienteID 
 * @returns Los datos del cliente solicitado en caso de existir.
 */
async function obtenerCategoriasProveedores() {

    // Armar la URL para la consulta
    const url = `${base_url}datosGenerales/categoriasProveedores`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta de categorias proveedores...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Categorias de proveedores recibidas:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de datos generales de metodos de entrega:", error);
        return [];
    }
     
}


/**
 *  Nombre:
 * 
 *  Descripcion:
 * 
 * @param {int}  
 * @returns 
 */
async function obtenerMetodoDeEntrega() {

    // Armar la URL para la consulta
    const url = `${base_url}datosGenerales/metodosEntrega`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta de metodos de entrega...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Metodos de entrega recibidos:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de datos generales de metodo de entrega:", error);
        return [];
    }
     
}



export { obtenerCategoriasClientes, obtenerCategoriasProveedores, obtenerMetodoDeEntrega};