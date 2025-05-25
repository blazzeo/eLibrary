import React, { useState } from 'react';
import { createModer } from '../api/DatabaseAPI.tsx';
import { toast } from 'react-toastify';
import { useLibrary } from '../../libraryContext';

export default function AddModerForm() {
	const { refreshAll } = useLibrary()
	const [login, setLogin] = useState('');
	const [password, setPassword] = useState('');

	const handleSubmit = async (e: React.FormEvent) => {
		e.preventDefault();
		try {
			console.log('Creating moderator:', { login, password });
			let res = await createModer(login, password)
			if (res.data.result.success == true)
				toast.success("Модератор успешно добавлен")
			else throw new Error(res.data.result.message)
		} catch (error) {
			console.error(error)
			toast.error((error as Error).message);
		} finally {
			refreshAll()
		}
	};

	return (
		<div className="container mt-5" style={{ maxWidth: '500px' }}>
			<h3 className="mb-4 text-center">Создание модератора</h3>
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
				<button type="submit" className="btn btn-primary w-100">
					Создать
				</button>
			</form>
		</div>
	);
};

// export default CreateModeratorForm;
