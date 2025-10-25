import { useState } from 'react';
import { Routes, Route, Link } from 'react-router-dom';

// Importar estilos
import './App.css';

// Importar Componentes.
import Header from './Components/Header.jsx';

// Importar paginas;
import Home from './Pages/Home.jsx';
import Cliente from './Pages/Clientes.jsx';
import Proveedores from './Pages/Proveedores.jsx';
import Inventario from './Pages/Inventario.jsx';
import Facturas from './Pages/Facturas.jsx';
import Estadisticas from './Pages/Estadisticas.jsx';



function App() {
  // const [count, setCount] = useState(0)

  return (
    <div >
      {/* Header de las paginas, al definirlo aqui lo podermos compartir. */}
      <Header/>

      {/* Aqui se definen las rutas para  para navegan entre ventanas.*/}
      <Routes>
        
        <Route path="/" element={<Home />} />
        <Route path="/Clientes" element={<Cliente />} />
        <Route path="/Proveedores" element={<Proveedores />} />
        <Route path="/Inventario" element={<Inventario />} />
        <Route path="/Facturas" element={<Facturas />} />
        <Route path="/Estadisticas" element={<Estadisticas />} />
        
      </Routes>


    </div>
  )
}

export default App
