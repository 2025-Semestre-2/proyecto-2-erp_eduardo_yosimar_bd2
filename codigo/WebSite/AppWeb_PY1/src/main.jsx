import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom';
import './Styles/index.css'
import 'leaflet/dist/leaflet.css'; // Para lo del mapa.
import App from './App.jsx'
import { AuthProvider } from './Context/AuthContext.jsx'

// Hay que instalar estas dependencias, parece que no se agregaron al package.json, asi que depues en windows podemos ver eso.
// npm install leaflet react-leaflet
// npm install react-router-dom
createRoot(document.getElementById('root')).render(
  <StrictMode>
    <BrowserRouter>
      <AuthProvider>
        <App />
      </AuthProvider>
    </BrowserRouter>
  </StrictMode>,
)
