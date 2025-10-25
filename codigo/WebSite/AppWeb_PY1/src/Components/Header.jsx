
// Imports para el programa.
import { Routes, Route, Link } from 'react-router-dom';

// Importar paginas;
import Home from '../Pages/Home.jsx';
import Cliente from '../Pages/Clientes.jsx';

// Imports de estilos.
// import '../Styles/';

function Header() {
  return (
  <header className="bg-emerald-600 shadow-md">

      <div className="max-w-7xl mx-auto px-4 py-4 flex items-center justify-between">

        <h1 className="text-2xl font-bold text-white tracking-tight">
          Wide World Importers  
        </h1>

        <nav className="space-x-6 text-emerald-100 font-medium">

          <Link to="/" className="hover:text-white transition">Inicio</Link>
          <Link to="/Clientes" className="hover:text-white transition">Clientes</Link>
          <Link to="/Proveedores" className="hover:text-white transition">Proveedores</Link>
          <Link to="/Inventario" className="hover:text-white transition">Inventario</Link>
          <Link to="/Facturas" className="hover:text-white transition">Facturas</Link>
          <Link to="/Estadisticas" className="hover:text-white transition">Estadisticas</Link>

        </nav>

      </div>

    </header>
  );
}

export default Header;
