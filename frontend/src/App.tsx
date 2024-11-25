import { useState } from "react";
import { LoginPage } from "./pages/AuthPage";
import Dashboard from "./pages/user/userDashboard";

export default function App() {
  const [authorized, setAuthorized] = useState(
    sessionStorage.getItem("authorized") === "authorized" ? true : false
  );

  function authorize() {
    setAuthorized(true);
  }

  return authorized ? <Dashboard /> : <LoginPage sendData={authorize} />;
}
