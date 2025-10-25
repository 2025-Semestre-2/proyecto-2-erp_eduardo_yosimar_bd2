import { Routes, Route, Link } from 'react-router-dom';

function Home() {
return (
    <div className=" flex-3 max-w-5xl mx-auto px-4 py-8" style={{ color: 'oklch(25% 0.02 150)' }}>

      <h1 className="text-3xl font-bold mb-4">Bienvenido al sistema de gestion empresarial</h1>
      <p className="mb-6 text-lg">
        Esta aplicacion pemite consultar información obre clientes, proveedores, inventario, facturas y estadisticas, de los datos registrados en el sistema.
      </p>

      <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">

        {/* Ideas para las card: https://flowbite.com/docs/components/card/ */}
        <div
          className="max-w-sm p-6 rounded-lg"
          style={{backgroundColor: 'oklch(95% 0.01 150)',border: '1px solid oklch(60% 0.03 150)',color: 'oklch(25% 0.02 150)',boxShadow: '0 2px 6px rgba(0,0,0,0.08)',}}>
          <h5 className="mb-2 text-2xl font-bold tracking-tight">Modulo de clientes</h5>
          <p className="mb-3 font-normal">En este modulo podra visualizar todos los clientes registrados en el sistema y se cuenta con opciones para filtrarlos. </p>

          <Link
            to="/Clientes"
            className="inline-flex items-center px-3 py-2 text-sm font-medium rounded-lg transition"
            style={{backgroundColor: 'oklch(45% 0.08 150)',color: 'white',}}
            onMouseOver={(e) => (e.currentTarget.style.backgroundColor = 'oklch(35% 0.08 150)')}
            onMouseOut={(e) => (e.currentTarget.style.backgroundColor = 'oklch(45% 0.08 150)')}>
            Ir al modulo
            <svg className="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
              <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
            </svg>
          </Link>

        </div>

        <div
          className="max-w-sm p-6 rounded-lg"
          style={{backgroundColor: 'oklch(95% 0.01 150)',border: '1px solid oklch(60% 0.03 150)',color: 'oklch(25% 0.02 150)',boxShadow: '0 2px 6px rgba(0,0,0,0.08)',}}>
          <h5 className="mb-2 text-2xl font-bold tracking-tight">Modulo de proveedores</h5>
          <p className="mb-3 font-normal">En este modulo podra visualizar todos los proveedores registrados en el sistema y se cuenta con opciones para filtrarlos. </p>
          <Link
            to="/Proveedores"
            className="inline-flex items-center px-3 py-2 text-sm font-medium rounded-lg transition"
            style={{backgroundColor: 'oklch(45% 0.08 150)',color: 'white',}}
            onMouseOver={(e) => (e.currentTarget.style.backgroundColor = 'oklch(35% 0.08 150)')}
            onMouseOut={(e) => (e.currentTarget.style.backgroundColor = 'oklch(45% 0.08 150)')}>
            Ir al modulo
            <svg className="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
              <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
            </svg>
          </Link>
        </div>

        <div
          className="max-w-sm p-6 rounded-lg"
          style={{backgroundColor: 'oklch(95% 0.01 150)',border: '1px solid oklch(60% 0.03 150)',color: 'oklch(25% 0.02 150)',boxShadow: '0 2px 6px rgba(0,0,0,0.08)',}}>
          <h5 className="mb-2 text-2xl font-bold tracking-tight">Modulo de Inventario</h5>
          <p className="mb-3 font-normal">En este modulo podra visualizar todos los productos del inventario que esten registrados en el sistema y se cuenta con opciones para filtrarlos. </p>
          <Link
            to="/Inventario"
            className="inline-flex items-center px-3 py-2 text-sm font-medium rounded-lg transition"
            style={{backgroundColor: 'oklch(45% 0.08 150)',color: 'white',}}
            onMouseOver={(e) => (e.currentTarget.style.backgroundColor = 'oklch(35% 0.08 150)')}
            onMouseOut={(e) => (e.currentTarget.style.backgroundColor = 'oklch(45% 0.08 150)')}>
            Ir al modulo
            <svg className="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
              <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
            </svg>
          </Link>
        </div>

        <div
          className="max-w-sm p-6 rounded-lg"
          style={{backgroundColor: 'oklch(95% 0.01 150)',border: '1px solid oklch(60% 0.03 150)',color: 'oklch(25% 0.02 150)',boxShadow: '0 2px 6px rgba(0,0,0,0.08)',}}>
          <h5 className="mb-2 text-2xl font-bold tracking-tight">Modulo de facturas</h5>
          <p className="mb-3 font-normal">En este modulo podra visualizar todos las facturas registradas en el sistema y se cuenta con opciones para filtrarlos. </p>
          <Link
            to="/Facturas"
            className="inline-flex items-center px-3 py-2 text-sm font-medium rounded-lg transition"
            style={{backgroundColor: 'oklch(45% 0.08 150)',color: 'white',}}
            onMouseOver={(e) => (e.currentTarget.style.backgroundColor = 'oklch(35% 0.08 150)')}
            onMouseOut={(e) => (e.currentTarget.style.backgroundColor = 'oklch(45% 0.08 150)')}>
            Ir al modulo
            <svg className="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
              <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
            </svg>
          </Link>
        </div>

        <div
          className="max-w-sm p-6 rounded-lg"
          style={{backgroundColor: 'oklch(95% 0.01 150)',border: '1px solid oklch(60% 0.03 150)',color: 'oklch(25% 0.02 150)',boxShadow: '0 2px 6px rgba(0,0,0,0.08)',}}>
          <h5 className="mb-2 text-2xl font-bold tracking-tight">Modulo de Estadisticas</h5>
          <p className="mb-3 font-normal">En este modulo podra visualizar estadisticas de los datos registrados en el sistema y se cuenta con opciones para filtrarlos. </p>
          <Link
            to="/Estadisticas"
            className="inline-flex items-center px-3 py-2 text-sm font-medium rounded-lg transition"
            style={{backgroundColor: 'oklch(45% 0.08 150)',color: 'white',}}
            onMouseOver={(e) => (e.currentTarget.style.backgroundColor = 'oklch(35% 0.08 150)')}
            onMouseOut={(e) => (e.currentTarget.style.backgroundColor = 'oklch(45% 0.08 150)')}>
            Ir al modulo
            <svg className="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
              <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
            </svg>
          </Link>
        </div>

        </div>


    </div>
  );
}

export default Home;

