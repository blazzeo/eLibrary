import ReactDOM from "react-dom";
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
	return (
		<AuthProvider>
			<LibraryProvider>
				<App />
			</LibraryProvider>
		</AuthProvider>
	);
}

function App() {
	const { user_role, token } = useLibrary();

	const getDashboard = () => {
		switch (user_role) {
			case 'user':
				return <UserDashboard />;
			case 'admin':
				return <AdminDashboard />;
			case 'moder':
				return <ModerDashboard />;
			default:
				return null;
		}
	};

	return (
		<BrowserRouter>
			<Routes>
				{!token ? (
					<>
						<Route path="*" element={<Navigate to="/login" />} />
						<Route path="/login" element={<LoginForm />} />
						<Route path="/register" element={<RegisterForm />} />
					</>
				) : (
					<>
						<Route path="/" element={getDashboard()} />
						<Route path="/request/*" element={getDashboard()} />
						<Route path="/books/*" element={getDashboard()} />
						<Route path="/users/*" element={getDashboard()} />
						<Route path="*" element={<Navigate to="/" />} />
					</>
				)}
			</Routes>
			<ToastContainer position="bottom-right" autoClose={3000} hideProgressBar />
		</BrowserRouter>
	);
}
