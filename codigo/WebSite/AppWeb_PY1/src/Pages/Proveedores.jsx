import { useState } from 'react';

// Imports de componentes.
import FiltrosProveedores from '../Components/FiltrosProveedores.jsx';
import TablaProveedores from '../Components/TablaProveedores.jsx';

// Importar el servicios del API.
import { obtenerProveedoresFiltrados } from '../Services/ProveedoresAPI.js';



function Proveedores() {

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
    const datos = await obtenerProveedoresFiltrados(filtros);
    setResultados(datos);

    
  };

  const reiniciarFiltros = async () => {
    setFiltros({ nombre: '', categoria: '', metodoEntrega: '' }); // Borrar los filtros
    console.log('Restaurando filtros');

    // Obtener los datos sin filtrar
    const datos = await obtenerProveedoresFiltrados({ nombre: '', categoria: '', metodoEntrega: '' });
    setResultados(datos); // Establecer todos los datos en el almacenmiento
  };


 return (
    <div className="max-w-5xl mx-auto rounded-lg px-4 py-6  text-slate-800">
      <h2 className="text-2xl font-bold text-gray-800 mb-4">Consulta de Proveedores</h2>

      <FiltrosProveedores
        filtros={filtros}
        onChange={handleChange}
        onAplicar={aplicarFiltros}
        onRestaurar={reiniciarFiltros}
      />

      {/* <div className="bg-white shadow-md rounded-md p-6">
        <p className="text-gray-500 italic">Aqui se mostrara la tabla algun dia.</p>
      </div>  */}
      {/* <TablaProveedores clientes={resultados} /> Compornente para renderizar la tabla */}

      <div className="bg-emerald-100 border border-emerald-200 shadow-md rounded-md p-6 ">
        {resultados.length === 0 ? (
          <p className="text-sm text-slate-500 italic">No hay resultados para mostrar. Intenta realizar una busqueda.</p> ) : ( <TablaProveedores clientes={resultados} />)
        }
      </div>

    </div>
  );
}

export default Proveedores;