import { useState } from 'react';
import DatePicker from 'react-datepicker';
import { Modal, Button } from 'react-bootstrap';
import 'react-datepicker/dist/react-datepicker.css';
import 'bootstrap/dist/css/bootstrap.min.css';

interface Props {
	wish: any,
	book: any,
	handle_borrow: (user_name: string, return_date: Date) => void,
}

export default function WishCard({ wish, book, handle_borrow }: Props) {
	const [showModal, setShowModal] = useState(false);
	const [selectedDate, setSelectedDate] = useState<Date>(new Date());

	const handleConfirm = () => {
		handle_borrow(wish.user_name, selectedDate);
		setShowModal(false);
	};

	return (
		<>
			<div className="border p-3 rounded bg-light mb-3 d-flex justify-content-between align-items-start">
				<div>
					<p className="mb-1"><strong>User ID:</strong> {wish.user_id}</p>
					<p className="mb-1"><strong>Name:</strong> {wish.user_name}</p>
					<p className="mb-0 text-muted">
						<small>Requested on: {wish.request_date.toString()}</small>
					</p>
				</div>

				{!book.book.owner && (
					<div>
						<Button variant="success" onClick={() => setShowModal(true)}>
							Выдать
						</Button>
					</div>
				)}
			</div>

			{/* Модальное окно */}
			<Modal show={showModal} onHide={() => setShowModal(false)} centered>
				<Modal.Header closeButton>
					<Modal.Title>Выберите дату возврата</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<DatePicker
						selected={selectedDate}
						onChange={(date) => setSelectedDate(date!)}
						className="form-control"
						dateFormat="yyyy-MM-dd"
					/>
				</Modal.Body>
				<Modal.Footer>
					<Button variant="secondary" onClick={() => setShowModal(false)}>
						Отмена
					</Button>
					<Button variant="primary" onClick={handleConfirm}>
						Подтвердить
					</Button>
				</Modal.Footer>
			</Modal>
		</>
	);
}
