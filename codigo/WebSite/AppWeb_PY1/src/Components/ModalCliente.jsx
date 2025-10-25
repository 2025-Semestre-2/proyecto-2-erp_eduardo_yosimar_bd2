// Aqui vamos a definir el componente que sera el modal para mostrar los datos detallados de un cliente.

// Hacer import del componente del mapa.
import Mapa from './Mapa.jsx';

export default function ModalCliente({ cliente, onClose }) {

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black ">
            <div className="bg-emerald-50 text-slate-800 rounded-lg shadow-lg w-full max-w-3xl max-h-[90vh] overflow-y-auto relative   ">
                
                {/* Un botoncito para cerrar el modal, tambien se podria buscar un icono para que quede mejor. */}
                <button
                    onClick={onClose}
                    className="absolute top-3 right-3 text-gray-500 hover:text-red-600 text-xl font-bold">
                    X
                </button>

                <div className="p-6">
                    <h2 className="text-2xl font-bold text-slate-800 mb-4">Detalles del Cliente</h2>

                    {/* Seccion para mostrar los datos del cliente. */}
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-gray-800">
                        
                        <div>
                            <strong>Identificador de cliente:</strong> {cliente.ClienteID}
                        </div>

                        <div>
                            <strong>Nombre:</strong> {cliente.NombreCliente}
                        </div>

                        <div>
                            <strong>Categoria:</strong> {cliente.Categoria}
                        </div>

                        <div>
                            <strong>Grupo de compra:</strong> {cliente.GrupoDeCompra || '—'}
                        </div>

                        <div>
                            <strong>Contacto primario:</strong> {cliente.ContactoPrimario}
                        </div>

                        <div>
                            <strong>Telefono del contacto primario:</strong> {cliente.TelefonoCP}
                        </div>

                        <div>
                            <strong>Correo del contacto primario:</strong> {cliente.CorreoCP}
                        </div>
                        
                        <div>
                            <strong>Contacto secundario:</strong> {cliente.ContactoSecundario || '—'}
                        </div>

                        <div>
                            <strong>Telefono del contacto secundario:</strong> {cliente.TelefonoCS || '—'}
                        </div>

                        <div>
                            <strong>Correo del contacto secundario:</strong> {cliente.CorreoCS || '—'}
                        </div>

                        <div>
                            <strong>Cliente para facturar:</strong> {cliente.ClienteParaFacturar}
                        </div>

                        <div>
                            <strong>Metodo de entrega:</strong> {cliente.MetodoDeEntrega}
                        </div>

                        <div>
                            <strong>Ciudad de entrega:</strong> {cliente.CiudadDeEntrega}
                        </div>

                        <div>
                            <strong>Codigo postal:</strong> {cliente.CodigoPostal}
                        </div>

                        <div>
                            <strong>Telefono del cliente:</strong> {cliente.NumeroTelefonico}
                        </div>

                        <div>
                            <strong>FAX:</strong> {cliente.FAX}
                        </div>

                        <div>
                            <strong>Dia de gracia para pagar:</strong> {cliente.DiasParaPagar}
                        </div>

                        <div>
                            <strong>Sitio web:</strong>{' '}
                            <a href={cliente.SitioWeb} target="_blank" rel="noopener noreferrer" className="text-blue-600 underline">
                                {cliente.SitioWeb}
                            </a>
                        </div>

                        <div>
                            <strong>Direccion envio 1:</strong> {cliente.DireccionEnvio1}
                        </div>

                        <div>
                            <strong>Direccion envio 2:</strong> {cliente.DireccionEnvio2}
                        </div>

                        <div>
                            <strong>Codigo postal linea 1:</strong> {cliente.CodigoPostalLinea1}
                        </div>

                        <div>
                            <strong>Codigo postal linea 2:</strong> {cliente.CodigoPostalLinea2}
                        </div>

                        {/* Esto de la fecha esta raro, hay que hacer como un  parser o algo asi. */}
                        <div>
                            <strong>Fecha apertura cuenta:</strong> {new Date(cliente.FechaAperturaCuenta).toLocaleDateString()}
                        </div>

                    </div>

                    {/* En esta seccion va el mapa que se hara con leaflet */}
                    <div className="mt-6">
                        <h3 className="text-lg font-semibold text-gray-700 mb-2">Ubicacion en el mapa</h3>
                        <div className="w-full h-64 bg-gray-100 border border-dashed border-gray-300 rounded flex items-center justify-center text-gray-500 italic">
                            {/* Aqui va ese mapa, algun dia. */}
                            <Mapa ubicacion={cliente.Localizacion?.points?.[0]} />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    );
}
