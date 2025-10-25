
// Imports generales de React.


export default function FiltrosInventario({ filtros, onChange, onAplicar, onRestaurar }) {

    // Para guardar los datos generales y usarlos en los filtros.

    // Metodo para cargar los datos generales y guardarlos.

    return (
        <div className="bg-emerald-50 text-slate-800 shadow-md rounded-md p-6 mb-6">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">

                <div>
                    {/* Nombre del producto. */}
                    <label className="block text-sm font-medium text-gray-700 mb-1">Nombre del producto</label>
                    <input
                        type="text"
                        name="nombreproducto"
                        value={filtros.nombreproducto}
                        onChange={onChange}
                        placeholder="Buscar por nombre"
                        className="w-full border border-emerald-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-emerald-500"/>
                </div>

                {/* Grupo del producto. */}
                <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Grupo</label>
                    <input
                        type="text"
                        name="grupo"
                        value={filtros.grupo}
                        onChange={onChange}
                        placeholder="Grupo del producto"
                        className="w-full border border-emerald-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-emerald-500"/>
                </div>

                {/* Cantidad minima de producto, estos deberian de tener un minimo de 0 */}
                <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Cantidad minima</label>
                    <input
                        type="number"
                        name="cantidadMinima"
                        value={filtros.cantidadMinima}
                        onChange={onChange}
                        min={0}
                        max={1035000}
                        placeholder="Ej. 0"
                        className="w-full border border-emerald-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-emerald-500"/>
                </div>

                {/* Cantidad maxima de producto */}
                <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Cantidad maxima</label>
                    <input
                        type="number"
                        name="cantidadMaxima"
                        value={filtros.cantidadMaxima}
                        onChange={onChange}
                        min={0}
                        max={1035000}
                        placeholder="Ej. 100"
                        className="w-full border border-emerald-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-emerald-500"/>
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
                    className="px-4 py-2 bg-emerald-600 text-white rounded hover:bg-emerald-700 transition">
                    Aplicar filtros
                </button>
            </div>
        </div>
    );
}
