import { useState, useEffect } from 'react';

// Imports del API.
import { obtenerCategoriasClientes, obtenerCategoriasProveedores } from '../Services/DatosGeneralesAPI.js'
import { promedioDeVentasPorCliente, pormedioDeCompraPorProveedor, topProductoPorAnio, topClientesPorAnio, topProveedoresPorAnio } from '../Services/EstadisticasAPI.js'

// Imports de componentes.
import FiltroFechas from '../Components/Estadisticas/FiltrosEstadisticasFechas.jsx';
import FiltroTextoSelect from '../Components/Estadisticas/FiltrosEstadisticasTexto.jsx';
import TablaEstadisticaPromedioProveedores from '../Components/Estadisticas/TablaEstadisticaPromedioProveedores.jsx';
import TablaEstadisticaPromedioCliente from '../Components/Estadisticas/TablaEstadisticasPromedioClientes.jsx';
import TablaEstadisticaTopClientes from '../Components/Estadisticas/TablaEstadisticaTopClientes.jsx';
import TablaEstadisticaTopProducts from '../Components/Estadisticas/TablaEstadisticaTopProducts.jsx';
import TablaEstadisticaTopProveedores from '../Components/Estadisticas/TablaEstadisticaTopProveedores.jsx';


function Estadisticas() {

  //Para saber cual es la estadistica disponible
  const [estadisticaSeleccionada, setEstadisticaSeleccionada] = useState('ventas');

  // Para establecer las opcionnes que van a tener los filtros.
  const [opcionesFiltro, setOpcionesFiltro] = useState([]);

  const estadisticas = [
    { id: 'promedioP', nombre: 'Promedio de pedidos por proveedor', tipo: 'textoSelect' },
    { id: 'promedioC', nombre: 'Promedio de compra por cliente', tipo: 'textoSelect' },
    { id: 'productos', nombre: 'Top 5 productos con mas ganancia por año', tipo: 'fechas' },
    { id: 'facturas', nombre: 'Top 5 clientes con mas facturas', tipo: 'fechas' },
    { id: 'pedidos', nombre: 'Top 5 proveedores con mas pedidos', tipo: 'fechas' },
  ];

  const [filtrosT, setFiltrosT] = useState({
    nombre: '',
    categoria: '',
    sucursal: 'SanJose'
  });

  const [filtrosF, setFiltrosF] = useState({
    fechaInicio: '2013',
    fechaFin: '2016',
    sucursal: 'SanJose'
  });

  // La que almacena los datos a renderizar.
  const [resultados, setResultados] = useState([]);

  const cambiosFiltrosT = (e) => {
    setFiltrosT({ ...filtrosT, [e.target.name]: e.target.value });
  };

  const cambiosFiltrosF = (e) => {
    setFiltrosF({ ...filtrosF, [e.target.name]: e.target.value });
  };


  const aplicarFiltrosTP = async() => {
    console.log('Aplicando filtros:', filtrosT);

    // Obtener los datos y guardarlos para que se actulice el contenido de la tabla.
    const datos = await pormedioDeCompraPorProveedor(filtrosT);
    setResultados(datos);

    
  };

  const aplicarFiltrosTC = async() => {
    console.log('Aplicando filtros:', filtrosT);

    // Obtener los datos y guardarlos para que se actulice el contenido de la tabla.
    const datos = await promedioDeVentasPorCliente(filtrosT);
    setResultados(Array.isArray(datos) || typeof datos === 'object' ? datos : []);
};

  const aplicarFiltrosF = async () => {
    if (estadisticaSeleccionada === 'productos') {
      const datos = await topProductoPorAnio(filtrosF);
      setResultados(Array.isArray(datos) || typeof datos === 'object' ? datos : []);
    } else if (estadisticaSeleccionada === 'facturas') {
      const datos = await topClientesPorAnio(filtrosF);
      setResultados(Array.isArray(datos) || typeof datos === 'object' ? datos : []);
    } else {
      const datos = await topProveedoresPorAnio(filtrosF);
      setResultados(Array.isArray(datos) || typeof datos === 'object' ? datos : []);
    }
    // Obtener los datos y guardarlos para que se actulice el contenido de la tabla.
    // const datos = await promedioDeVentasPorCliente(filtrosT);
    // setResultados(datos);
  };


  // const renderizarFiltro = async () => {
  //   const tipo = estadisticas.find(e => e.id === estadisticaSeleccionada)?.tipo;
  //   if (tipo === 'fechas') {
  //     // return <FiltroFechas />
  //   };

  //   if (tipo === 'textoSelect') {

  //     // Hacer algo para que se pueda elegir entre clientes y proveedores, creo que seria dependiendo de la estadistica actual.
  //     let datosCategoria = [];

  //     if (estadisticaSeleccionada === 'promedioP') {
  //       datosCategoria = await obtenerCategoriasProveedores();
  //       return <FiltroTextoSelect opciones={datosCategoria} onChange={cambiosFiltrosT} onAplicar={aplicarFiltrosTP}/>
  //     } else {
  //       datosCategoria = await obtenerCategoriasClientes();
  //       return <FiltroTextoSelect opciones={datosCategoria} onChange={cambiosFiltrosT} onAplicar={aplicarFiltrosTC}/>
  //     }

  //   };
  //   return null;
  // };

  // Establecer las opciones de los filtros
  useEffect(() => {
    const cargarOpciones = async () => {

      if (estadisticaSeleccionada === 'promedioP') {
        const datos = await obtenerCategoriasProveedores();
        setOpcionesFiltro(datos);

      } else if (estadisticaSeleccionada === 'promedioC') {
        const datos = await obtenerCategoriasClientes();
        setOpcionesFiltro(datos);

      } else {
        setOpcionesFiltro([]); // No aplica

      }
    };

    // Poner los resultados en null para que no se muestren.
    setResultados(null);

    // Reiniciar los valores de los filtros.
    setFiltrosF({ fechaInicio: '2013', fechaFin: '2016'});
    
    setFiltrosT({ nombre: '', categoria: ''});

    cargarOpciones();
  }, [estadisticaSeleccionada]);

  // <TablaEstadisticaTopProducts resultados={resultados} /> 
  // <TablaEstadisticaTopClientes resultados={resultados} />
  // <TablaEstadisticaTopProveedores resultados={resultados} />
  // <TablaEstadisticaPromedioProveedores resultados={resultados} />
  // <TablaEstadisticaPromedioCliente resultados={resultados} />

  // Funcion para renderizar los resultados de las estadisticas dependiendo de cual sea.
  const renderizarResultados = () => {

    // if (!resultados) {
    //   alert("Aviso: No hay resultados para mostrar.")
    // }


    switch (estadisticaSeleccionada) {

      case 'promedioP':
        return <TablaEstadisticaPromedioProveedores resultados={resultados} />;

      case 'promedioC':
        return <TablaEstadisticaPromedioCliente resultados={resultados} />;

      case 'productos':
        return <TablaEstadisticaTopProducts resultados={resultados} />;

      case 'facturas':
        return <TablaEstadisticaTopClientes resultados={resultados} />;

      case 'pedidos':
        return <TablaEstadisticaTopProveedores resultados={resultados} />;
        
      default:
        return <p className="text-gray-500 italic">No hay resultados disponibles.</p>;
    }
  };

  // Para revisar si el resultados esta vacio o no.
  useEffect(() => {
  if (resultados && Object.keys(resultados).length === 0) {
    alert('Aviso: No hay resultados para mostrar.');
  }
  }, [resultados]);


 return (
    <div className="max-w-6xl mx-auto px-4 py-6">
      <h2 className="text-2xl font-bold text-gray-800 mb-4">Panel de estadisticas</h2>

      {/* Adaptar la navegacion para que se con botones */}
      <div className="text-sm font-medium text-center text-gray-700 border-b border-gray-400 mb-6">
        <ul className="flex flex-wrap -mb-px">
          {estadisticas.map((estadistica) => (
            <li key={estadistica.id} className="me-2">
              <button
                onClick={() => setEstadisticaSeleccionada(estadistica.id)}
                className={`inline-block p-4 border-b-2 rounded-t-lg transition ${
                  estadisticaSeleccionada === estadistica.id ? 'text-sky-800 border-sky-800 font-semibold' : 'border-transparent hover:text-gray-800 hover:border-gray-500'
                }`}>
                {estadistica.nombre}
              </button>
            </li>
          ))}
        </ul>
      </div>

      {/* Seccion para los filtros de que tendra cada estadistica.*/}

      <div className="mb-6">
        {estadisticas.find(e => e.id === estadisticaSeleccionada)?.tipo === 'fechas' && (
          <FiltroFechas filtros={filtrosF} onChange={cambiosFiltrosF} onAplicar={aplicarFiltrosF} />
        )}

        {estadisticas.find(e => e.id === estadisticaSeleccionada)?.tipo === 'textoSelect' && (
          <FiltroTextoSelect
            filtros = {filtrosT}
            opciones={opcionesFiltro}
            onChange={cambiosFiltrosT}
            onAplicar={estadisticaSeleccionada === 'promedioP'? aplicarFiltrosTP : aplicarFiltrosTC} 
            clave={estadisticaSeleccionada === 'promedioP'? 'SupplierCategoryID' : 'CustomerCategoryID'}
            valor={estadisticaSeleccionada === 'promedioP'? 'SupplierCategoryName' : 'CustomerCategoryName'}/>
        )}
      </div>


      {/* Resultados */}
      <div className="bg-sky-50 shadow rounded p-4">
        <h3 className="text-lg font-semibold text-gray-700 mb-2">Resultados de la estadistica</h3>
        {/* <p className="text-gray-500 italic">Aqui mostraremos las estadisticas del programa...algun dia.</p> */}
        {/* {renderizarResultados()} */}
        {resultados === null ? ( <p className="text-gray-500 italic">Selecciona filtros para ver resultados.</p>) : (renderizarResultados())}

      </div>
      
    </div>
  );
}

export default Estadisticas;