const base_url = 'http://localhost:5000/api/';

// LOGIN:
// Se inicia sesión y se redirige con sucursal
// Salida: { estado, token, user }
export async function login(email, password, servidor) {
  const url = `${base_url}sesion/iniciar`;
  const resp = await fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password, servidor })
  });
  if (!resp.ok) {
    const text = await resp.text().catch(() => '');
    throw new Error(text || 'Credenciales inválidas');
  }
  return resp.json(); // { estado, token, user }
}