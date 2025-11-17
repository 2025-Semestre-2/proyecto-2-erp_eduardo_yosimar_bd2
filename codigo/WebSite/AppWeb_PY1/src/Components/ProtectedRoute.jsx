import { Navigate, Outlet, useLocation } from 'react-router-dom';
import { useAuth } from '../Context/AuthContext.jsx';

export function RequireAuth() {
  const auth = useAuth();
  const location = useLocation();
  if (!auth.isAuthenticated) {
    return <Navigate to="/auth" replace state={{ from: location }} />;
  }
  return <Outlet />;
}

export function RequireRole({ roles, children }) {
  const auth = useAuth();
  if (!auth.isAuthenticated) return <Navigate to="/auth" replace />;
  if (roles && !roles.includes(auth.user?.rol)) return <Navigate to="/auth" replace />;
  return children;
}