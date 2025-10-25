
// Imports generales de React.
import { useEffect, useState } from 'react';

// Inportar el servicios del api para datos generales.
import { obtenerCategoriasProveedores, obtenerMetodoDeEntrega } from '../Services/DatosGeneralesAPI.js';

export default function FiltrosProveedores({ filtros, onChange, onAplicar, onRestaurar }) {

    // Para guardar los datos generales y usarlos en los filtros.
    const [categorias, setCategorias] = useState([]);
    const [metodosEntrega, setMetodosEntrega] = useState([]);

    // Metodo para cargar los datos generales y guardarlos.

    useEffect(() => {
        const cargarDatos = async () => {

        try {

            // Cargarlo desde el API y guardarlos.
            const categoriasAPI = await obtenerCategoriasProveedores();
            const metodosAPI = await obtenerMetodoDeEntrega();

            setCategorias(categoriasAPI);
            setMetodosEntrega(metodosAPI);

        } catch (error) {
            console.error("Error cargando datos generales:", error);
        }
    };

    cargarDatos();
  }, []);

    return (
        <div className="bg-sky-50 text-slate-800 shadow-md rounded-md p-6 mb-6">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Nombre del del proveedor</label>
                    <input
                        type="text"
                        name="nombre"
                        value={filtros.nombre}
                        onChange={onChange}
                        placeholder="Buscar por nombre"
                        className="w-full border border-sky-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-sky-500"/>
                </div>

                <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Categoria</label>

                    <select
                        name="categoria"
                        value={filtros.categoria}
                        onChange={onChange}
                        className="w-full border border-sky-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-sky-500">
                        <option value="">No aplicar</option>

                        {/* Esta deben de ser dinamicas y cargarse con los datos de la base de datos. */}
                        {categorias.map((categorias) => (
                            <option key={categorias.SupplierCategoryID} value={categorias.SupplierCategoryName}>
                                {categorias.SupplierCategoryName}
                            </option>
                        ))}

                    </select>
                </div>

                {/* Para lo del metodo de entrega */}
                <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Metodo de entrega</label>

                    <select
                        name="metodoEntrega"
                        value={filtros.metodoEntrega}
                        onChange={onChange}
                        className="w-full border border-sky-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-sky-500">
                        <option value="">No aplicar</option>

                        {/* Estos deberan ser cargados dinamicamente. */}
                        {/* <option value="Express">Express</option>
                        <option value="Estandar">Estandar</option>
                        */}

                        {metodosEntrega.map((metodo) => (
                            <option key={metodo.DeliveryMethodID} value={metodo.DeliveryMethodName}>
                                {metodo.DeliveryMethodName}
                            </option>
                        ))}


                    </select>

                </div>
            </div>


            {/* Seccion de los botones */}
            <div className="mt-6 flex justify-end space-x-4">

                <button
                    onClick={onRestaurar}
                    className="px-4 py-2 bg-slate-200 text-slate-700 rounded hover:bg-slate-300 transition"> 
                    Restaurar filtros
                </button>

                <button
                    onClick={onAplicar}
                    className="px-4 py-2 bg-sky-600 text-white rounded hover:bg-sky-700 transition">
                    Aplicar filtros
                </button>
            </div>
        </div>
    );
}
