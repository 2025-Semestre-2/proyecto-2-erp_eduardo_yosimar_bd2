import { useState } from 'react';

// Imports de componentes.
import FiltrosInventario from '../Components/FiltrosInventario.jsx';
import TablaInventario from '../Components/TablaInventario.jsx';

// Importar el servicios del API.
import { obtenerInventarioFiltrado } from '../Services/InventarioAPI.js';

function Inventario() {

  // Aqui vamos a definir las variables y ese tipo de cosas.
  
  // Definir las variables para los filtros
  const [filtros, setFiltros] = useState({
    nombreproducto: '',
    grupo: '',
    cantidadMinima: '',
    cantidadMaxima: ''
  });
  
  // Defibnir la variable para almacenar los datos de la consulta.
  const [resultados, setResultados] = useState([]);
  
  
  // Aqui podemos definir cosas como funciones que se ocuparan.
  
  const handleChange = (e) => {
    setFiltros({ ...filtros, [e.target.name]: e.target.value });
  };

  const aplicarFiltros = async() => {
    console.log('Aplicando filtros:', filtros);

    if (filtros.cantidadMinima && filtros.cantidadMaxima ) {

      let min = Number(filtros.cantidadMinima);
      let max = Number(filtros.cantidadMaxima);

      if (min > max) {
        alert("Error: En los filtros de cantidad, la cantidad minima debe ser menor a la maxima.")
        return;
      }
    }

    // Obtener los datos y guardarlos para que se actulice el contenido de la tabla.
    const datos = await obtenerInventarioFiltrado(filtros);
    setResultados(datos);

  };

  const reiniciarFiltros = async () => {
    setFiltros({ nombreproducto: '', grupo: '', cantidadMinima: '', cantidadMaxima: '' }); // Borrar los filtros
    console.log('Restaurando filtros');

    // Obtener los datos sin filtrar
    const datos = await obtenerInventarioFiltrado({ nombreproducto: '', grupo: '', cantidadMinima: '', cantidadMaxima: '' });
    setResultados(datos); // Establecer todos los datos en el almacenmiento

  };


 return (
    <div className="max-w-5xl mx-auto rounded-lg px-4 py-6  text-slate-800">
      <h2 className="text-2xl font-bold text-gray-800 mb-4">Inventario de Productos</h2>

      <FiltrosInventario
        filtros={filtros}
        onChange={handleChange}
        onAplicar={aplicarFiltros}
        onRestaurar={reiniciarFiltros}
      />

      {/* <TablaInventario productos={resultados} /> */}

      <div className="bg-emerald-100 border border-emerald-200 shadow-md rounded-md p-6 ">
        {resultados.length === 0 ? (
          <p className="text-sm text-slate-500 italic">No hay resultados para mostrar. Intenta realizar una busqueda.</p> ) : ( <TablaInventario productos={resultados} />)
        }
      </div>


    </div>
  );
}

export default Inventario;