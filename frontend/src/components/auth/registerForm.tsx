import React, { useState } from "react";
import "bootstrap/dist/css/bootstrap.css";
import { checkAvailableLogin, createUser } from "../api/DatabaseAPI";
import { toast } from "react-toastify";
import { useNavigate } from "react-router";

const RegisterForm = () => {
	const [username, setUsername] = useState("");
	const [password, setPassword] = useState("");
	const [confirmPassword, setConfirmPassword] = useState("");

	const navigate = useNavigate()

	const handleSubmit = async (event: React.FormEvent) => {
		event.preventDefault();

		try {
			const loginAvailable = await checkAvailableLogin(username);

			if (!loginAvailable.result)
				throw "Логин уже занят"

			if (password !== confirmPassword)
				throw "Пароли должны совпадать"

			await createUser(username, password);
			toast.success('Регистрация прошла успешно')
			navigate('/login')
		} catch (error) {
			console.error(error)
			toast.error(`Ошибка при регистрации пользователя:\n ${error}.`)
		}
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
			</form>
			<div className="mt-3 text-center">
				<button className="btn btn-secondary" onClick={() => navigate('/login')}>
					Уже есть аккаунт? Авторизоваться.
				</button>
			</div>
		</div>
	);
};

export default RegisterForm;
