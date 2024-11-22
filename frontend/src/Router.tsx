import Register from './pages/register';
import Login from './pages/login';
import Dashboard from './pages/dashboard';

function Router() {
  // Get Cookies
  // Have Cookies(Auth Info)?
  // Yes -> Dashboard
  // No -> Register / Login forms
  
  let hasAuthorized = GetCookies();

  return(
    hasAuthorized ? <Dashboard /> : <Register />
  );
}

export default Router;
