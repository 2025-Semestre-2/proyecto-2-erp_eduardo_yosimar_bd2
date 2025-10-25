import { Routes, Route, Link } from 'react-router-dom';

function Home() {
return (
    <div className="flex-3 max-w-5xl mx-auto px-4 py-8">

      <h1 className="text-3xl md:text-4xl font-bold mb-4 text-slate-800">
        Bienvenido al sistema de gestión empresarial
      </h1>
      <p className="mb-8 text-lg text-slate-600 leading-relaxed">
        Esta aplicación permite consultar información sobre clientes, proveedores, inventario, facturas y estadísticas, de los datos registrados en el sistema.
      </p>

      <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">

        {/* Ideas para las card: https://flowbite.com/docs/components/card/ */}
        <div className="bg-white border border-slate-200 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 p-6">
          <h5 className="mb-3 text-xl font-bold tracking-tight text-slate-800">
            Módulo de clientes
          </h5>
          <p className="mb-4 font-normal text-slate-600 leading-relaxed">
            En este módulo podrá visualizar todos los clientes registrados en el sistema y se cuenta con opciones para filtrarlos.
          </p>

          <Link
            to="/Clientes"
            className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-slate-700 rounded-lg hover:bg-slate-800 focus:ring-4 focus:ring-slate-300 transition duration-300">
            Ir al módulo
            <svg className="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
              <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
            </svg>
          </Link>
        </div>

        <div className="bg-white border border-slate-200 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 p-6">
          <h5 className="mb-3 text-xl font-bold tracking-tight text-slate-800">
            Módulo de proveedores
          </h5>
          <p className="mb-4 font-normal text-slate-600 leading-relaxed">
            En este módulo podrá visualizar todos los proveedores registrados en el sistema y se cuenta con opciones para filtrarlos.
          </p>
          <Link
            to="/Proveedores"
            className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 transition duration-300">
            Ir al módulo
            <svg className="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
              <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
            </svg>
          </Link>
        </div>

        <div className="bg-white border border-slate-200 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 p-6">
          <h5 className="mb-3 text-xl font-bold tracking-tight text-slate-800">
            Módulo de Inventario
          </h5>
          <p className="mb-4 font-normal text-slate-600 leading-relaxed">
            En este módulo podrá visualizar todos los productos del inventario que estén registrados en el sistema y se cuenta con opciones para filtrarlos.
          </p>
          <Link
            to="/Inventario"
            className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-indigo-700 rounded-lg hover:bg-indigo-800 focus:ring-4 focus:ring-indigo-300 transition duration-300">
            Ir al módulo
            <svg className="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
              <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
            </svg>
          </Link>
        </div>

        <div className="bg-white border border-slate-200 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 p-6">
          <h5 className="mb-3 text-xl font-bold tracking-tight text-slate-800">
            Módulo de facturas
          </h5>
          <p className="mb-4 font-normal text-slate-600 leading-relaxed">
            En este módulo podrá visualizar todas las facturas registradas en el sistema y se cuenta con opciones para filtrarlos.
          </p>
          <Link
            to="/Facturas"
            className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-sky-700 rounded-lg hover:bg-sky-800 focus:ring-4 focus:ring-sky-300 transition duration-300">
            Ir al módulo
            <svg className="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
              <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M1 5h12m0 0L9 1m4 4L9 9" />
            </svg>
          </Link>
        </div>

        <div className="bg-white border border-slate-200 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 p-6">
          <h5 className="mb-3 text-xl font-bold tracking-tight text-slate-800">
            Módulo de Estadísticas
          </h5>
          <p className="mb-4 font-normal text-slate-600 leading-relaxed">
            En este módulo podrá visualizar estadísticas de los datos registrados en el sistema y se cuenta con opciones para filtrarlos.
          </p>
          <Link
            to="/Estadisticas"
            className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-slate-600 rounded-lg hover:bg-slate-700 focus:ring-4 focus:ring-slate-300 transition duration-300">
            Ir al módulo
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

