import { useState } from "react";
import { Button, Modal, Form } from "react-bootstrap";
import { BookInfo } from "./structs";
import { addLoan, confirmExtension, rejectExtension } from "./api/DatabaseAPI";
import { Toast, ToastContainer } from "react-bootstrap";

interface Props {
	bookInfo: BookInfo;
	updateBooks: () => void;
}

export default function BookPage({ bookInfo, updateBooks }: Props) {
	const book = bookInfo.book_info.book;
	const owner = bookInfo.book_info.owner;
	const extension_request = bookInfo.book_info.extension_request;
	const wishlist = bookInfo.book_info.wishlist;
	console.log(wishlist)

	const [toast, setToast] = useState({ show: false, message: '', variant: 'success' as 'success' | 'danger' });
	const [showEditModal, setShowEditModal] = useState(false);
	const [showLoanModal, setShowLoanModal] = useState(false);
	const [selectedUser, setSelectedUser] = useState('');
	const [returnDate, setReturnDate] = useState('');

	const showToast = (message: string, variant: 'success' | 'danger') => {
		setToast({ show: true, message, variant });
		setTimeout(() => setToast({ ...toast, show: false }), 5000);
	};

	const confirm_request = async () => {
		try {
			await confirmExtension(book.book_id, owner.user_id, extension_request);
			updateBooks();
			showToast('Продление подтверждено', 'success');
		} catch (err: any) {
			showToast(err?.response?.data?.error || 'Ошибка при подтверждении продления', 'danger');
		}
	};

	const reject_request = async () => {
		try {
			await rejectExtension(book.book_id, owner.user_id, extension_request);
			updateBooks();
			showToast('Продление отклонено', 'success');
		} catch (err: any) {
			showToast(err?.response?.data?.error || 'Ошибка при отклонении продления', 'danger');
		}
	};

	const handle_borrow = async () => {
		try {
			await addLoan(selectedUser, book.book_id, new Date(returnDate));
			updateBooks();
			setShowLoanModal(false);
			showToast(`Книга выдана пользователю ${selectedUser}`, 'success');
		} catch (err: any) {
			showToast(err?.response?.data?.error || 'Ошибка при выдаче книги', 'danger');
		}
	};

	return (
		<div className="container mt-4">
			<div className="d-flex justify-content-between align-items-center mb-3">
				<h3>{book.title}</h3>
				<Button variant="primary" onClick={() => setShowEditModal(true)}>Редактировать</Button>
			</div>

			<p><strong>Авторы:</strong> {book.authors.join(', ')}</p>
			<p><strong>Жанры:</strong> {book.genres.join(', ')}</p>
			<p><strong>Дата публикации:</strong> {book.published_date.toString()}</p>
			<p><strong>Страниц:</strong> {book.total_pages}</p>
			<p><strong>Рейтинг:</strong> {book.rating}</p>
			<p><strong>ISBN:</strong> {book.isbn}</p>

			<h5 className="mt-4">Владелец книги</h5>
			{owner ? (
				<div>
					<p>{owner.user_name} (c <strong>{owner.borrow_date.toString()}</strong> до <strong>{owner.return_date.toString()}</strong>)</p>
					{extension_request && (
						<div>
							<p><strong>Запрос на продление до:</strong> {extension_request.toString()}</p>
							<Button variant="success" onClick={confirm_request}>Подтвердить</Button>{' '}
							<Button variant="danger" onClick={reject_request}>Отклонить</Button>
						</div>
					)}
				</div>
			) : (
				<Button variant="success" onClick={() => setShowLoanModal(true)}>Выдать книгу</Button>
			)}

			<h5 className="mt-4">В отложенном:</h5>
			{wishlist.length > 0 ? (
				<ul>
					{wishlist.map(user => (
						<li key={user.user_id}>{user.user_name} (запрос от {user.request_date.toString()})</li>
					))}
				</ul>
			) : <p>Нет пользователей</p>}

			{/* Модальное окно для редактирования книги */}
			<Modal show={showEditModal} onHide={() => setShowEditModal(false)}>
				<Modal.Header closeButton>
					<Modal.Title>Редактировать книгу</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					{/* TODO: Реализовать форму редактирования */}
					<p>Форма редактирования книги</p>
				</Modal.Body>
				<Modal.Footer>
					<Button variant="secondary" onClick={() => setShowEditModal(false)}>Отмена</Button>
					<Button variant="primary">Сохранить</Button>
				</Modal.Footer>
			</Modal>

			{/* Модальное окно для выдачи книги */}
			<Modal show={showLoanModal} onHide={() => setShowLoanModal(false)}>
				<Modal.Header closeButton>
					<Modal.Title>Выдать книгу</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<Form>
						<Form.Group>
							<Form.Label>Пользователь</Form.Label>
							<Form.Control as="select" value={selectedUser} onChange={(e) => setSelectedUser(e.target.value)}>
								<option value="">Выберите пользователя</option>
								{wishlist.map(user => (
									<option key={user.user_id} value={user.user_name}>{user.user_name}</option>
								))}
							</Form.Control>
						</Form.Group>
						<Form.Group>
							<Form.Label>Дата возврата</Form.Label>
							<Form.Control type="date" value={returnDate} onChange={(e) => setReturnDate(e.target.value)} />
						</Form.Group>
					</Form>
				</Modal.Body>
				<Modal.Footer>
					<Button variant="secondary" onClick={() => setShowLoanModal(false)}>Отмена</Button>
					<Button variant="success" onClick={handle_borrow} disabled={!selectedUser || !returnDate}>Выдать</Button>
				</Modal.Footer>
			</Modal>

			<ToastContainer position="bottom-end" className="p-3">
				<Toast show={toast.show} bg={toast.variant} onClose={() => setToast({ ...toast, show: false })}>
					<Toast.Body>{toast.message}</Toast.Body>
				</Toast>
			</ToastContainer>
		</div>
	);
}
