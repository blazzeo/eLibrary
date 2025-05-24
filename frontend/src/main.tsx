import React, { useEffect } from 'react';
import ReactDOM from "react-dom/client";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.css';
import UserDashboard from "./pages/user/userDashboard.tsx";
import AdminDashboard from "./pages/admin/adminDashboard.tsx";
import ModerDashboard from "./pages/moder/moderDashboard.tsx";
import { LibraryProvider, useLibrary } from "./libraryContext";
import 'bootstrap-icons/font/bootstrap-icons.css';
import { AuthProvider, useAuth } from "./components/auth/authContext.tsx";
import LoginForm from "./components/auth/loginForm.tsx";
import RegisterForm from "./components/auth/registerForm.tsx";
import { setupAxiosInterceptors } from "./components/auth/axiosInstanse.tsx";

function Main() {
	console.log('Main component rendering');
	return (
		<BrowserRouter>
			<AuthProvider>
				<LibraryProvider>
					<AppWithAuth />
					<ToastContainer
						position="top-right"
						autoClose={3000}
						hideProgressBar={false}
						newestOnTop
						closeOnClick
						rtl={false}
						pauseOnFocusLoss
						draggable
						pauseOnHover
						theme="light"
					/>
				</LibraryProvider>
			</AuthProvider>
		</BrowserRouter>
	);
}

function AppWithAuth() {
	const { logout } = useAuth();
	const { user, token } = useLibrary();

	useEffect(() => {
		// Настраиваем интерцепторы при монтировании компонента
		setupAxiosInterceptors(logout);
	}, [logout]);

	const getDashboard = () => {
		// Если токен есть, но пользователь еще не загружен, показываем загрузку
		if (token && !user) {
			return (
				<div className="d-flex justify-content-center align-items-center" style={{ height: "80vh" }}>
					<div className="spinner-border text-primary" role="status">
						<span className="visually-hidden">Загрузка...</span>
					</div>
				</div>
			);
		}

		switch (user?.user_role) {
			case 'user':
				return <UserDashboard />;
			case 'admin':
				return <AdminDashboard />;
			case 'moder':
				return <ModerDashboard />;
			default:
				console.log('No role found, redirecting to login');
				return <Navigate to="/login" />;
		}
	};

	return (
		<Routes>
			{!token ? (
				<>
					<Route path="/login" element={<LoginForm />} />
					<Route path="/register" element={<RegisterForm />} />
					<Route path="*" element={<Navigate to="/login" />} />
				</>
			) : (
				<>
					<Route path="/*" element={getDashboard()} />
				</>
			)}
		</Routes>
	);
}

// Создаем корневой элемент и рендерим приложение
const root = ReactDOM.createRoot(document.getElementById('root') as HTMLElement);
root.render(
	<React.StrictMode>
		<Main />
	</React.StrictMode>
);
