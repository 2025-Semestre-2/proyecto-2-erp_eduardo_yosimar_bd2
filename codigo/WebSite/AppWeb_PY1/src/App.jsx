import { Routes, Route, Navigate } from 'react-router-dom';

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
import Login from './Pages/Login.jsx';

import { RequireAuth, RequireRole } from './Components/ProtectedRoute.jsx';

function App() {
  return (
    <div className='app-container'>
      {/* Header de las paginas, al definirlo aqui lo podermos compartir. */}
      <Header/>

      {/* Aqui se definen las rutas para  para navegan entre ventanas.*/}
      <Routes>
        <Route path="/" element={<Navigate to="/auth" replace />} />
        <Route path="/auth" element={<Login />} />
        <Route element={<RequireAuth />}>
          {/* <Route path="/home" element={<Home />} /> */}

          <Route path="/Clientes" element={
            <RequireRole roles={['Administrador']}>
              <Cliente />
            </RequireRole>
          } />
          <Route path="/Proveedores" element={
            <RequireRole roles={['Administrador']}>
              <Proveedores />
            </RequireRole>
          } />
          <Route path="/Inventario" element={
            <RequireRole roles={['Administrador']}>
              <Inventario />
            </RequireRole>
          } />
          <Route path="/Facturas" element={
            <RequireRole roles={['Administrador']}>
              <Facturas />
            </RequireRole>
          } />
          <Route path="/Estadisticas" element={
            <RequireRole roles={['Corporativo']}>
              <Estadisticas />
            </RequireRole>
          } />
        </Route>

        {/* Fallback */}
        <Route path="*" element={<Navigate to="/auth" replace />} />
      </Routes>
    </div>
  )
}

export default App
