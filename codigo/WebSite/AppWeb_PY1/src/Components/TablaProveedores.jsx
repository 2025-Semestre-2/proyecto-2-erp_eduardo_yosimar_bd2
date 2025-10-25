import { useState } from 'react';

// Inportar componentes.
import ModalProveedor from './ModalProveedor.jsx';


// Importa los servicios del API.
import { obtenerProveedorPorID } from '../Services/ProveedoresAPI.js';

export default function TablaClientes({ clientes }) {
    // Esta es para los datos de un cliente especifico.
    const [clienteDetalle, setClienteDetalle] = useState(null);

    // Esta es para saber cuando mostrar el modal.
    const [mostrarModal, setMostrarModal] = useState(false);

    // Para la parte de paginacion.
    const [paginaActual, setPaginaActual] = useState(1);
    const elementosPorPagina = 20;

    // Para separar los elementos en la distintas paginas, vamos a tener 20 por pagina
    const totalPaginas = Math.ceil(clientes.length / elementosPorPagina);
    const inicio = (paginaActual - 1) * elementosPorPagina;
    const clientesPagina = clientes.slice(inicio, inicio + elementosPorPagina);

    // Funcion para desplegar el modal que mostrara los datos detallados de un cliente especifico por su ID.
    const detalleCliente = async (id) => {
        // console.log("Cliente seleccionado:", id);
        const datos = await obtenerProveedorPorID(id);
        setClienteDetalle(datos[0]);
        setMostrarModal(true);

        console.log("Detalles del proveedor:",datos);
        console.log("Detalles del proveedor en ClienteDetalle:",clienteDetalle);
    };

    return (
        <div className="bg-white border-emerald-200 shadow-md rounded-md overflow-x-auto">
            {/* Tabla en la que se muestran los datos de los clientes. */}
            <table className="min-w-full divide-y divide-gray-500">
                {/* Aqui se definen las columnas que tendra la tabla. Esto se puede modificar para usar en las demas vistas. */}
                <thead className="bg-gray-400">
                    <tr>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">ID</th>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Nombre</th>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Categoria</th>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Metodo de entrega</th>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Detalle</th>
                    </tr>
                </thead>

                {/* En esta senccion se renderizan los datos generales que se muestran en la tabla para cada cliente */}
                <tbody className="divide-y divide-gray-200">

                    {/* Para renderizar los clientes se usa un map para ir recoriendo la lista de objetos. */}
                    {clientesPagina.map((cliente) => (
                        <tr key={cliente.ProveedorID}>
                            <td className="px-4 py-2 text-sm text-gray-600">{cliente.ProveedorID}</td>
                            <td className="px-4 py-2 text-sm text-gray-800">{cliente.NombreProveedor}</td>
                            <td className="px-4 py-2 text-sm text-gray-800">{cliente.Categoria}</td>
                            <td className="px-4 py-2 text-sm text-gray-800">{cliente.MetodoDeEntrega? cliente.MetodoDeEntrega: 'No especificado --'}</td>

                            {/* El boton para ver el datalle de un cliente mediante su id */}
                            <td className="px-4 py-2">
                                <button
                                onClick={() => detalleCliente(cliente.ProveedorID)}
                                className="px-3 py-1 bg-emerald-600 text-white text-sm rounded hover:bg-emerald-700 transition">
                                    Ver detalles
                                </button>
                            </td>
                        
                        </tr>
                    ))}
                </tbody>
            </table>

            {/* Aqui definimos la parte de la paginacion, podriamos crear sub listas a partir del tamaño original y eso es lo que se mostraria */}
            {/* Tambien ocuparemos botones para cambiar entre paginas, podrian ser flechas o un numero por cada pagina, o algo asi - Pendiente de definir */}
            <div className="max-w-full overflow-x-auto"> {/* El desbordamiento se tiene que corregir, del 1 al 8 se quedan quien sabe donde */}
                <div className="flex flex-wrap justify-center items-center gap-2 py-4 max-h-32 overflow-y-auto">
                    {Array.from({ length: totalPaginas }, (_, i) => (
                        <button
                            key={i + 1}
                            onClick={() => setPaginaActual(i + 1)}
                            className={`px-3 py-1 rounded text-sm font-medium transition ${
                                // Hacer algo para cambiar el color quedo bien feo y no se en cual esta.
                            paginaActual === i + 1
                                ? 'bg-emerald-600 text-white shadow'
                                : 'bg-emerald-100 text-gray-700 hover:bg-emerald-200'
                            }`} >
                            {i + 1}
                        </button>

                    ))}
                </div>
            </div>


        {mostrarModal && clienteDetalle && (
            <ModalProveedor
                cliente={clienteDetalle}
                onClose={() => {
                    setMostrarModal(false);
                    setClienteDetalle(null);
                }}
            />
        )}

        </div>

    );
}
