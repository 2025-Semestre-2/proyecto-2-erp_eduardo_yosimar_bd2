function FiltroTextoSelect({ filtros, opciones = [], onChange , onAplicar, clave, valor }) {

    // const [categorias, setCategorias] = useState([]);

//   const [filtros, setFiltros] = useState({
//     texto: '',
//     categoria: ''
//   });

//   const handleChange = (e) => {
//     setFiltros({ ...filtros, [e.target.name]: e.target.value });
//   };

//   const aplicar = () => {
//     onAplicar(filtros);
//   };


//     useEffect(() => {
//         const cargarDatos = async () => {

//         try {

//             // Cargarlo desde el API y guardarlos.
//             // Se debe de agregar alguna forma de que alternar entre los de los clientes y los de los proveedores
//             const categoriasAPI = await obtenerCategoriasClientes();
//             // const metodosAPI = await obtenerMetodoDeEntrega();

//             setCategorias(categoriasAPI);
//             // setMetodosEntrega(metodosAPI);

//         } catch (error) {
//             console.error("Error cargando datos generales:", error);
//         }
//     };
//     cargarDatos();
//   }, []);

  return (
    <div className="bg-sky-50 shadow-md rounded-md p-6">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Nombre</label>
          <input
            type="text"
            name="nombre"
            value={filtros.nombre}
            onChange={onChange}
            placeholder="Buscar por nombre"
            className="w-full border border-sky-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-sky-50"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Categoria</label>
          <select
            name="categoria"
            value={filtros.categoria}
            onChange={onChange}
            className="w-full border border-sky-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-sky-50">

            <option value="">No aplicar</option>

            {opciones.map((op) => (
              <option key={op[clave]} value={op[valor]}>
                {op[valor]}
              </option>
            ))}

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
          </select>
        </div>
      </div>

      {/* Boton para aplicar los filtros */}
      <div className="mt-6 flex justify-end">
        <button
          onClick={onAplicar}
          className="px-4 py-2 bg-sky-600 text-white rounded hover:bg-sky-700 transition">
          Aplicar filtros
        </button>
      </div>
    </div>
  );
}

export default FiltroTextoSelect;
