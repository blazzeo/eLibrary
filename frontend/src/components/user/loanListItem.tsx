import { useState } from "react";
import { Modal, Button, Form } from "react-bootstrap";
import { useLibrary } from "../../libraryContext";
import { extentLoan, returnBook } from "../api/DatabaseAPI.tsx";
import { BookInfo } from "../structs.tsx";
import { toast } from "react-toastify";

interface LoanListItemProps {
	book: BookInfo;
}

export const LoanListItem = ({ book }: LoanListItemProps) => {
	const { refreshAll } = useLibrary();
	const [showModal, setShowModal] = useState(false);
	const [newDate, setNewDate] = useState(
		book.owner?.return_date || new Date().toISOString().slice(0, 10)
	);

	const onExtend = async () => {
		try {
			await extentLoan(book.owner.user_name, book.book.book_id, newDate);
			console.log()
			await refreshAll()
			toast.success('Бронь успешно обновлена')
			setShowModal(false);
		} catch (err) {
			console.error(err);
			toast.error('Ошибка при обновлении брони')
		}
	};

	const onReturn = async () => {
		console.log('onReturn started for book_id:', book.book.book_id);
		try {
			await returnBook(book.book.book_id);
			console.log('returnBook done');
			await refreshAll();
			toast.success('Бронь успешно аннулирована')
			console.log('refreshModerBooks done');
		} catch (err) {
			console.error('Ошибка в onReturn:', err);
			toast.error('Ошибка при аннулировании брони')
		}
	};

	return (
		<>
			<li className="list-group-item py-2 border-0">
				<div className="d-flex justify-content-between align-items-center px-0">
					<div className="d-flex gap-3 align-items-center">
						<span className="text-success fs-4 lh-1">📖</span>
						<div>
							<strong>{book.book.title}</strong>
							<div className="small text-muted">
								{book.owner ? `До ${book.owner.return_date}` : "Возвращена"}
							</div>
						</div>
					</div>
					<div className="btn-group btn-group-sm">
						<button
							className="btn btn-outline-primary"
							onClick={() => setShowModal(true)}
						>
							Продлить
						</button>
						<button className="btn btn-outline-danger" onClick={onReturn}>
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
							value={typeof newDate === "string" ? newDate.slice(0, 10) : new Date(newDate).toISOString().slice(0, 10)}
							onChange={(e) => setNewDate(e.target.value)}
							min={book.owner?.return_date?.slice(0, 10) || undefined}
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
