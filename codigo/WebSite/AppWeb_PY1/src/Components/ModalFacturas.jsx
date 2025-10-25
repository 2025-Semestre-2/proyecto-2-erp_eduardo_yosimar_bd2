// Aqui vamos a definir el componente que sera el modal para mostrar los datos detallados de un cliente.
import { useState } from 'react';

// Inportar componentes.
import ModalCliente from './ModalCliente.jsx';
import TablaDetalleFactura from './TablaDetalleFacturas.jsx';

// Importa los servicios del API.
import { obtenerClientePorID } from '../Services/ClienteAPI.js';
export default function ModalFacturas({ factura, detalles, onClose }) {

    // Esta es para los datos de un cliente especifico.
    const [clienteDetalle, setClienteDetalle] = useState(null);

    // Esta es para saber cuando mostrar el modal.
    const [mostrarModal, setMostrarModal] = useState(false);


    const detalleCliente = async (id) => {
        // console.log("Cliente seleccionado:", id);
        const datos = await obtenerClientePorID(id);
        setClienteDetalle(datos[0]);
        setMostrarModal(true);

        console.log("Detalles del cliente:", id);
        // console.log("Detalles del cliente en ClienteDetalle:",clienteDetalle);
    };


    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50">
            <div className="bg-emerald-50 text-slate-800 rounded-lg shadow-lg w-full max-w-4xl max-h-[90vh] overflow-y-auto relative">
                
                {/* Un botoncito para cerrar el modal, tambien se podria buscar un icono para que quede mejor. */}
                <button
                    onClick={onClose}
                    className="absolute top-3 right-3 text-gray-500 hover:text-red-600 text-xl font-bold">
                    X
                </button>

                <div className="p-6">
                    <h2 className="text-2xl font-bold text-slate-800 mb-4">Detalles de la factura</h2>

                    {/* Seccion para mostrar los datos de los productos. */}
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-gray-800">

                        {/* Datos generales del producto */}
                        <div>
                            <strong>Numero de factura:</strong> {factura.NumeroFactura}
                        </div>

                        <div>
                            <strong>Numero de orden:</strong> {factura.NumeroDeOrden || '—'}
                        </div>

                        <div className="flex items-center justify-between gap-4">
                            <div>
                                <strong>Nombre del cliente:</strong>{' '}
                                <span className="text-gray-800">{factura.NombreCliente || '—'}</span>
                            </div>

                            <button
                                onClick={() => detalleCliente(factura.ClienteID)}
                                className="px-3 py-1 bg-emerald-600 text-white text-sm rounded hover:bg-emerald-700 transition">
                                Ver cliente
                            </button>
                        </div>


                        {/* Datos de precio */}

                        <div>
                            <strong>Contacto:</strong> {factura.Contacto}
                        </div>

                        <div>
                            <strong>Vendedor:</strong> {factura.Vendedor}
                        </div>

                        {/* Caracteristicas fisicas del prodcuto */}
                        <div>
                            <strong>Fecha factura:</strong> {new Date(factura.FechaFactura).toLocaleDateString()}
                        </div>

                        <div>
                            <strong>Instrucciones de entrega:</strong> {factura.InstruccionesEntrega || '—'}
                        </div>

                        <div>
                            <strong>Total facturado:</strong> {factura.TotalFacturado || '—'}
                        </div>

                        
                    </div>

                    <div className="mt-6">
                        <h3 className="text-lg font-semibold text-gray-700 mb-2">Lista de productos de la factura</h3>

                        <div className="w-full max-h-[400px] overflow-auto border border-emerald-200 rounded shadow-sm p-4">
                            
                            {detalles.length === 0 ? (
                            <p className="text-sm text-slate-500 italic">No hay resultados para mostrar. Intenta realizar una busqueda.</p> ) : ( <TablaDetalleFactura detalleFactura={detalles} />)
                            }

                        </div>




                    </div>

                </div>
            </div>

            {mostrarModal && clienteDetalle && (
                <ModalCliente
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
