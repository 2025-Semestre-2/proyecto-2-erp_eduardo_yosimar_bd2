import { MapContainer, TileLayer, Marker, Popup } from 'react-leaflet';
import L from 'leaflet';

// Icono.
const iconoCliente = new L.Icon({
  iconUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png',
  iconSize: [25, 41],
  iconAnchor: [12, 41],
  popupAnchor: [1, -34],
});

export default function Mapa({ ubicacion }) {
  if (!ubicacion || !ubicacion.lat || !ubicacion.lng) {
    return (
      <div className="w-full h-64 bg-gray-100 border border-dashed border-gray-300 rounded flex items-center justify-center text-gray-500 italic">
        Ubicacion no disponible
      </div>
    );
  }

    return (
        <MapContainer
            center={[ubicacion.lat, ubicacion.lng]}
            zoom={13}
            scrollWheelZoom={false}
            className="w-full h-64 rounded border"
            >
            <TileLayer
                attribution='&copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a>'
                url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
            />

            <Marker position={[ubicacion.lat, ubicacion.lng]} icon={iconoCliente}>
                <Popup>Ubicacion del cliente</Popup>
            </Marker>

        </MapContainer>
    );
}
