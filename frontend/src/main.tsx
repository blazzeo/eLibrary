import ReactDOM from "react-dom";
import { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.css';
import App from './App.tsx';
import { LoginPage } from "./pages/AuthPage.tsx";
import UserDashboard from "./pages/user/userDashboard.tsx";
import AdminDashboard from "./pages/admin/adminDashboard.tsx";

function Main() {
  const [userRole, setUserRole] = useState<string | null>(null); // Хранит роль пользователя (простой пользователь или администратор)

  useEffect(() => {
    // Проверка авторизации и роли пользователя при монтировании компонента
    const authStatus = sessionStorage.getItem("authorized");
    const role = sessionStorage.getItem("userRole"); // Предполагаем, что роль хранится в sessionStorage

    if (authStatus === "authorized") {
      setUserRole(role);
    }
  }, []);

  return (
    <BrowserRouter>
      <Routes>
        {/* Перенаправляем пользователя в зависимости от его роли */}
        {userRole === 'admin' ? (
          <Route path="/" element={<AdminDashboard />} />
        ) : userRole === 'user' ? (
          <Route path="/" element={<UserDashboard />} />
        ) : (
          <Route path="/login" element={<LoginPage sendData={() => {
            sessionStorage.setItem("authorized", "authorized"); // Установите статус авторизации
            sessionStorage.setItem("userRole", "user"); // Установите роль (или admin в зависимости от логики входа)
            setUserRole("user"); // Обновите состояние
          }} />} />
        )}
        {/* Если пользователь не авторизован, перенаправляем его на страницу входа */}
        <Route path="*" element={<Navigate to="/login" />} />
      </Routes>
    </BrowserRouter>
  );
}

ReactDOM.render(<Main />, document.getElementById('root'));
