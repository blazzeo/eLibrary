import { useState } from "react";
import { useLibrary } from "../../libraryContext";
import { addLoan, toggleWishlist } from "../api/DatabaseAPI";
import { BookInfo } from "../structs";

interface WishlistItemProps {
	user_name: string;
	book: BookInfo;
	requestDate: Date;
	isTaken: boolean;
}

export const WishlistItem = ({ book, user_name, requestDate, isTaken }: WishlistItemProps) => {
	const { refreshModerBooks, refreshUsers } = useLibrary();
	const [newDate, setNewDate] = useState<string>("");
	const [showModal, setShowModal] = useState(false);

	const onRemove = async () => {
		try {
			await toggleWishlist(user_name, book.book.book_id);
			await refreshModerBooks();
			await refreshUsers();
		} catch (err) {
			console.error(err);
		}
	};

	const onIssue = async () => {
		setShowModal(true);
	};

	const onConfirmIssue = async () => {
		try {
			await addLoan(user_name, book.book.book_id, new Date(newDate));
			await refreshModerBooks();
			await refreshUsers();
			setShowModal(false);
		} catch (err) {
			console.error(err);
		}
	};

	return (
		<>
			<li className="list-group-item py-2 border-0">
				<div className="d-flex justify-content-between align-items-center px-0">
					<div className="d-flex gap-3 align-items-center">
						<span className="text-warning fs-4 lh-1">💡</span>
						<div>
							<strong>{book.book.title}</strong>
							<div className="small text-muted">Запрошена {new Date(requestDate).toLocaleDateString()}</div>
						</div>
					</div>
					<div className="btn-group btn-group-sm">
						{!isTaken && (
							<button className="btn btn-outline-success" onClick={onIssue}>Выдать</button>
						)}
						<button className="btn btn-outline-danger" onClick={onRemove}>Снять</button>
					</div>
				</div>
			</li>

			{/* Модальное окно */}
			{showModal && (
				<div className="modal show fade d-block" tabIndex={-1} style={{ backgroundColor: 'rgba(0,0,0,0.5)' }}>
					<div className="modal-dialog">
						<div className="modal-content">
							<div className="modal-header">
								<h5 className="modal-title">Выдача книги</h5>
								<button type="button" className="btn-close" onClick={() => setShowModal(false)}></button>
							</div>
							<div className="modal-body">
								<p>Укажите дату возврата книги:</p>
								<input
									type="date"
									className="form-control"
									value={newDate}
									onChange={(e) => setNewDate(e.target.value)}
								/>
							</div>
							<div className="modal-footer">
								<button className="btn btn-secondary" onClick={() => setShowModal(false)}>Отмена</button>
								<button className="btn btn-primary" onClick={onConfirmIssue} disabled={!newDate}>Подтвердить</button>
							</div>
						</div>
					</div>
				</div>
			)}
		</>
	);
};
