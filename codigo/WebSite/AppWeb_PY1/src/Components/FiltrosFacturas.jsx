
// Imports generales de React.


export default function FiltrosFacturas({ filtros, onChange, onAplicar, onRestaurar }) {

    // Para guardar los datos generales y usarlos en los filtros.

    // Metodo para cargar los datos generales y guardarlos.

    return (
        <div className="bg-emerald-50 text-slate-800 shadow-md rounded-md p-6 mb-6">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">

                <div>
                    {/* Numero de la factura. */}
                    <label className="block text-sm font-medium text-gray-700 mb-1">Numero de la factura</label>
                    <input
                        type="number"
                        name="numeroFactura"
                        value={filtros.numeroFactura}
                        onChange={onChange}
                        placeholder="Buscar por numero de factura"
                        className="w-full border border-emerald-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-emerald-500"/>
                </div>

                <div>
                    {/* Nombre del cliente */}
                    <label className="block text-sm font-medium text-gray-700 mb-1">Nombre del cliente</label>
                    <input
                        type="text"
                        name="nombreCliente"
                        value={filtros.nombreCliente}
                        onChange={onChange}
                        placeholder="Buscar por nombre del cliente"
                        className="w-full border border-emerald-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-emerald-500"/>
                </div>

                {/* Fecha minima para realizar la busqueda */}
                <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Fecha minima</label>
                    <input
                        type="date"
                        name="fechaMinima"
                        value={filtros.fechaMinima}
                        onChange={onChange}
                        min={"2013-01-01"}
                        max={"2016-06-01"}
                        placeholder="Fecha minima de la busqueda"
                        className="w-full border border-emerald-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-emerald-500"/>
                </div>

                {/* Fecha maxima para realizar la busqueda */}
                <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Fecha maxima</label>
                    <input
                        type="date"
                        name="fechaMaxima"
                        value={filtros.fechaMaxima}
                        onChange={onChange}
                        min={"2013-01-01"}
                        max={"2016-06-01"}
                        placeholder="Fecha maxima de la busqueda"
                        className="w-full border border-emerald-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-emerald-500"/>
                </div>

                {/* Cantidad minima de producto, estos deberian de tener un minimo de 0*/}
                <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Monto minimo</label>
                    <input
                        type="number"
                        name="montoMinimo"
                        value={filtros.montoMinimo}
                        onChange={onChange}
                        min={0}
                        placeholder="Ej. 0"
                        className="w-full border border-emerald-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-emerald-500"/>
                </div>

                {/* Cantidad maxima de producto */}
                <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Monto maximo</label>
                    <input
                        type="number"
                        name="montoMaximo"
                        value={filtros.montoMaximo}
                        onChange={onChange}
                        min={0}
                        max={37000}
                        placeholder="Ej. 37000"
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
