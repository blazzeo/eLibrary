import React, { useState } from "react";
import "bootstrap/dist/css/bootstrap.css";
import { authenticate } from "../api/DatabaseAPI";
import { toast } from "react-toastify";

interface Props {
	authorizeCallback: (user_name: string, user_role: string) => void;
	noAccountCallback: () => void;
}

const user_roles = ['user', 'admin', 'moder']

const LoginForm: React.FC<Props> = ({ authorizeCallback, noAccountCallback }) => {
	const [username, setUsername] = useState("");
	const [password, setPassword] = useState("");

	const handleSubmit = async (event: React.FormEvent) => {
		event.preventDefault();

		try {
			const userRole = await authenticate(username, password);
			if (user_roles.includes(userRole.result))
				authorizeCallback(username, userRole.result);
			else
				throw "User not found"

			toast.success("Вход выполнен успешно")
		} catch (err) {
			console.error("Error checking user:", err);
			toast.error("Пользователь не был найден. Пожалуйста, проверьте учетные данные.")
		}
		setTimeout(() => {
		}, 3000);
	};

	return (
		<div className="w-25 container-sm mt-5">
			<h2 className="mb-4 text-center">Авторизация</h2>
			<form onSubmit={handleSubmit}>
				<div className="mb-3">
					<label htmlFor="username" className="form-label">
						Логин
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
						Пароль
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
				<button type="submit" className="btn btn-primary w-100">
					Войти
				</button>
			</form>
			<div className="mt-3 text-center">
				<button className="btn btn-secondary" onClick={() => noAccountCallback()}>
					Нет аккаунта? Создать аккаунт.
				</button>
			</div>
		</div>
	);
};

export default LoginForm;
