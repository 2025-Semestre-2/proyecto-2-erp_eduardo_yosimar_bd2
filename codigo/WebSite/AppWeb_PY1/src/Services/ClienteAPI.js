
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
async function obtenerClientesFiltrados({ nombre, categoria, metodoEntrega }) {

    // Procesar los datos de los filtros y pasarlos a 'null' o alguno de los que vamos a permitir.
    const nombreProcesado = nombre?.trim() || 'null';
    const categoriaProcesado = categoria || 'null';
    const metodoProcesado = metodoEntrega || 'null';

    // Armar la URL para la consulta
    const url = `${base_url}clientes/filtros/${nombreProcesado}/${categoriaProcesado}/${metodoProcesado}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta de clientes...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Clientes recibidos:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de clientes:", error);
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
async function obtenerClientePorID(clienteID) {

    // Procesar los datos de los filtros.


    // Armar la URL para la consulta
    const url = `${base_url}clientes/${clienteID}`;

    // Intentar realizar la consulta
    try {

        const respuesta = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        console.log("Esperando la respuesta de clientes...");

        if (respuesta.ok) {
            const resultado = await respuesta.json();
            console.log("Clientes recibidos:", resultado);
            return resultado;

        } else {

            console.warn("La respuesta no fue exitosa:", respuesta.status);
            return [];
        }

    } catch (error) {
        console.error("Error en la solicitud de clientes:", error);
        return [];
    }
     
}








export { obtenerClientesFiltrados, obtenerClientePorID };

// async function IncializarJuego() {

//     console.log("Pasando por aqui.1...");
// 	// const formData = new FormData(this);
// 	// const data = Object.fromEntries(formData.entries()); // Convertir a un objeto JS
//     let nombreA = sessionStorage.getItem("JugadorA");
//     let nombreB = sessionStorage.getItem("JugadorB");
//     try {

//         const respuesta = await fetch('http://localhost:5000/api/juego/', {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/json'
//             },
//             body: JSON.stringify({ JugadorA: nombreA, JugadorB: nombreB })

//         });

//         console.log("Esperando la respuesta..");
//         if (respuesta.ok) {

//             const resultado = await respuesta.json();
//             console.log("Llego la respuesta.", resultado);

//             // sessionStorage.setItem("JugadorA", resultado.jugadorA);
//             // sessionStorage.setItem("JugadorB", resultado.jugadorB);
//             return resultado.JugadorActual;

//         } else {
//             console.log("La respuesta no fue la esperada, es erronea..")
//         }

//     } catch (error) {
//         console.error('Error en la solicitud:', error);
//     }

// }

