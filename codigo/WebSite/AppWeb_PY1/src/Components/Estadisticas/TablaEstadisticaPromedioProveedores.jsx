
function TablaEstadisticaPromedioProveedores({ resultados }) {
    if (!resultados || (Array.isArray(resultados) && resultados.length === 0)) {
        return <p className="text-gray-500 italic">No hay datos para mostrar.</p>;
    }
    const resumenGeneral = Object.values(resultados).flat().find(
        (buscar) => buscar.NombreProveedor == null && buscar.Categoria == null
    );

    const proveedores = Object.entries(resultados).filter(
        ([nombre]) => nombre !== 'null' && nombre !== null
    );

    return (
        <div>
            {/* Mostrar resumen general para todos los proveedores de la consulta. */}
            {resumenGeneral && (
                <div className="bg-blue-50 border border-blue-200 rounded p-4 mb-6">
                    <h3 className="text-lg font-semibold text-gray-800 mb-2">Promedio general de todos los proveedores</h3>
                    <p className="text-sm text-gray-700">Monto minimo: ₡{resumenGeneral.MontoMinimo}</p>
                    <p className="text-sm text-gray-700">Monto maximo: ₡{resumenGeneral.MontoMaximo}</p>
                    <p className="text-sm text-gray-700">Monto promedio: ₡{resumenGeneral.MontoPromedio}</p>
                </div>
            )}

            {/* Mostrar los datos pro proveedor.*/}
            {proveedores.map(([nombre, filas]) => (
                <div key={nombre} className="mb-8">
                    <h3 className="text-md font-bold text-gray-800 mb-2">Proveedor: {nombre}</h3>
                    <table className="min-w-full bg-white border border-gray-300 rounded shadow">
                        <thead className="bg-gray-400">
                        <tr>
                            <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Categoria</th>
                            <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Monto minimo</th>
                            <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Monto maximo</th>
                            <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Monto promedio</th>
                        </tr>
                        </thead>

                        <tbody className="divide-y divide-gray-200">
                            {filas.map((fila, i) => (
                                <tr key={i}>
                                    <td className="px-4 py-2 text-sm text-gray-800">
                                        {fila.Categoria ?? <span className="italic text-gray-500">Todas las categorias</span>}
                                    </td>
                                    <td className="px-4 py-2 text-sm text-gray-800">₡{fila.MontoMinimo}</td>
                                    <td className="px-4 py-2 text-sm text-gray-800">₡{fila.MontoMaximo}</td>
                                    <td className="px-4 py-2 text-sm text-gray-800">₡{fila.MontoPromedio}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            ))}
        </div>
    );
}


export default TablaEstadisticaPromedioProveedores;



