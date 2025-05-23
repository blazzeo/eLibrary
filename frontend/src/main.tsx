import ReactDOM from "react-dom";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { useState } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.css';
import UserDashboard from "./pages/user/userDashboard.tsx";
import AdminDashboard from "./pages/admin/adminDashboard.tsx";
import ModerDashboard from "./pages/moder/moderDashboard.tsx";
import { AuthPage } from "./pages/AuthPage.tsx";
import { LibraryProvider } from "./libraryContext";
import 'bootstrap-icons/font/bootstrap-icons.css';

function Main() {
	const [userRole, setUserRole] = useState<string | null>(null);

	setInterval(() => {
		if (sessionStorage.getItem("userRole") == null && userRole != null) {
			setUserRole(null)
		}
	}, 500)

	function setRole(user_role: string) {
		setUserRole(user_role);
		sessionStorage.setItem("userRole", user_role);
	}

	const getDashboard = () => {
		switch (userRole) {
			case 'user':
				return <UserDashboard />
			case 'admin':
				return <AdminDashboard />
			case 'moder':
				return <ModerDashboard />
		}
	}

	return (
		<>
			<LibraryProvider>
				<BrowserRouter>
					<Routes>
						<Route path="*" element={userRole ? getDashboard() : <Navigate to="/login" />} />
						<Route path="/login" element={userRole ? <Navigate to="/" /> : <AuthPage setRole={setRole} />} />
					</Routes>
				</BrowserRouter>
				<ToastContainer position="bottom-right" autoClose={3000} hideProgressBar />
			</LibraryProvider>
		</>
	);
}

ReactDOM.render(<Main />, document.getElementById('root'));
