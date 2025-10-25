function TablaEstadisticaTopProveedores({ resultados }) {
  return (
    <div>
      {Object.entries(resultados).map(([anio, lista]) => (
        <div key={anio} className="mb-8">
            <h3 className="text-xl font-bold text-gray-800 mb-2">Top proveedores - {anio}</h3>
            <table className="min-w-full bg-white border border-gray-300 rounded shadow">
                <thead className="bg-gray-400">
                    <tr>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Rango</th>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Nombre</th>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Cantidad de ordenes</th>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Monto total</th>
                    </tr>
                </thead>
                <tbody className="divide-y divide-gray-200">

                    {lista.map((elemento) => (
                        <tr key={`${anio}-${elemento.SupplierID}-${elemento.Rango}`}>
                            <td className="px-4 py-2 text-sm text-gray-600">{elemento.Rango}</td>
                            <td className="px-4 py-2 text-sm text-gray-800">{elemento.SupplierName}</td>
                            <td className="px-4 py-2 text-sm text-gray-800">{elemento.CantidadOrdenes}</td>
                            <td className="px-4 py-2 text-sm text-gray-800">₡{elemento.MontoTotal}</td>
                        </tr>
                    ))}
                </tbody>
          </table>
        </div>
      ))}
    </div>
  );
}

export default TablaEstadisticaTopProveedores;
