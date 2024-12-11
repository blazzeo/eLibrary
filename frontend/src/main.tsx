import ReactDOM from "react-dom";
import { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.css';
import { AuthPage } from "./pages/AuthPage.tsx";
import UserDashboard from "./pages/user/UserDashboard.tsx";
import AdminDashboard from "./pages/admin/AdminDashboard.tsx";
import { BookShelf } from "./components/libTable/BookShelf.tsx";


function Main() {
  const [userRole, setUserRole] = useState<string | null>(null);

  setInterval(() => {
    if (sessionStorage.getItem("userRole") === null && userRole !== null) {
      setUserRole(null)
    }
  }, 500)

  useEffect(() => {
    sessionStorage.setItem("userRole", "user");
    const role = sessionStorage.getItem("userRole");
    setUserRole(role);
  }, []);

  function setRole(user_role: string) {
    sessionStorage.setItem("userRole", user_role);
    setUserRole(user_role);
  }

  const authorizedHandler = () => {
    if (userRole === null) {
      return <Route path="*" element={<Navigate to="/login" />} />
    }

    switch (userRole) {
      case 'admin':
        return <Route path="/" element={<AdminDashboard />} />;
      case 'user':
        return <Route path="/" element={<UserDashboard />} />;
    }
  }

  return (
    <BrowserRouter>
      <Routes>
        {authorizedHandler()}
        <Route path="/mybooks" element={<BookShelf />} />
        <Route path="/login" element={userRole ? <Navigate to="/" /> : <AuthPage setRole={setRole} />} />
      </Routes>
    </BrowserRouter>
  );
}

ReactDOM.render(<Main />, document.getElementById('root'));
