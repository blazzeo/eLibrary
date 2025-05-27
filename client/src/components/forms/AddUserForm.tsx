import React, { useState } from 'react';
import { createUser, userRole } from '../../api/DatabaseAPI.tsx';
import { toast } from 'react-toastify';
import { useLibrary } from '../../context/libraryContext';

export default function AddUserForm() {
	const { refreshAll } = useLibrary()
	const [role, setRole] = useState<userRole>(userRole.user);
	const [login, setLogin] = useState('');
	const [password, setPassword] = useState('');

	const handleSubmit = async (e: React.FormEvent) => {
		e.preventDefault();
		try {
			console.log('Creating new user:', { login, password, role });
			let res = await createUser(login, password, role)
			console.log(res)
			if (res.success == true)
				toast.success("Пользователь успешно добавлен")
			else
				throw new Error(res.data)
		} catch (error) {
			console.error(error)
			toast.error("Ошибка при создании пользователя");
		} finally {
			refreshAll()
		}
	};

	return (
		<div className="container mt-5" style={{ maxWidth: '500px' }}>
			<h3 className="mb-4 text-center">Создание нового пользователя</h3>
			<form onSubmit={handleSubmit}>
				<div className="form-group mb-3">
					<label htmlFor="login">Логин</label>
					<input
						type="text"
						className="form-control"
						id="login"
						value={login}
						onChange={(e) => setLogin(e.target.value)}
						required
					/>
				</div>
				<div className="form-group mb-4">
					<label htmlFor="password">Пароль</label>
					<input
						type="password"
						className="form-control"
						id="password"
						value={password}
						onChange={(e) => setPassword(e.target.value)}
						required
					/>
				</div>
				<div className="form-group mb-4">
					<label htmlFor="role">Роль</label>
					<select
						id="role"
						className="form-control"
						value={role}
						onChange={(e) => setRole(e.target.value as userRole)}
						required
					>
						<option value={userRole.admin}>Администратор</option>
						<option value={userRole.moder}>Модератор</option>
						<option value={userRole.user}>Пользователь</option>
					</select>
				</div>
				<button type="submit" className="btn btn-primary w-100">
					Создать
				</button>
			</form>
		</div>
	);
};
