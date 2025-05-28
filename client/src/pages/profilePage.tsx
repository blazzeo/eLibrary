import React, { useState, useEffect } from 'react'; // Добавьте useEffect
import { Button, Modal, Form, Card, Row, Col, Alert } from 'react-bootstrap';
import { toast } from 'react-toastify';
import { useNavigate } from 'react-router-dom';
import { useLibrary } from '../context/libraryContext';
import { changePassword, deleteUser, updateTelegramChatId } from '../api/DatabaseAPI';

export default function ProfilePage() {
	const { user, setAuthToken, refreshAll } = useLibrary(); // Добавьте refreshAll сюда
	const navigate = useNavigate();

	// --- Состояние для модального окна смены пароля ---
	const [showPasswordModal, setShowPasswordModal] = useState(false);
	const [currentPassword, setCurrentPassword] = useState('');
	const [newPassword, setNewPassword] = useState('');
	const [confirmNewPassword, setConfirmNewPassword] = useState('');
	const [passwordError, setPasswordError] = useState<string | null>(null);

	// --- Состояние для модального окна удаления аккаунта ---
	const [showDeleteModal, setShowDeleteModal] = useState(false);
	const [deleteConfirmation, setDeleteConfirmation] = useState('');
	const [deleteError, setDeleteError] = useState<string | null>(null);

	// --- Состояние для Telegram Chat ID ---
	const [telegramChatId, setTelegramChatId] = useState<string>('');
	const [telegramChatIdError, setTelegramChatIdError] = useState<string | null>(null);

	// Заполняем поле telegramChatId при загрузке данных пользователя
	useEffect(() => {
		if (user?.telegram_chat_id) {
			setTelegramChatId(user.telegram_chat_id);
		} else {
			setTelegramChatId(''); // Очищаем поле, если chat_id нет
		}
	}, [user]);

	/**
	 * Обработчик отправки формы смены пароля.
	 */
	const handlePasswordChange = async (e: React.FormEvent) => {
		e.preventDefault();
		setPasswordError(null);

		if (!user?.user_id) {
			setPasswordError('ID пользователя не найден.');
			return;
		}

		if (newPassword !== confirmNewPassword) {
			setPasswordError('Новый пароль и его подтверждение не совпадают.');
			return;
		}

		if (newPassword.length < 6) {
			setPasswordError('Новый пароль должен быть не менее 6 символов.');
			return;
		}

		try {
			await changePassword(user.user_id, currentPassword, newPassword);
			toast.success('Пароль успешно изменен!');
			setShowPasswordModal(false);
			setCurrentPassword('');
			setNewPassword('');
			setConfirmNewPassword('');
		} catch (error: any) {
			console.error('Ошибка при смене пароля:', error);
			const errorMessage = error?.response?.data?.error || 'Ошибка при смене пароля. Возможно, текущий пароль неверный.';
			setPasswordError(errorMessage);
			// Убедитесь, что error.message существует, прежде чем обращаться к нему
			toast.error(errorMessage);
		}
	};

	/**
	 * Обработчик сохранения Telegram Chat ID.
	 */
	const handleSaveTelegramChatId = async () => {
		setTelegramChatIdError(null);

		if (!user?.user_id) {
			setTelegramChatIdError('ID пользователя не найден.');
			return;
		}

		// Дополнительная валидация: Telegram chat_id обычно представляет собой последовательность цифр,
		// но может быть и отрицательным (для групп). Простая проверка на число.
		if (telegramChatId && !/^-?\d+$/.test(telegramChatId)) {
			setTelegramChatIdError('Telegram ID должен быть числом.');
			return;
		}

		try {
			await updateTelegramChatId(user.user_id, telegramChatId);
			toast.success('Telegram ID успешно сохранен!');
			await refreshAll(); // Обновляем данные пользователя в контексте после сохранения
		} catch (error: any) {
			console.error('Ошибка при сохранении Telegram ID:', error);
			const errorMessage = error?.response?.data?.error || 'Ошибка при сохранении Telegram ID.';
			setTelegramChatIdError(errorMessage);
			toast.error(errorMessage);
		}
	};

	/**
	 * Обработчик удаления аккаунта.
	 */
	const handleDeleteAccount = async () => {
		setDeleteError(null);

		if (!user?.user_id) {
			setDeleteError('ID пользователя не найден.');
			return;
		}

		if (deleteConfirmation !== user.user_name) {
			setDeleteError('Для подтверждения удаления введите ваш логин.');
			return;
		}

		try {
			await deleteUser(user.user_id);
			toast.success('Ваш аккаунт успешно удален.');
			setShowDeleteModal(false);
			setDeleteConfirmation('');
			setAuthToken(null);
			navigate('/');
		} catch (error: any) {
			console.error('Ошибка при удалении аккаунта:', error);
			const errorMessage = error?.response?.data?.error || 'Ошибка при удалении аккаунта.';
			setDeleteError(errorMessage);
			toast.error(errorMessage);
		}
	};

	/**
	 * Вспомогательная функция для форматирования даты.
	 */
	const formatDate = (date: Date | string) => {
		const d = typeof date === 'string' ? new Date(date) : date;
		return d.toLocaleDateString('ru-RU');
	};

	if (!user) {
		return (
			<div className="container py-4">
				<Alert variant="info" className="text-center">
					Загрузка информации о пользователе...
				</Alert>
			</div>
		);
	}

	return (
		<div className="container py-4">
			<Card className="shadow-sm mb-4">
				<Card.Header as="h3" className="bg-light">
					Ваш профиль
				</Card.Header>
				<Card.Body>
					<Row className="mb-3">
						<Col md={12}>
							<p className="lead"><strong>Имя пользователя:</strong> {user.user_name}</p>
							<p className="lead"><strong>Роль:</strong> {user.user_role === 'admin' ? 'Администратор' : user.user_role === 'moder' ? 'Модератор' : 'Пользователь'}</p>
							<p className="lead"><strong>Дата регистрации:</strong> {formatDate(user.registration_date)}</p>
						</Col>
					</Row>

					{/* Поле для Telegram Chat ID - отображается только для роли 'user' */}
					{user.user_role === 'user' && (
						<Row className="mb-4">
							<Col md={8}>
								<h5 className="mb-3">Настройки Telegram оповещений</h5>
								{telegramChatIdError && <Alert variant="danger">{telegramChatIdError}</Alert>}
								<Form.Group className="mb-3">
									<Form.Label>Ваш Telegram Chat ID</Form.Label>
									<Form.Control
										type="text"
										value={telegramChatId}
										onChange={(e) => setTelegramChatId(e.target.value)}
										placeholder="Введите ваш Telegram Chat ID"
									/>
									<Form.Text className="text-muted">
										Начните диалог с вашим ботом и используйте команду /start.
										Бот сообщит вам ваш Chat ID. Или используйте бота @userinfobot.
										Оставьте поле пустым, чтобы удалить Telegram ID.
									</Form.Text>
								</Form.Group>
								<Button variant="success" onClick={handleSaveTelegramChatId}>
									Сохранить Telegram ID
								</Button>
								{/* Кнопка для удаления Telegram ID, если он установлен */}
								{user.telegram_chat_id && (
									<Button variant="outline-danger" className="ms-2" onClick={() => setTelegramChatId('')}>
										Очистить Telegram ID
									</Button>
								)}
							</Col>
						</Row>
					)}

					<div className="d-flex gap-3 mt-4">
						<Button variant="primary" onClick={() => setShowPasswordModal(true)}>
							Сменить пароль
						</Button>
						<Button variant="danger" onClick={() => setShowDeleteModal(true)}>
							Удалить аккаунт
						</Button>
					</div>
				</Card.Body>
			</Card>

			{/* --- Модальное окно для смены пароля --- */}
			<Modal show={showPasswordModal} onHide={() => setShowPasswordModal(false)} centered>
				<Modal.Header closeButton>
					<Modal.Title>Сменить пароль</Modal.Title>
				</Modal.Header>
				<Form onSubmit={handlePasswordChange}>
					<Modal.Body>
						{passwordError && <Alert variant="danger">{passwordError}</Alert>}
						<Form.Group className="mb-3">
							<Form.Label>Текущий пароль</Form.Label>
							<Form.Control
								type="password"
								value={currentPassword}
								onChange={(e) => setCurrentPassword(e.target.value)}
								required
							/>
						</Form.Group>
						<Form.Group className="mb-3">
							<Form.Label>Новый пароль</Form.Label>
							<Form.Control
								type="password"
								value={newPassword}
								onChange={(e) => setNewPassword(e.target.value)}
								required
							/>
						</Form.Group>
						<Form.Group className="mb-3">
							<Form.Label>Подтвердите новый пароль</Form.Label>
							<Form.Control
								type="password"
								value={confirmNewPassword}
								onChange={(e) => setConfirmNewPassword(e.target.value)}
								required
							/>
						</Form.Group>
					</Modal.Body>
					<Modal.Footer>
						<Button variant="secondary" onClick={() => setShowPasswordModal(false)}>
							Отмена
						</Button>
						<Button variant="primary" type="submit">
							Сохранить
						</Button>
					</Modal.Footer>
				</Form>
			</Modal>

			{/* --- Модальное окно для удаления аккаунта --- */}
			<Modal show={showDeleteModal} onHide={() => setShowDeleteModal(false)} centered>
				<Modal.Header closeButton>
					<Modal.Title>Удалить аккаунт</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					{deleteError && <Alert variant="danger">{deleteError}</Alert>}
					<p>
						Вы уверены, что хотите <strong>безвозвратно</strong> удалить свой аккаунт?
						Это действие нельзя отменить.
					</p>
					<Form.Group className="mb-3">
						<Form.Label>Для подтверждения введите ваш логин:</Form.Label>
						<Form.Control
							type="text"
							value={deleteConfirmation}
							onChange={(e) => setDeleteConfirmation(e.target.value)}
							placeholder={user?.user_name || 'ваш_логин'}
						/>
					</Form.Group>
				</Modal.Body>
				<Modal.Footer>
					<Button variant="secondary" onClick={() => setShowDeleteModal(false)}>
						Отмена
					</Button>
					<Button
						variant="danger"
						onClick={handleDeleteAccount}
						disabled={deleteConfirmation !== user?.user_name}
					>
						Удалить аккаунт
					</Button>
				</Modal.Footer>
			</Modal>
		</div>
	);
}
