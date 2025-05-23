import { useLibrary } from "../libraryContext";
import { addLoan, confirmExtension, rejectExtension } from "./api/DatabaseAPI";
import { BookInfo } from "./structs";
import WishCard from "./wish_card";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

interface Props {
	bookInfo: BookInfo;
}

export default function ExtensionCard({ bookInfo }: Props) {
	const { refreshAll } = useLibrary()
	const book = bookInfo;

	const confirm_request = async () => {
		try {
			await confirmExtension(book.book.book_id, book.owner.user_id, book.extension_request);
			toast.success("Продление подтверждено");
		} catch (err: any) {
			toast.error(err?.response?.data?.error || "Ошибка при подтверждении продления");
		} finally {
			refreshAll()
		}
	};

	const reject_request = async () => {
		try {
			await rejectExtension(book.book.book_id, book.owner.user_id, book.extension_request);
			toast.success("Продление отклонено");
		} catch (err: any) {
			toast.error(err?.response?.data?.error || "Ошибка при отклонении продления");
		} finally {
			refreshAll();
		}
	};

	const handle_borrow = async (user_name: string, return_date: Date) => {
		try {
			await addLoan(user_name, book.book.book_id, return_date);
			refreshAll();
			toast.success(`Книга выдана пользователю ${user_name}`);
		} catch (err: any) {
			toast.error(err?.response?.data?.error || "Ошибка при выдаче книги");
		} finally {
			refreshAll();
		}
	};

	return (
		<div className="container my-4">
			<div className="card shadow-sm">
				<div className="card-body d-flex justify-content-between align-items-start">
					<div>
						<h5 className="card-title">
							{book.book.book_id}: {book.book.title}
						</h5>
						<p className="card-text text-muted">
							ISBN: {book.book.isbn} | Pages: {book.book.total_pages}
						</p>
						{book.book.authors && (
							<p className="mb-1">
								<strong>Authors:</strong> {book.book.authors.join(", ")}
							</p>
						)}
						{book.book.genres && (
							<p className="mb-0">
								<strong>Genres:</strong> {book.book.genres.join(", ")}
							</p>
						)}
					</div>

					{book.owner && (
						<div className="text-end ms-4">
							<h4 className="text-muted mb-1">
								Owner:{" "}
								<span className="fw-semibold text-primary mb-0">
									{book.owner.user_name}
								</span>
							</h4>
							<h6>Borrow date: {book.owner.borrow_date.toString()}</h6>
							<h6>Return date: {book.owner.return_date.toString()}</h6>
						</div>
					)}
				</div>

				{book.extension_request && (
					<div className="card-body border-top border-warning-subtle">
						<h5 className="card-title text-warning">Extension Request</h5>
						<p className="card-text">
							Requested return extension to:{" "}
							<strong>{book.extension_request.toString()}</strong>
						</p>
						<div className="d-flex gap-2">
							<button className="btn btn-success" onClick={confirm_request}>
								Confirm
							</button>
							<button className="btn btn-danger" onClick={reject_request}>
								Reject
							</button>
						</div>
					</div>
				)}

				{book.wishlist.length > 0 && (
					<div className="card-body border-top">
						<h5 className="card-title">Пользователи ожидают</h5>
						<div className="row">
							{book.wishlist.map((wish, index) => (
								<div key={index} className="col-md-6 mb-3">
									<WishCard
										wish={wish}
										book={book}
										handle_borrow={handle_borrow}
									/>
								</div>
							))}
						</div>
					</div>
				)}
			</div>
		</div>
	);
}
