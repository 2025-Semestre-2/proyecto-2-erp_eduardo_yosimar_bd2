// Imports para el programa.
import { Routes, Route, Link } from 'react-router-dom';
import { useState } from 'react';

// Importar paginas;
import Home from '../Pages/Home.jsx';
import Cliente from '../Pages/Clientes.jsx';

// Imports de estilos.
// import '../Styles/';

function Header() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <header className="bg-sky-950 shadow-md">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16 sm:h-20">
          
          <h1 className="text-lg sm:text-xl md:text-2xl font-bold text-white tracking-tight truncate">
            <Link to="/" onClick={() => setIsMenuOpen(false)} aria-label="Ir a inicio" className="inline-block">
              <span className="hidden sm:inline">ERP - Wide World Importers</span>
              <span className="sm:hidden"> ERP - WWI</span>
            </Link>
          </h1>

          {/* navbar para desktop */}
          <nav className="hidden md:flex space-x-4 lg:space-x-6 text-sky-100 font-medium">
            <Link to="/" className="hover:text-white transition px-2 py-1">Inicio</Link>
            <Link to="/Clientes" className="hover:text-white transition px-2 py-1">Clientes</Link>
            <Link to="/Proveedores" className="hover:text-white transition px-2 py-1">Proveedores</Link>
            <Link to="/Inventario" className="hover:text-white transition px-2 py-1">Inventario</Link>
            <Link to="/Facturas" className="hover:text-white transition px-2 py-1">Facturas</Link>
            <Link to="/Estadisticas" className="hover:text-white transition px-2 py-1">Estadísticas</Link>
          </nav>

          {/* Boton para abrir el menu hamburguesa*/}
          <button 
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            className="md:hidden text-white hover:text-sky-200 focus:outline-none focus:ring-2 focus:ring-sky-300 p-2"
            aria-label="Abrir menú"
          >
            <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              {isMenuOpen ? (
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              ) : (
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
              )}
            </svg>
          </button>
        </div>

        {/*menu hamburguesa solo para movil*/}
        {isMenuOpen && (
          <div className="md:hidden border-t border-sky-500">
            <nav className="py-4 space-y-2">
              <Link 
                to="/" 
                className="block text-sky-100 hover:text-white hover:bg-sky-700 px-4 py-2 transition rounded"
                onClick={() => setIsMenuOpen(false)}
              >
                Inicio
              </Link>
              <Link 
                to="/Clientes" 
                className="block text-sky-100 hover:text-white hover:bg-sky-700 px-4 py-2 transition rounded"
                onClick={() => setIsMenuOpen(false)}
              >
                Clientes
              </Link>
              <Link 
                to="/Proveedores" 
                className="block text-sky-100 hover:text-white hover:bg-sky-700 px-4 py-2 transition rounded"
                onClick={() => setIsMenuOpen(false)}
              >
                Proveedores
              </Link>
              <Link 
                to="/Inventario" 
                className="block text-sky-100 hover:text-white hover:bg-sky-700 px-4 py-2 transition rounded"
                onClick={() => setIsMenuOpen(false)}
              >
                Inventario
              </Link>
              <Link 
                to="/Facturas" 
                className="block text-sky-100 hover:text-white hover:bg-sky-700 px-4 py-2 transition rounded"
                onClick={() => setIsMenuOpen(false)}
              >
                Facturas
              </Link>
              <Link 
                to="/Estadisticas" 
                className="block text-sky-100 hover:text-white hover:bg-sky-700 px-4 py-2 transition rounded"
                onClick={() => setIsMenuOpen(false)}
              >
                Estadísticas
              </Link>
            </nav>
          </div>
        )}
      </div>
    </header>
  );
}

export default Header;
