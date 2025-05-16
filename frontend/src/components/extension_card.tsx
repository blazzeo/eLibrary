import { useState } from "react";
import { addLoan, confirmExtension, rejectExtension } from "./api/DatabaseAPI";
import { Toast, ToastContainer } from 'react-bootstrap';
import { BookInfo } from "./structs";
import WishCard from "./wish_card";

interface Props {
	bookInfo: BookInfo;
	updateBooks: () => void;
}

export default function ExtensionCard({ bookInfo, updateBooks }: Props) {
	const book = bookInfo.book_info

	const [toast, setToast] = useState({ show: false, message: '', variant: 'success' as 'success' | 'danger' });

	const showToast = (message: string, variant: 'success' | 'danger') => {
		setToast({ show: true, message, variant });
		setTimeout(() => setToast({ ...toast, show: false }), 5000);
	};

	const confirm_request = async () => {
		try {
			await confirmExtension(book.book.book_id, book.owner.user_id, book.extension_request);
			updateBooks();
			showToast('Продление подтверждено', 'success');
		} catch (err: any) {
			showToast(err?.response?.data?.error || 'Ошибка при подтверждении продления', 'danger');
		}
	};

	const reject_request = async () => {
		try {
			await rejectExtension(book.book.book_id, book.owner.user_id, book.extension_request);
			updateBooks();
			showToast('Продление отклонено', 'success');
		} catch (err: any) {
			showToast(err?.response?.data?.error || 'Ошибка при отклонении продления', 'danger');
		}
	};

	const handle_borrow = async (user_name: string, return_date: Date) => {
		try {
			await addLoan(user_name, book.book.book_id, return_date);
			updateBooks();
			showToast(`Книга выдана пользователю ${user_name}`, 'success');
		} catch (err: any) {
			showToast(err?.response?.data?.error || 'Ошибка при выдаче книги', 'danger');
		}
	};

	return (
		<div className="container my-4">

			<ToastContainer position="top-end" className="p-3" style={{ zIndex: 9999 }}>
				<Toast
					bg={toast.variant}
					show={toast.show}
					onClose={() => setToast({ ...toast, show: false })}
					delay={5000}
					autohide
				>
					<Toast.Header>
						<strong className="me-auto">
							{toast.variant === 'success' ? 'Успешно' : 'Ошибка'}
						</strong>
					</Toast.Header>
					<Toast.Body className={toast.variant === 'danger' ? 'text-white' : ''}>
						{toast.message}
					</Toast.Body>
				</Toast>
			</ToastContainer>

			<div className="card shadow-sm">
				{/* Book Info */}
				<div className="card-body d-flex justify-content-between align-items-start">
					{/* Left: Book Info */}
					<div>
						<h5 className="card-title">
							{book.book.book_id}: {book.book.title}
						</h5>
						<p className="card-text text-muted">
							ISBN: {book.book.isbn} | Pages: {book.book.total_pages}
						</p>
						{book.book.authors && (
							<p className="mb-1">
								<strong>Authors:</strong> {book.book.authors.join(', ')}
							</p>
						)}
						{book.book.genres && (
							<p className="mb-0">
								<strong>Genres:</strong> {book.book.genres.join(', ')}
							</p>
						)}
					</div>

					{/* Right: Owner Info */}
					{book.owner && (
						<div className="text-end ms-4">
							<h4 className="text-muted mb-1">Owner: <span className="fw-semibold text-primary mb-0">{book.owner.user_name}</span></h4>
							<h6>Borrow date: {book.owner.borrow_date.toString()}</h6>
							<h6>Return date: {book.owner.return_date.toString()}</h6>
						</div>
					)}
				</div>

				{/* Extension Request Section */}
				{book.extension_request && (
					<div className="card-body border-top border-warning-subtle">
						<h5 className="card-title text-warning">Extension Request</h5>
						<p className="card-text">
							Requested return extension to: <strong>{book.extension_request.toString()}</strong>
						</p>
						<div className="d-flex gap-2">
							<button className="btn btn-success" onClick={confirm_request}>Confirm</button>
							<button className="btn btn-danger" onClick={reject_request}>Reject</button>
						</div>
					</div>
				)}

				{/* Wishlist Section */}
				{book.wishlist.length > 0 && (
					<div className="card-body border-top">
						<h5 className="card-title">Users in Wishlist</h5>
						<div className="row">
							{book.wishlist.map((wish, index) => (
								<div key={index} className="col-md-6 mb-3">
									<WishCard wish={wish} book={book} handle_borrow={handle_borrow} />
								</div>
							))}
						</div>
					</div>
				)}
			</div>
		</div>
	);
}
