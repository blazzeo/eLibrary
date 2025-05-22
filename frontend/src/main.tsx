import ReactDOM from "react-dom";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.css';
import UserDashboard from "./pages/user/userDashboard.tsx";
import AdminDashboard from "./pages/admin/adminDashboard.tsx";
import ModerDashboard from "./pages/moder/moderDashboard.tsx";
import { AuthPage } from "./pages/AuthPage.tsx";
import { LibraryProvider, useLibrary } from "./libraryContext";
import 'bootstrap-icons/font/bootstrap-icons.css';
import { AuthProvider } from "./components/auth/authContext.tsx";

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
	const { user_role } = useLibrary();

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
				<Route path="*" element={user_role ? getDashboard() : <Navigate to="/login" />} />
				<Route path="/login" element={user_role ? <Navigate to="/" /> : <AuthPage />} />
				<Route path="/register" element={user_role ? <Navigate to="/" /> : <AuthPage />}
			</Routes>
			<ToastContainer position="bottom-right" autoClose={3000} hideProgressBar />
		</BrowserRouter>
	);
}

ReactDOM.render(<Main />, document.getElementById('root'));
