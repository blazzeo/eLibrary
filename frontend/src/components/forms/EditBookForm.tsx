import { useState } from "react";
import { BookInfo, BookData } from "../structs";
import { editBook } from "../api/DatabaseAPI";
import { deleteBook } from "../api/DatabaseAPI";

interface Props {
	book: BookInfo | null;
	updateBooks: () => void;
}

export function EditBookForm({ book, updateBooks }: Props) {

	if (!book) {
		return <div>No book found</div>; // If no book found, render an error
	}

	const [book_id,] = useState(book.book_info.book.book_id);
	const [title, setTitle] = useState(book.book_info.book.title);
	const [totalPages, setTotalPages] = useState<number>(book.book_info.book.total_pages);
	const [rating, setRating] = useState<number>(book.book_info.book.rating);
	const [isbn, setIsbn] = useState<number>(book.book_info.book.isbn);
	const [publishedDate, setPublishedDate] = useState<Date | string>(new Date(book.book_info.book.published_date));
	const [error, setError] = useState<null | string>(null);
	const [success, setSuccess] = useState<null | string>(null);

	const validateForm = (): boolean => {
		if (!title || !totalPages || !rating || !publishedDate) {
			setError("All fields are required!");
			return false;
		}
		return true;
	};

	const handleDelete = async () => {
		await deleteBook(book_id!)
		updateBooks()
	};

	const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
		e.preventDefault();
		if (!validateForm()) return;

		setError(null);
		setSuccess(null);

		// TODO add genres and authors section
		const updatedBook: BookData = {
			book_id: book.book_info.book.book_id,
			title: title,
			total_pages: totalPages,
			rating: rating,
			isbn: isbn,
			published_date: new Date(publishedDate || Date.now()),
			loan_status: -1,
		};

		try {
			const response = await editBook(updatedBook);
			console.log(response);

			if (!response || response[0].edit_book == false) {
				throw new Error("Failed to update the book");
			}

			setTitle("");
			setTotalPages(0);
			setRating(0);
			setIsbn(0);
			setPublishedDate("");
			setSuccess("Book updated successfully!");
			updateBooks();
		} catch (error) {
			setError(error instanceof Error ? error.message : "Unknown error occurred.");
		}
	};

	return (
		<div className="container mt-5">
			<h2 className="mb-4">Edit Book</h2>
			<form onSubmit={handleSubmit} className="needs-validation" noValidate>
				<div className="mb-3">
					<label htmlFor="title" className="form-label">
						Title
					</label>
					<input
						type="text"
						id="title"
						className="form-control"
						value={title}
						onChange={(e) => setTitle(e.target.value)}
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="totalPages" className="form-label">
						Total Pages
					</label>
					<input
						type="number"
						id="totalPages"
						className="form-control"
						value={totalPages}
						onChange={(e) => setTotalPages(Number(e.target.value))}
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="rating" className="form-label">
						Rating
					</label>
					<input
						type="number"
						id="rating"
						step="0.01"
						className="form-control"
						value={rating}
						onChange={(e) => setRating(Number(e.target.value))}
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="isbn" className="form-label">
						ISBN
					</label>
					<input
						type="number"
						id="isbn"
						className="form-control"
						value={isbn}
						onChange={(e) => setIsbn(Number(e.target.value))}
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="publishedDate" className="form-label">
						Published Date
					</label>
					<input
						type="date"
						id="publishedDate"
						className="form-control"
						value={publishedDate.toLocaleString()}
						onChange={(e) => setPublishedDate(e.target.value.toString())}
						required
					/>
				</div>
				<div className="d-flex justify-content-around">
					<button type="submit" className="btn btn-primary">
						Save Changes
					</button>
					<button className="btn btn-danger" onClick={handleDelete}>
						Delete Book
					</button>
				</div>

			</form>

			{error && (
				<div className="mt-3">
					<div className="alert alert-danger" role="alert">
						{error}
					</div>
				</div>
			)}

			{success && (
				<div className="mt-3">
					<div className="alert alert-success" role="alert">
						{success}
					</div>
				</div>
			)}
		</div>
	);
}
