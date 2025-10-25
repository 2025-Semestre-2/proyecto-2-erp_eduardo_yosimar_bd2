import { useState } from 'react';

// Imports de componentes.
import FiltrosClientes from '../Components/FiltrosClientes.jsx';
import TablaClientes from '../Components/TablaClientes.jsx';
// Importar el servicios del API.
import { obtenerClientesFiltrados, obtenerClientePorID } from '../Services/ClienteAPI.js';


function Clientes() {

  // Aqui vamos a definir las variables y ese tipo de cosas.
  
  // Definir las variables para los filtros
  const [filtros, setFiltros] = useState({
    nombre: '',
    categoria: '',
    metodoEntrega: ''
  });
  
  // Defibnir la variable para almacenar los datos de la consulta.
  const [resultados, setResultados] = useState([]);
  
  // Aqui podemos definir cosas como funciones que se ocuparan.
  
  const handleChange = (e) => {
    setFiltros({ ...filtros, [e.target.name]: e.target.value });
  };

  const aplicarFiltros = async() => {
    console.log('Aplicando filtros:', filtros);

    // Obtener los datos y guardarlos para que se actulice el contenido de la tabla.
    const datos = await obtenerClientesFiltrados(filtros);
    setResultados(datos);

    
  };

  const reiniciarFiltros = async () => {
    setFiltros({ nombre: '', categoria: '', metodoEntrega: '' }); // Borrar los filtros
    console.log('Restaurando filtros');

    // Obtener los datos sin filtrar
    const datos = await obtenerClientesFiltrados({ nombre: '', categoria: '', metodoEntrega: '' });
    setResultados(datos); // Establecer todos los datos en el almacenmiento
  };


 return (
    <div className="max-w-5xl mx-auto rounded-lg px-4 py-6  text-slate-800">
      <h2 className="text-2xl font-bold text-gray-800 mb-4">Consulta de Clientes</h2>

      <div className='mb-6'>

        <FiltrosClientes
          filtros={filtros}
          onChange={handleChange}
          onAplicar={aplicarFiltros}
          onRestaurar={reiniciarFiltros}
        />

      </div>

      {/* <div className="bg-white shadow-md rounded-md p-6">
        <p className="text-gray-500 italic">Aqui se mostrara la tabla algun dia.</p>
      </div> */}

      <div className="bg-emerald-100 border border-emerald-200 shadow-md rounded-md p-6 ">
        {resultados.length === 0 ? (
          <p className="text-sm text-slate-500 italic">No hay resultados para mostrar. Intenta realizar una busqueda.</p> ) : ( <TablaClientes clientes={resultados} />)
        }
      </div>


    </div>
  );
}

export default Clientes;

