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

  useEffect(() => {
    const role = sessionStorage.getItem("userRole");
    setUserRole(role);
  }, []);

  function setRole(user_role: string) {
    sessionStorage.setItem("userRole", user_role);
    setUserRole(user_role);
  }

  return (
    <BrowserRouter>
      <Routes>
        {userRole === 'admin' ? (
          <Route path="/" element={<AdminDashboard />} />
        ) : userRole === 'user' ? (
          <Route path="/" element={<UserDashboard />} />
        ) : (
          <Route path="/login" element={<AuthPage setRole={setRole} />} />
        )}
        <Route path="/mybooks" element={<BookShelf />} />
        <Route path="*" element={<Navigate to={userRole ? "/" : "/login"} />} />
      </Routes>
    </BrowserRouter>
  );
}

ReactDOM.render(<Main />, document.getElementById('root'));
