import { useState } from "react";
import { useLibrary } from "../../libraryContext";
import { addLoan, toggleWishlist } from "../api/DatabaseAPI.tsx";
import { BookInfo, UserData } from "../structs.tsx";
import { toast } from "react-toastify";

interface ReservedBookItemProps {
	user: UserData;
	book: BookInfo;
	requestDate: string;
	isTaken: boolean;
}

export const ReservedBookItem = ({ book, user, requestDate, isTaken }: ReservedBookItemProps) => {
	const { refreshAll } = useLibrary();
	const [newDate, setNewDate] = useState<string>("");
	const [showModal, setShowModal] = useState(false);
	const [isLoading, setIsLoading] = useState(false);

	const onRemove = async () => {
		console.log('Starting onRemove for book:', book.book.title);
		try {
			setIsLoading(true);
			console.log('Calling toggleWishlist with book_id:', book.book.book_id);
			await toggleWishlist(user.user_id, book.book.book_id);

			// Обновляем данные через контекст
			console.log('Calling refreshAll...');
			await refreshAll();
			console.log('refreshAll completed');
		} catch (err) {
			console.error('Error in onRemove:', err);
			toast.error("Не удалось обновить список отложенных книг");
		} finally {
			setIsLoading(false);
		}
	};

	const onIssue = async () => {
		setShowModal(true);
	};

	const onConfirmIssue = async () => {
		try {
			setIsLoading(true);
			await addLoan(user.user_name, book.book.book_id, new Date(newDate));
			await refreshAll();
			setShowModal(false);
			toast.success("Книга успешно выдана");
		} catch (err) {
			console.error(err);
			toast.error("Не удалось выдать книгу");
		} finally {
			setIsLoading(false);
		}
	};

	return (
		<>
			<li className="list-group-item py-2 border-0">
				<div className="d-flex justify-content-between align-items-center px-0">
					<div className="d-flex gap-3 align-items-center">
						<span className="text-warning fs-4 lh-1">📚</span>
						<div>
							<strong>{book.book.title}</strong>
							<div className="small text-muted">Отложена {requestDate}</div>
						</div>
					</div>
					<div className="btn-group btn-group-sm">
						{!isTaken && (
							<button
								className="btn btn-outline-success"
								onClick={onIssue}
								disabled={isLoading}
							>
								Выдать
							</button>
						)}
						<button
							className="btn btn-outline-danger"
							onClick={onRemove}
							disabled={isLoading}
						>
							Отменить
						</button>
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
								<button
									className="btn btn-secondary"
									onClick={() => setShowModal(false)}
									disabled={isLoading}
								>
									Отмена
								</button>
								<button
									className="btn btn-primary"
									onClick={onConfirmIssue}
									disabled={!newDate || isLoading}
								>
									Подтвердить
								</button>
							</div>
						</div>
					</div>
				</div>
			)}
		</>
	);
}; 
