import { BookInfo } from "../structs";
import { useLibrary } from "../../libraryContext";
import { confirmExtension, rejectExtension } from "../api/DatabaseAPI";
import { toast } from "react-toastify";

interface ExtensionRequestItemProps {
	book: BookInfo;
	requestDate: Date;
}

export const ExtensionRequestItem = ({ book, requestDate }: ExtensionRequestItemProps) => {
	const { refreshAll } = useLibrary()

	const onApprove = async () => {
		try {
			await confirmExtension(book.book.book_id, book.owner.user_id, requestDate)
			toast.success("Бронь успешно продлена")
		} catch (err) {
			console.error(err)
			toast.success("Ошибка при продлении брони")
		} finally {
			await refreshAll()
		}
	}

	const onReject = async () => {
		try {
			await rejectExtension(book.book.book_id, book.owner.user_id, requestDate)
		} catch (err) {
			console.error(err)
		} finally {
			await refreshAll()
		}
	}

	return (
		<li className="list-group-item py-2 border-0">
			<div className="d-flex justify-content-between align-items-center px-0">
				<div className="d-flex gap-3 align-items-center">
					<span className="text-info fs-4 lh-1">⏳</span>
					<div>
						<strong>{book.book.title}</strong>
						<div className="small text-muted">До {requestDate}</div>
					</div>
				</div>
				<div className="btn-group btn-group-sm">
					<button className="btn btn-outline-success" onClick={onApprove}>Подтвердить</button>
					<button className="btn btn-outline-danger" onClick={onReject}>Отклонить</button>
				</div>
			</div>
		</li>
	);
}
