import { useState } from 'react';

// Imports de componentes.
import FiltrosFacturas from '../Components/FiltrosFacturas.jsx';
import TablaFacturas from '../Components/TablaFacturas.jsx';

// Importar el servicios del API.
import { obtenerFacturasFiltradas } from '../Services/FacturasAPI.js';

function Facturas() {

  // Aqui vamos a definir las variables y ese tipo de cosas.
  
  // Definir las variables para los filtros
  const [filtros, setFiltros] = useState({
    numeroFactura: '',
    nombreCliente: '',
    fechaMinima: '',
    fechaMaxima: '',
    montoMinimo: '',
    montoMaximo: ''
  });
  
  // Defibnir la variable para almacenar los datos de la consulta.
  const [resultados, setResultados] = useState([]);
  
  
  // Aqui podemos definir cosas como funciones que se ocuparan.
  
  const handleChange = (e) => {
    setFiltros({ ...filtros, [e.target.name]: e.target.value });
  };

  const aplicarFiltros = async() => {
    console.log('Aplicando filtros:', filtros);

    if (filtros.fechaMinima && filtros.montoMaximo ) {

      let min = Number(filtros.montoMinimo);
      let max = Number(filtros.montoMaximo);

      if (min > max) {
        alert("Error: En los filtros de cantidad, la cantidad minima debe ser menor a la maxima.")
        return;
      }
    }

    
    if (filtros.fechaMinima && filtros.fechaMaxima) {

      const fechaMin = new Date(filtros.fechaMinima);
      const fechaMax = new Date(filtros.fechaMaxima);

      if (fechaMin > fechaMax) {
        
        alert("Error: En los filtros de fecha, la fecha minima debe ser anterior o igual a la fecha maxima.");
        return;
    }
  }


    // Obtener los datos y guardarlos para que se actulice el contenido de la tabla.
    const datos = await obtenerFacturasFiltradas(filtros);
    setResultados(datos);

  };

  const reiniciarFiltros = async () => {
    setFiltros({ numeroFactura: '', nombreCliente: '', fechaMinima: '', fechaMaxima: '', montoMinimo: '', montoMaximo: '' }); // Borrar los filtros
        console.log('Restaurando filtros');

    // Obtener los datos sin filtrar
    const datos = await obtenerFacturasFiltradas({ numeroFactura: '', nombreCliente: '', fechaMinima: '', fechaMaxima: '', montoMinimo: '', montoMaximo: '' });
    setResultados(datos); // Establecer todos los datos en el almacenmiento

  };


 return (
    <div className="max-w-6xl mx-auto px-4 py-6">
      <h2 className="text-2xl font-bold text-gray-800 mb-4">Facturas</h2>

      <FiltrosFacturas
        filtros={filtros}
        onChange={handleChange}
        onAplicar={aplicarFiltros}
        onRestaurar={reiniciarFiltros}
      />

      <div className="bg-sky-100 border border-sky-200 shadow-md rounded-md p-6 ">

        {resultados.length === 0 ? (
          <p className="text-sm text-slate-500 italic">No hay resultados para mostrar. Intenta realizar una busqueda.</p> ) : ( <TablaFacturas facturas={resultados} />)
        }
        
      </div>

    </div>
  );
}

export default Facturas;