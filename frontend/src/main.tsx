import ReactDOM from "react-dom";
import { useState } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.css';
import UserDashboard from "./pages/user/userDashboard.tsx";
import AdminDashboard from "./pages/admin/adminDashboard.tsx";
import ModerDashboard from "./pages/moder/moderDashboard.tsx";
import { AuthPage } from "./pages/authPage.tsx";

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
		<BrowserRouter>
			<Routes>
				<Route path="*" element={userRole ? getDashboard() : <Navigate to="/login" />} />
				<Route path="/login" element={userRole ? <Navigate to="/" /> : <AuthPage setRole={setRole} />} />
			</Routes>
		</BrowserRouter>
	);
}

ReactDOM.render(<Main />, document.getElementById('root'));
