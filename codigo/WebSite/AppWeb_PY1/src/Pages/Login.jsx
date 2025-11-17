import { useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import { login } from "../Services/AuthAPI.js";
import { useAuth } from "../Context/AuthContext.jsx";

export default function Login() {
  // Estados para formulario y estados de carga/error
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [servidor, setServidor] = useState("SanJose");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const auth = useAuth();
  const navigate = useNavigate();
  const location = useLocation();
  const from = location.state?.from?.pathname;

  const onSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError("");
    try {
      const res = await login(email, password, servidor);
      if (!res?.estado) {
        setError("Credenciales No válidas o usuario inactivo");
        setLoading(false);
        return;
      }
      auth.loginSuccess({ user: res.user, token: res.token });

      if (from && from !== "/auth") {
        navigate(from, { replace: true });
      } else if (res.user?.rol === "Administrador") {
        navigate("/Clientes", { replace: true });
      } else if (res.user?.rol === "Corporativo") {
        navigate("/Estadisticas", { replace: true });
      } else {
        navigate("/auth", { replace: true });
      }
    } catch (err) {
      setError("No se pudo iniciar sesión, intente nuevamente.");
      console.error(err);
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-slate-50">
      <form
        onSubmit={onSubmit}
        className="w-full max-w-sm bg-white p-6 rounded-lg shadow"
      >
        <h1 className="text-xl font-semibold mb-4 text-slate-800">
          Iniciar sesión
        </h1>

        <label className="block mb-2 text-sm font-medium text-slate-700">
          Email
        </label>
        <input
          className="w-full mb-4 border rounded px-3 py-2"
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />

        <label className="block mb-2 text-sm font-medium text-slate-700">
          Contraseña
        </label>
        <input
          className="w-full mb-4 border rounded px-3 py-2"
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />

        <label className="block mb-2 text-sm font-medium text-slate-700">
          Sucursal / Servidor
        </label>
        <select
          className="w-full mb-4 border rounded px-3 py-2"
          value={servidor}
          onChange={(e) => setServidor(e.target.value)}
        >
          <option value="SanJose">San José</option>
          <option value="Limon">Limón</option>
          <option value="Corporativo">Corporativo</option>
        </select>

        {error && <p className="text-red-600 text-sm mb-3">{error}</p>}

        <button
          disabled={loading}
          type="submit"
          className="w-full bg-slate-700 hover:bg-slate-800 text-white py-2 rounded"
        >
          {loading ? "Ingresando..." : "Ingresar"}
        </button>
      </form>
    </div>
  );
}
