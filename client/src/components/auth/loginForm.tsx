import React, { useState } from "react";
import "bootstrap/dist/css/bootstrap.css";
import { authenticate } from "../../api/DatabaseAPI.tsx";
import { toast } from "react-toastify";
import { useLibrary } from "../../context/libraryContext";
import { useAuth } from "../../context/authContext";
import { useNavigate } from "react-router";
import { Spinner } from "react-bootstrap";

const LoginForm: React.FC = () => {
	const [username, setUsername] = useState("");
	const [password, setPassword] = useState("");
	const [isLoading, setIsLoading] = useState(false);
	const { setAuthToken } = useLibrary();
	const { login } = useAuth();
	const navigate = useNavigate();

	const handleSubmit = async (event: React.FormEvent) => {
		event.preventDefault();
		if (isLoading) return;

		setIsLoading(true);
		try {
			const token = await authenticate(username, password);

			// Очищаем форму
			setUsername("");
			setPassword("");

			// Устанавливаем токен в оба контекста
			setAuthToken(token);
			login(token);

			toast.success("Вход выполнен успешно");

			// Перенаправляем на главную
			navigate("/");
		} catch (err) {
			console.error('Authentication error:', err);
			toast.error("Неверный логин или пароль");
			setAuthToken(null);
		} finally {
			setIsLoading(false);
		}
	};

	return (
		<div className="w-25 container-sm mt-5">
			<h2 className="mb-4 text-center">Авторизация</h2>
			<form onSubmit={handleSubmit}>
				<div className="mb-3">
					<label htmlFor="username" className="form-label">Логин</label>
					<input
						type="text"
						className="form-control"
						placeholder="Введите логин"
						id="username"
						value={username}
						onChange={(e) => setUsername(e.target.value)}
						disabled={isLoading}
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="password" className="form-label">Пароль</label>
					<input
						type="password"
						className="form-control"
						placeholder="Введите пароль"
						id="password"
						value={password}
						onChange={(e) => setPassword(e.target.value)}
						disabled={isLoading}
						required
					/>
				</div>
				<button
					type="submit"
					className="btn btn-primary w-100"
					disabled={isLoading || !username || !password}
				>
					{isLoading ? (
						<>
							<Spinner
								as="span"
								animation="border"
								size="sm"
								role="status"
								aria-hidden="true"
								className="me-2"
							/>
							Вход...
						</>
					) : (
						'Войти'
					)}
				</button>
			</form>
			<div className="mt-3 text-center">
				<button
					className="btn btn-secondary"
					onClick={() => navigate('/register')}
					disabled={isLoading}
				>
					Нет аккаунта? Создать аккаунт.
				</button>
			</div>
		</div>
	);
};

export default LoginForm;
