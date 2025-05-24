import React from 'react';
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
import { AuthProvider } from "./components/auth/authContext.tsx";
import LoginForm from "./components/auth/loginForm.tsx";
import RegisterForm from "./components/auth/registerForm.tsx";

function Main() {
	console.log('Main component rendering');
	return (
		<AuthProvider>
			<LibraryProvider>
				<App />
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
	);
}

function App() {
	const { user_role, token } = useLibrary();
	console.log('App rendering with token:', token, 'and role:', user_role);

	const getDashboard = () => {
		console.log('getDashboard called with role:', user_role);
		switch (user_role) {
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
		<BrowserRouter>
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
		</BrowserRouter>
	);
}

// Создаем корневой элемент и рендерим приложение
const root = ReactDOM.createRoot(document.getElementById('root') as HTMLElement);
root.render(
	<React.StrictMode>
		<Main />
	</React.StrictMode>
);
