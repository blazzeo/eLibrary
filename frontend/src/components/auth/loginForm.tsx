import React, { useState } from "react";
import "bootstrap/dist/css/bootstrap.css";
import { checkUser } from "../api/DatabaseAPI";
import { UserData } from "../structs";

interface Props {
	authorizeCallback: (authData: UserData, user_role: string) => void;
	noAccountCallback: () => void;
}

const LoginForm: React.FC<Props> = ({ authorizeCallback, noAccountCallback }) => {
	const [username, setUsername] = useState("");
	const [password, setPassword] = useState("");
	const [isLoading, setLoading] = useState(false);
	const [error, setError] = useState<string | null>(null);

	const handleSubmit = async (event: React.FormEvent) => {
		event.preventDefault();
		setError(null); // Clear any previous error messages

		try {
			setLoading(true);
			const userData: UserData = { username, password };
			const userRole = await checkUser(userData);
			setLoading(false);
			if (userRole.result == 'admin' || userRole.result == 'user') {
				authorizeCallback(userData, userRole.result);
			} else {
				setError("User not found. Please check your credentials.")
				throw "User not found."
			}
		} catch (err) {
			console.error("Error checking user:", err);
			setError("User not found.");
		}
		setTimeout(() => {
			setError(null);
			setLoading(false);
		}, 3000);
	};

	return (
		<div className="container-sm mt-5">
			<h2 className="mb-4 text-center">Login</h2>
			<form onSubmit={handleSubmit}>
				<div className="mb-3">
					<label htmlFor="username" className="form-label">
						Username
					</label>
					<input
						type="text"
						className="form-control"
						placeholder="Enter your username"
						id="username"
						value={username}
						onChange={(e) => setUsername(e.target.value)}
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="password" className="form-label">
						Password
					</label>
					<input
						type="password"
						className="form-control"
						placeholder="Enter your password"
						id="password"
						value={password}
						onChange={(e) => setPassword(e.target.value)}
						required
					/>
				</div>
				{error && <div className="alert alert-danger">{error}</div>}
				<button type="submit" className="btn btn-primary w-100">
					Login
				</button>
			</form>
			<div className="mt-3 text-center">
				<button onClick={() => noAccountCallback()}>
					Don't have an account? Register here.
				</button>
			</div>
			{isLoading ? (
				<div className="d-flex justify-content-center absolute">
					<div className="spinner-border" role="status">
						<span className="visually-hidden">Loading...</span>
					</div>
				</div>
			) : null}
		</div>
	);
};

export default LoginForm;
