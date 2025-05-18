import { useState } from "react";
import { Card, Button, Form, Row, Col, Container } from "react-bootstrap";
import { BookData } from "../structs";
import { addBook } from "../api/DatabaseAPI";
import { toast, ToastContainer } from "react-toastify";
import { useLibrary } from "../../libraryContext";
import 'react-toastify/dist/ReactToastify.css';

export function AddBookForm() {
	const { refreshModerBooks } = useLibrary();

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
			// @ts-ignore
			authors,
			// @ts-ignore
			genres
		};

		try {
			await addBook(book);
			setTitle("");
			setTotalPages(null);
			setRating(null);
			setIsbn(null);
			setPublishedDate("");
			setAuthors([]);
			setGenres([]);
			toast.success("Книга успешно добавлена!");
			refreshModerBooks();
		} catch (error) {
			toast.error(error instanceof Error ? error.message : "Произошла неизвестная ошибка.");
		}
	};

	return (
		<Container className="mt-5">
			<h2 className="mb-4 text-center">Добавить книгу</h2>
			<Card className="p-4 shadow-sm">
				<Form onSubmit={handleSubmit}>
					<Row className="mb-3">
						<Col md={6}>
							<Form.Group>
								<Form.Label>Название</Form.Label>
								<Form.Control value={title} onChange={(e) => setTitle(e.target.value)} required />
							</Form.Group>
						</Col>
						<Col md={3}>
							<Form.Group>
								<Form.Label>Страниц</Form.Label>
								<Form.Control type="number" value={totalPages ?? ""}
									onChange={(e) => {
										const value = e.target.value;
										setTotalPages(value === "" ? null : Number(value));
									}}
									required />
							</Form.Group>
						</Col>
						<Col md={3}>
							<Form.Group>
								<Form.Label>Рейтинг</Form.Label>
								<Form.Control
									type="number"
									step="0.01"
									min="0"
									max="5"
									value={rating ?? ""}
									onChange={(e) => {
										const value = e.target.value;
										const num = value === "" ? null : Number(value);
										if (num === null || (num >= 0 && num <= 5)) {
											setRating(num);
										}
									}}
									required
								/>
								<Form.Text className="text-muted">Допустимое значение от 0 до 5</Form.Text>
							</Form.Group>
						</Col>
					</Row>

					<Row className="mb-3">
						<Col md={6}>
							<Form.Group>
								<Form.Label>ISBN</Form.Label>
								<Form.Control type="number" value={isbn ?? ""} onChange={(e) => setIsbn(Number(e.target.value))} />
								<Form.Text className="text-muted">13-ти значный номер</Form.Text>
							</Form.Group>
						</Col>
						<Col md={6}>
							<Form.Group>
								<Form.Label>Дата публикации</Form.Label>
								<Form.Control type="date" value={publishedDate} onChange={(e) => setPublishedDate(e.target.value)} required />
							</Form.Group>
						</Col>
					</Row>

					<hr />

					<Row className="mb-3">
						<Col md={6}>
							<Form.Group>
								<Form.Label>Добавить автора</Form.Label>
								<div className="d-flex">
									<Form.Control value={authorInput} onChange={(e) => setAuthorInput(e.target.value)} />
									<Button variant="secondary" className="ms-2" onClick={addAuthor}>+</Button>
								</div>
								<ul className="mt-2">{authors.map((a, i) => <li key={i}>{a}</li>)}</ul>
							</Form.Group>
						</Col>

						<Col md={6}>
							<Form.Group>
								<Form.Label>Добавить жанр</Form.Label>
								<div className="d-flex">
									<Form.Control value={genreInput} onChange={(e) => setGenreInput(e.target.value)} />
									<Button variant="secondary" className="ms-2" onClick={addGenre}>+</Button>
								</div>
								<ul className="mt-2">{genres.map((g, i) => <li key={i}>{g}</li>)}</ul>
							</Form.Group>
						</Col>
					</Row>

					<div className="text-end">
						<Button type="submit" variant="primary">Добавить книгу</Button>
					</div>
				</Form>
			</Card>

			<ToastContainer position="top-right" autoClose={3000} hideProgressBar={false} pauseOnHover />
		</Container>
	);
}
