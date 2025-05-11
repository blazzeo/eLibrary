import { confirmExtension, rejectExtension } from "./api/DatabaseAPI";
import { BookInfo } from "./structs";

interface Props {
	bookInfo: BookInfo;
	updateBooks: () => void;
}

export default function ExtensionCard({ bookInfo, updateBooks }: Props) {
	const book = bookInfo.book_info

	const confirm_request = async () => {
		await confirmExtension(book.book.book_id, book.book.owner.user_id, book.extension_request)
		updateBooks()
	}

	const reject_request = async () => {
		await rejectExtension(book.book.book_id, book.book.owner.user_id, book.extension_request)
		updateBooks()
	}


	return (
		<div className="container my-4">
			{/* Book Info */}
			<div className="card mb-4 shadow-sm">
				<div className="card-body">
					<h5 className="card-title">{book.book.book_id}: {book.book.title}</h5>
					<p className="card-text text-muted">
						ISBN: {book.book.isbn} | Pages: {book.book.total_pages}
					</p>
					<p className="mb-1"><strong>Authors:</strong> {book.book.authors?.join(', ')}</p>
					<p className="mb-0"><strong>Genres:</strong> {book.book.genres?.join(', ')}</p>
				</div>
			</div>

			{/* Extension Request Section */}
			{book.extension_request && (
				<div className="card mb-4 border-warning">
					<div className="card-body">
						<h5 className="card-title text-warning">Extension Request</h5>
						<p className="card-text">
							Requested return extension to: <strong>{book.extension_request.toString()}</strong>
						</p>
						<div className="d-flex gap-2">
							<button className="btn btn-success" onClick={confirm_request}>Confirm</button>
							<button className="btn btn-danger" onClick={reject_request}>Reject</button>
						</div>
					</div>
				</div>
			)}

			{/* Wishlist Section */}
			{book.wishlist.length > 0 && (
				<div className="card">
					<div className="card-body">
						<h5 className="card-title">Users in Wishlist</h5>
						<div className="row">
							{book.wishlist.map((wish, index) => (
								<div key={index} className="col-md-6 mb-3">
									<div className="border p-3 rounded bg-light">
										<p className="mb-1"><strong>User ID:</strong> {wish.user_id}</p>
										<p className="mb-1"><strong>Name:</strong> {wish.user_name}</p>
										<p className="mb-0 text-muted"><small>Requested on: {wish.request_date.toString()}</small></p>
									</div>
								</div>
							))}
						</div>
					</div>
				</div>
			)}
		</div>
	);
}
