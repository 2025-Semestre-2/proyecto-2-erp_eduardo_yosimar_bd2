function TablaEstadisticaTopProducts({ resultados }) {
  return (
    <div>
      {Object.entries(resultados).map(([anio, lista]) => (
        <div key={anio} className="mb-8">
            <h3 className="text-xl font-bold text-gray-800 mb-2">Top productos - {anio}</h3>
            <table className="min-w-full bg-white border border-gray-300 rounded shadow">
              
                <thead className="bg-gray-400">
                    <tr>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Rango</th>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Nombre</th>
                        <th className="px-4 py-2 text-left text-sm font-semibold text-gray-700">Ganancia total</th>
                    </tr>
                </thead>

              <tbody className="divide-y divide-gray-200">

                  {lista.map((elemento) => (
                      <tr key={`${anio}-${elemento.ProductID}-${elemento.Rango}`}>
                        <td className="px-4 py-2 text-sm text-gray-600">{elemento.Rango}</td>
                        <td className="px-4 py-2 text-sm text-gray-800">{elemento.NombreProducto}</td>
                        <td className="px-4 py-2 text-sm text-gray-800">₡{elemento.GananciaTotal}</td>
                      </tr>
                  ))}
              </tbody>

            </table>
        </div>
      ))}
    </div>
  );
}

export default TablaEstadisticaTopProducts;
