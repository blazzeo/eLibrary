import React, { useState } from "react";
import "bootstrap/dist/css/bootstrap.css";
import { authenticate } from "../api/DatabaseAPI";
import { toast } from "react-toastify";
import { parseJwt } from "./authContext";
import { useLibrary } from "../../libraryContext";

interface Props {
	noAccountCallback: () => void;
}

const LoginForm: React.FC<Props> = ({ noAccountCallback }) => {
	const [username, setUsername] = useState("");
	const [password, setPassword] = useState("");
	const { setAuthToken } = useLibrary();

	const handleSubmit = async (e) => {
		e.preventDefault();
		try {
			const response = await authenticate(username, password);
			const token = response;
			setAuthToken(token);
			toast.success("Вход выполнен успешно");
		} catch (err) {
			toast.error("Ошибка входа");
		}
	}

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
						placeholder="Введите логин"
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
						placeholder="Введите пароль"
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
				<button className="btn btn-secondary" onClick={noAccountCallback}>
					Нет аккаунта? Создать аккаунт.
				</button>
			</div>
		</div>
	);
};

export default LoginForm;
