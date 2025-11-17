function FiltroFechas({ filtros, onChange, onAplicar }) {
  // const [filtros, setFiltros] = useState({
  //   fechaInicio: '',
  //   fechaFin: ''
  // });

  // const handleChange = (e) => {
  //   setFiltros({ ...filtros, [e.target.name]: e.target.value });
  // };

  // const aplicar = () => {
  //   onAplicar(filtros);
  // };

  return (
    <div className="bg-sky-50 shadow-md rounded-md p-6">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Fecha inicio</label>
          <select
            name="fechaInicio"
            value={filtros.fechaInicio}
            onChange={onChange}
            className="w-full border border-sky-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-sky-50">

            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option value="2015">2015</option>
            <option value="2016">2016</option>

          </select>
            
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Sucursal</label>
          <select
            name="sucursal"
            value={filtros.sucursal}
            onChange={onChange}
            className="w-full border border-sky-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-sky-50"
          >
            <option value="SanJose">San José</option>
            <option value="Limon">Limón</option>
            <option value="null">Ninguna</option>
          </select>
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Fecha fin</label>
          <select
            name="fechaFin"
            value={filtros.fechaFin}
            onChange={onChange}
            className="w-full border border-sky-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-sky-50">

            <option value="2016">2016</option>
            <option value="2015">2015</option>
            <option value="2014">2014</option>
            <option value="2013">2013</option>

          </select>
          
        </div>
      </div>

      <div className="mt-6 flex justify-end">
        <button
          onClick={onAplicar}
          className="px-4 py-2 bg-sky-600 text-white rounded hover:bg-sky-700 transition"
        >
          Aplicar filtros 
        </button>
      </div>
    </div>
  );
}

export default FiltroFechas;