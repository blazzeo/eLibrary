import React, { useState } from "react";
import "bootstrap/dist/css/bootstrap.css";
import { checkAvailableLogin, createUser } from "../api/DatabaseAPI";

interface Props {
	createAccountCallback: () => void;
}

const RegisterForm: React.FC<Props> = ({ createAccountCallback }: Props) => {
	const [isLoading, setLoading] = useState(false);
	const [error, setError] = useState<string | null>(null);
	const [username, setUsername] = useState("");
	const [password, setPassword] = useState("");
	const [confirmPassword, setConfirmPassword] = useState("");

	const handleSubmit = async (event: React.FormEvent) => {
		event.preventDefault();

		setLoading(true);
		setError(null)
		const loginAvailable = await checkAvailableLogin(username);

		if (!loginAvailable.result) {
			setError("Username isn't available.");
			setLoading(false)
			return;
		}
		setLoading(false);

		if (password !== confirmPassword) {
			setError("Passwords don't match.");
			return;
		}

		setLoading(true);
		const canCreate = await createUser(username, password);

		if (!canCreate.result) {
			setError("Creating account failed.");
			setLoading(false)
			return;
		}
		setLoading(false);

		createAccountCallback();
	};

	return (
		<div className="w-25 container-sm mt-5">
			<h2 className="mb-4 text-center">Регистрация</h2>
			<form onSubmit={handleSubmit}>
				<div className="mb-3">
					<label htmlFor="username" className="form-label">
						Логин
					</label>
					<input
						type="text"
						className="form-control"
						placeholder="Username"
						id="username"
						value={username}
						onChange={(e) => setUsername(e.target.value)}
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="password" className="form-label">
						Пароль
					</label>
					<input
						type="password"
						className="form-control"
						placeholder="Password"
						id="password"
						value={password}
						onChange={(e) => setPassword(e.target.value)}
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="confirmPassword" className="form-label">
						Подтвердите пароль
					</label>
					<input
						type="password"
						className="form-control"
						placeholder="Confirm Password"
						id="confirmPassword"
						value={confirmPassword}
						onChange={(e) => setConfirmPassword(e.target.value)}
						required
					/>
				</div>
				<button type="submit" className="btn btn-primary w-100">
					Зарегистрироваться
				</button>
				{error && <div className="alert alert-danger">{error}</div>}
			</form>
			<div className="mt-3 text-center">
				<button onClick={() => createAccountCallback()}>
					Уже есть аккаунт? Авторизоваться.
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

export default RegisterForm;
