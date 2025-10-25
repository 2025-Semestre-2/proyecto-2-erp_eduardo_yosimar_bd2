// Aqui vamos a definir el componente que sera el modal para mostrar los datos detallados de un cliente.
import { useState } from 'react';

// Inportar componentes.
import ModalProveedor from './ModalProveedor.jsx';


// Importa los servicios del API.
import { obtenerProveedorPorID } from '../Services/ProveedoresAPI.js';
export default function ModalInventario({ producto, grupos, onClose }) {

    // Esta es para los datos de un cliente especifico.
    const [proveedorDetalle, setProveedorDetalle] = useState(null);

    // Esta es para saber cuando mostrar el modal.
    const [mostrarModalProveedor, setMostrarModalProveedor] = useState(false);


    const detalleProveedor = async (id) => {
        // console.log("Cliente seleccionado:", id);
        const datos = await obtenerProveedorPorID(id);
        setProveedorDetalle(datos[0]);
        setMostrarModalProveedor(true);

        // console.log("Detalles del proveedor:",datos);
        // console.log("Detalles del proveedor en ClienteDetalle:",clienteDetalle);
    };


    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50">
            <div className="bg-emerald-50 text-slate-800 rounded-lg shadow-lg w-full max-w-3xl max-h-[90vh] overflow-y-auto relative">
                
                {/* Un botoncito para cerrar el modal, tambien se podria buscar un icono para que quede mejor. */}
                <button
                    onClick={onClose}
                    className="absolute top-3 right-3 text-gray-500 hover:text-red-600 text-xl font-bold">
                    X
                </button>

                <div className="p-6">
                    <h2 className="text-2xl font-bold text-slate-800 mb-4">Detalles del Producto</h2>

                    {/* Seccion para mostrar los datos de los productos. */}
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-gray-800">

                        {/* Datos generales del producto */}
                        <div>
                            <strong>Identificador del producto:</strong> {producto.ProductID}
                        </div>

                        <div>
                            <strong>Nombre:</strong> {producto.NombreProducto}
                        </div>

                        {/* Esta sera a parte de los grupos, pero como son varios tiene que ser un map */}
                        {/* <div>
                            <strong>Grupos:</strong> {producto.Grupo}
                        </div> */}
                        <div>
                            <strong>Grupos:</strong>
                            <ul className="list-disc list-inside mt-1 text-gray-800">
                                {grupos.map((grup) => ( <li key={grup.GrupoID}>{grup.NombreGrupo}</li> ))}
                            </ul>
                        </div>


                        {/* Esta parte de aqui debe poder mostrar el modal con los datos del proveedor: producto.ProveedorID */}
                        {/* <div>
                            <strong>Nombre del proveedor:</strong> {producto.NombreProveedor || '—'}
                                                           <button
                                onClick={() => detalleProveedor(producto.ProveedorID)}
                                className="px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 transition">
                                    Ver detalles
                                </button>
                        </div> */}
                        <div className="flex items-center justify-between gap-4">
                            <div>
                                <strong>Nombre del proveedor:</strong>{' '}
                                <span className="text-gray-800">{producto.NombreProveedor || '—'}</span>
                            </div>

                            <button
                                onClick={() => detalleProveedor(producto.ProveedorID)}
                                className="px-3 py-1 bg-emerald-500 text-white text-sm rounded hover:bg-emerald-700 transition">
                                Ver proveedor
                            </button>
                        </div>


                        {/* Datos de precio */}
                        <div>
                            <strong>Precio de venta:</strong> {producto.PrecioVenta || '—'}
                        </div>

                        <div>
                            <strong>Impuesto:</strong> {producto.Impuesto}
                        </div>

                        <div>
                            <strong>Precio unitario:</strong> {producto.PrecioUnitacio}
                        </div>

                        {/* Caracteristicas fisicas del prodcuto */}
                        <div>
                            <strong>Color:</strong> {producto.Color}
                        </div>

                        <div>
                            <strong>Peso:</strong> {producto.Peso || '—'}
                        </div>

                        <div>
                            <strong>Talla:</strong> {producto.Talla || '—'}
                        </div>

                        <div>
                            <strong>Marca:</strong> {producto.Marca || '—'}
                        </div>

                        {/* Datos de empaquetamiento */}
                        <div>
                            <strong>Empaquetamiento primario:</strong> {producto.EmpaquetamientoBase}
                        </div>

                        <div>
                            <strong>Empaquetamiento alternativo:</strong> {producto.EmpaquetamientoAlternativo}
                        </div>

                        <div>
                            <strong>Cantidad por empaque:</strong> {producto.CantidadEmpaquetamiento}
                        </div>

                        {/* Datos de almacenamiento */}
                        <div>
                            <strong>Cantidad disponible:</strong> {producto.CantidadDisponible}
                        </div>

                        <div>
                            <strong>Nivel de stock objetivo:</strong> {producto.NivelStockObjetivo}
                        </div>

                        <div>
                            <strong>Ultima cantidad guardada:</strong> {producto.UltimaCantidadGuardada}
                        </div>

                        {/* Datos de la ubicacion */}
                        <div>
                            <strong>Ubicacion:</strong> {producto.Ubicacion}
                        </div>

                        <div>
                            <strong>Nivel de ordenamiento:</strong> {producto.NivelOrdenamiento}
                        </div>
                        
                        {/* Datos de busqueda */}

                        <div>
                            <strong>Palabras clave:</strong> {producto.PalabrasClave}
                        </div>

                    </div>

                </div>
            </div>

            {mostrarModalProveedor && proveedorDetalle && (
                <ModalProveedor
                    cliente={proveedorDetalle}
                    onClose={() => {
                        setMostrarModalProveedor(false);
                        setProveedorDetalle(null);
                    }}
                />
            )}

        </div>
    );
}
