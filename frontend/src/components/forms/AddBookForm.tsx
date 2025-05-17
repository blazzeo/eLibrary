import { useState } from "react";
import { BookData } from "../structs";
import { addBook } from "../api/DatabaseAPI";
import { ToastContainer, toast } from "react-toastify";
import 'react-toastify/dist/ReactToastify.css';

interface Props {
	updateBooks: () => void;
}

export function AddBookForm({ updateBooks }: Props) {
	const [title, setTitle] = useState("");
	const [totalPages, setTotalPages] = useState<number | null>(null);
	const [rating, setRating] = useState<number | null>(null);
	const [isbn, setIsbn] = useState<number | null>(null);
	const [publishedDate, setPublishedDate] = useState<string>("");

	const [authorInput, setAuthorInput] = useState("");
	const [genreInput, setGenreInput] = useState("");
	const [authors, setAuthors] = useState<string[]>([]);
	const [genres, setGenres] = useState<string[]>([]);

	const validateForm = (): boolean => {
		if (!title || !totalPages || !rating || !publishedDate) {
			toast.error("Все обязательные поля должны быть заполнены!");
			return false;
		}
		return true;
	};

	const addAuthor = () => {
		if (authorInput.trim()) {
			setAuthors([...authors, authorInput.trim()]);
			setAuthorInput("");
		}
	};

	const addGenre = () => {
		if (genreInput.trim()) {
			setGenres([...genres, genreInput.trim()]);
			setGenreInput("");
		}
	};

	const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
		e.preventDefault();
		if (!validateForm()) return;

		const book: BookData = {
			book_id: 0,
			title,
			total_pages: Number(totalPages),
			rating: Number(rating),
			isbn: isbn ? Number(isbn) : 0,
			published_date: new Date(publishedDate),
			loan_status: 0,
			// @ts-ignore — если BookData поддерживает authors/genres, убрать ts-ignore
			authors,
			// @ts-ignore
			genres
		};

		try {
			const response = await addBook(book);
			if (!response) throw new Error("Не удалось добавить книгу");

			setTitle("");
			setTotalPages(null);
			setRating(null);
			setIsbn(null);
			setPublishedDate("");
			setAuthors([]);
			setGenres([]);
			toast.success("Книга успешно добавлена!");
			updateBooks();
		} catch (error) {
			toast.error(error instanceof Error ? error.message : "Произошла неизвестная ошибка.");
		}
	};

	return (
		<div className="container mt-5">
			<h2 className="mb-4">Добавить новую книгу</h2>
			<form onSubmit={handleSubmit} className="needs-validation" noValidate>
				<div className="mb-3">
					<label htmlFor="title" className="form-label">Название</label>
					<input type="text" id="title" className="form-control" value={title} onChange={(e) => setTitle(e.target.value)} required />
				</div>
				<div className="mb-3">
					<label htmlFor="totalPages" className="form-label">Количество страниц</label>
					<input type="number" id="totalPages" className="form-control" value={totalPages ?? ""} onChange={(e) => setTotalPages(Number(e.target.value))} required />
				</div>
				<div className="mb-3">
					<label htmlFor="rating" className="form-label">Рейтинг</label>
					<input type="number" id="rating" step="0.01" className="form-control" value={rating ?? ""} onChange={(e) => setRating(Number(e.target.value))} required />
				</div>
				<div className="mb-3">
					<label htmlFor="isbn" className="form-label">ISBN</label>
					<input type="number" id="isbn" className="form-control" value={isbn ?? ""} onChange={(e) => setIsbn(Number(e.target.value))} />
				</div>
				<div className="mb-3">
					<label htmlFor="publishedDate" className="form-label">Год публикации</label>
					<input type="date" id="publishedDate" className="form-control" value={publishedDate} onChange={(e) => setPublishedDate(e.target.value)} required />
				</div>

				{/* Authors Input */}
				<div className="mb-3">
					<label className="form-label">Авторы</label>
					<div className="d-flex">
						<input type="text" className="form-control me-2" value={authorInput} onChange={(e) => setAuthorInput(e.target.value)} />
						<button type="button" className="btn btn-secondary" onClick={addAuthor}>Добавить</button>
					</div>
					<ul className="mt-2">
						{authors.map((a, i) => <li key={i}>{a}</li>)}
					</ul>
				</div>

				{/* Genres Input */}
				<div className="mb-3">
					<label className="form-label">Жанры</label>
					<div className="d-flex">
						<input type="text" className="form-control me-2" value={genreInput} onChange={(e) => setGenreInput(e.target.value)} />
						<button type="button" className="btn btn-secondary" onClick={addGenre}>Добавить</button>
					</div>
					<ul className="mt-2">
						{genres.map((g, i) => <li key={i}>{g}</li>)}
					</ul>
				</div>

				<button type="submit" className="btn btn-primary">Добавить книгу</button>
			</form>

			<ToastContainer position="top-right" autoClose={3000} hideProgressBar={false} newestOnTop={false} closeOnClick pauseOnFocusLoss draggable pauseOnHover />
		</div>
	);
}
