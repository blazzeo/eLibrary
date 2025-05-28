import { useState } from "react";
import { Modal, Button, Form, Badge } from "react-bootstrap"; // Добавили Badge
import { useLibrary } from "../../context/libraryContext";
import { extentLoan, returnBook } from "../../api/DatabaseAPI.tsx";
import { BookInfo } from "../structs.tsx";
import { toast } from "react-toastify";
import { useNavigate } from "react-router";

interface LoanListItemProps {
	book: BookInfo;
}

export const LoanListItem = ({ book }: LoanListItemProps) => {
	const { refreshAll } = useLibrary();
	const [showModal, setShowModal] = useState(false);
	const [newDate, setNewDate] = useState<string>(() => {
		// Инициализируем новую дату текущей датой возврата книги, если она есть
		// Если return_date не существует (книга возвращена), используем текущую дату
		const date = book.owner?.return_date
			? new Date(book.owner.return_date)
			: new Date();
		return date.toISOString().slice(0, 10);
	});

	const navigate = useNavigate();

	// --- Логика определения просрочки ---
	const isOverdue = book.owner && book.owner.return_date
		? new Date(book.owner.return_date) < new Date()
		: false;
	// -----------------------------------

	const onExtend = async () => {
		try {
			// Проверка, что owner существует и у него есть user_name
			if (!book.owner || !book.owner.user_name) {
				toast.error('Ошибка: данные владельца книги отсутствуют.');
				return;
			}
			await extentLoan(book.owner.user_name, book.book.book_id, new Date(newDate));
			toast.success('Срок возврата успешно продлён!');
			setShowModal(false);
			await refreshAll(); // Обновить данные после успешного продления
		} catch (err) {
			console.error("Ошибка при продлении брони:", err);
			toast.error('Ошибка при продлении срока возврата.');
		}
	};

	const onReturn = async () => {
		try {
			await returnBook(book.book.book_id);
			toast.success('Книга успешно возвращена!');
			await refreshAll(); // Обновить данные после успешного возврата
		} catch (err) {
			console.error('Ошибка при возврате книги:', err);
			toast.error('Ошибка при возврате книги.');
		}
	};

	return (
		<>
			<li className="list-group-item py-2 border-0">
				<div className="d-flex justify-content-between align-items-center px-0">
					<div className="d-flex gap-3 align-items-center">
						<span className="text-success fs-4 lh-1">📖</span>
						<div>
							<strong onClick={() => navigate(`/book/${book.book.book_id}`)} className="me-2" style={{ cursor: 'pointer' }}>{book.book.title}</strong>
							{/* Условное отображение плашки "ПРОСРОЧЕНО" */}
							{isOverdue && (
								<Badge bg="danger" className="ms-2">
									ПРОСРОЧЕНО
								</Badge>
							)}
							<div className="small text-muted">
								{book.owner && book.owner.return_date
									? `До ${new Date(book.owner.return_date).toLocaleDateString()}`
									: "Возвращена"}
							</div>
						</div>
					</div>
					<div className="btn-group btn-group-sm">
						<button
							className="btn btn-outline-primary"
							onClick={() => setShowModal(true)}
							disabled={!book.owner || !book.owner.return_date} // Деактивировать, если нет данных для продления
						>
							Продлить
						</button>
						<button
							className="btn btn-outline-danger"
							onClick={onReturn}
							disabled={!book.owner} // Деактивировать, если книги нет на руках
						>
							Аннулировать
						</button>
					</div>
				</div>
			</li>

			{/* Модальное окно */}
			<Modal show={showModal} onHide={() => setShowModal(false)}>
				<Modal.Header closeButton>
					<Modal.Title>Выберите новую дату возврата</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<Form.Group controlId="newReturnDate">
						<Form.Label>Дата возврата</Form.Label>
						<Form.Control
							type="date"
							value={newDate}
							onChange={(e) => setNewDate(e.target.value)}
							min={
								book.owner?.return_date
									? new Date(book.owner.return_date).toISOString().slice(0, 10) // Минимальная дата - текущая дата возврата
									: undefined // Если нет даты возврата (книга не на руках), не устанавливаем min
							}
						/>
					</Form.Group>
				</Modal.Body>
				<Modal.Footer>
					<Button variant="secondary" onClick={() => setShowModal(false)}>
						Отмена
					</Button>
					<Button variant="primary" onClick={onExtend}>
						Подтвердить
					</Button>
				</Modal.Footer>
			</Modal>
		</>
	);
};
