import { useState } from "react";
import { BookData } from "../structs";
import { addBook } from "../api/DatabaseAPI";

interface Props {
	updateBooks: () => void;
}

// TODO add genres and authors
export function AddBookForm({ updateBooks }: Props) {
	const [title, setTitle] = useState("");
	const [totalPages, setTotalPages] = useState<number>(0); // Инициализируем значением 0
	const [rating, setRating] = useState<number>(0); // Инициализируем значением 0
	const [isbn, setIsbn] = useState("");
	const [publishedDate, setPublishedDate] = useState<string>(""); // Используем string для даты
	const [error, setError] = useState<null | string>(null);
	const [success, setSuccess] = useState<null | string>(null);

	// Валидация перед отправкой формы
	const validateForm = (): boolean => {
		if (!title || !totalPages || !rating || !publishedDate) {
			setError("All fields are required!");
			return false;
		}
		return true;
	};

	const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
		e.preventDefault();

		// Проверка перед отправкой
		if (!validateForm()) return;

		// Reset error and success messages
		setError(null);
		setSuccess(null);

		// Преобразуем опубликованную дату в объект Date
		const book: BookData = {
			book_id: 0,
			title: title,
			total_pages: totalPages,
			rating: rating,
			isbn: Number(isbn),
			published_date: new Date(publishedDate ? publishedDate : Date.now()), // Преобразуем строку в объект Date
			loan_status: 0,
		};

		try {
			const response = await addBook(book)
			if (response == false) {
				throw new Error("Failed to add book");
			}

			// Clear the form and show success message
			setTitle("");
			setTotalPages(0);
			setRating(0);
			setIsbn("");
			setPublishedDate(""); // Сбрасываем дату
			setSuccess("Book added successfully!");
			updateBooks();
		} catch (error) {
			if (error instanceof Error) {
				setError(error.message);
			} else {
				setError("Unknown error occurred.");
			}
		}
	};

	return (
		<div className="container mt-5">
			<h2 className="mb-4">Добавить новую книгу</h2>
			<form onSubmit={handleSubmit} className="needs-validation" noValidate>
				<div className="mb-3">
					<label htmlFor="title" className="form-label">
						Название
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
						Количество страниц
					</label>
					<input
						type="number"
						id="totalPages"
						className="form-control"
						value={totalPages}
						onChange={(e) => setTotalPages(Number(e.target.value))} // Преобразуем строку в число
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="rating" className="form-label">
						Рейтинг
					</label>
					<input
						type="number"
						id="rating"
						step="0.01"
						className="form-control"
						value={rating}
						onChange={(e) => setRating(Number(e.target.value))} // Преобразуем строку в число
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="isbn" className="form-label">
						ISBN
					</label>
					<input
						type="text"
						id="isbn"
						className="form-control"
						value={isbn}
						onChange={(e) => setIsbn(e.target.value)}
						required
					/>
				</div>
				<div className="mb-3">
					<label htmlFor="publishedDate" className="form-label">
						Год публикации
					</label>
					<input
						type="date"
						id="publishedDate"
						className="form-control"
						value={publishedDate}
						onChange={(e) => setPublishedDate(e.target.value)} // Дата сохраняется как строка в формате YYYY-MM-DD
						required
					/>
				</div>
				<button type="submit" className="btn btn-primary">
					Добавить книгу
				</button>
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
