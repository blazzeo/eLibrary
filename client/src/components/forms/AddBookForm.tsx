import { useState, useEffect } from "react";
import { Card, Button, Form, Row, Col, Container, ListGroup, ProgressBar } from "react-bootstrap";
import { BookData } from "../structs";
import { addBook, searchAuthors, searchGenres } from "../../api/DatabaseAPI";
import { toast, ToastContainer } from "react-toastify";
import { useLibrary } from "../../context/libraryContext";
import 'react-toastify/dist/ReactToastify.css';

interface Author {
	author_id: number;
	first_name: string;
	middle_name: string | null;
	last_name: string | null;
	full_name: string;
}

interface Genre {
	genre_id: number;
	genre: string;
	parent_id: number | null;
	parent_genre: string | null;
}

// Стили для контейнера полоски загрузки
const loadingBarStyle: React.CSSProperties = {
	position: 'absolute',
	bottom: '-8px',
	left: 0,
	right: 0,
	backgroundColor: 'transparent',
	zIndex: 2,
	padding: '4px 0',
};

// Стили для самой полоски
const progressBarStyle: React.CSSProperties = {
	height: '4px',
	borderRadius: 0,
	boxShadow: '0 0 4px rgba(0,123,255,0.5)'
};

// Функция для создания нового автора из строки
const createNewAuthor = (fullName: string): Author => {
	const parts = fullName.trim().split(/\s+/);
	return {
		author_id: -Date.now(), // Временный отрицательный ID для новых авторов
		first_name: parts[0] || '',
		middle_name: parts.length === 3 ? parts[1] : null,
		last_name: parts.length >= 2 ? parts[parts.length - 1] : null,
		full_name: fullName.trim()
	};
};

// Функция для создания нового жанра из строки
const createNewGenre = (genreName: string): Genre => {
	return {
		genre_id: -Date.now(), // Временный отрицательный ID для новых жанров
		genre: genreName.trim(),
		parent_id: null,
		parent_genre: null
	};
};

export function AddBookForm() {
	const { refreshAll } = useLibrary();

	const [title, setTitle] = useState("");
	const [totalPages, setTotalPages] = useState<number | null>(null);
	const [rating, setRating] = useState<number | null>(null);
	const [isbn, setIsbn] = useState<number | null>(null);
	const [publishedDate, setPublishedDate] = useState<string>("");

	// Состояния для поиска
	const [authorSearchTerm, setAuthorSearchTerm] = useState("");
	const [genreSearchTerm, setGenreSearchTerm] = useState("");
	const [authorResults, setAuthorResults] = useState<Author[]>([]);
	const [genreResults, setGenreResults] = useState<Genre[]>([]);
	const [showAuthorDropdown, setShowAuthorDropdown] = useState(false);
	const [showGenreDropdown, setShowGenreDropdown] = useState(false);

	// Выбранные авторы и жанры
	const [selectedAuthors, setSelectedAuthors] = useState<Author[]>([]);
	const [selectedGenres, setSelectedGenres] = useState<Genre[]>([]);

	// Состояния для индикаторов загрузки
	const [_isLoadingAuthors, setIsLoadingAuthors] = useState(false);
	const [_isLoadingGenres, setIsLoadingGenres] = useState(false);

	// Состояния для отслеживания ввода
	const [isTypingAuthors, setIsTypingAuthors] = useState(false);
	const [isTypingGenres, setIsTypingGenres] = useState(false);
	const [typingTimeoutAuthors, setTypingTimeoutAuthors] = useState<ReturnType<typeof setTimeout> | null>(null);
	const [typingTimeoutGenres, setTypingTimeoutGenres] = useState<ReturnType<typeof setTimeout> | null>(null);

	// Поиск авторов
	useEffect(() => {
		const searchAuthorsDebounced = async () => {
			if (authorSearchTerm.trim().length < 2) {
				setAuthorResults([]);
				return;
			}

			try {
				setIsLoadingAuthors(true);
				console.log('Поиск авторов:', authorSearchTerm);
				const results = await searchAuthors(authorSearchTerm);
				console.log('Результаты поиска авторов:', results);
				setAuthorResults(results);
			} catch (error) {
				console.error('Ошибка при поиске авторов:', error);
			} finally {
				setIsLoadingAuthors(false);
			}
		};

		const timeoutId = setTimeout(searchAuthorsDebounced, 300);
		return () => clearTimeout(timeoutId);
	}, [authorSearchTerm]);

	// Поиск жанров
	useEffect(() => {
		const searchGenresDebounced = async () => {
			if (genreSearchTerm.trim().length < 2) {
				setGenreResults([]);
				return;
			}

			try {
				setIsLoadingGenres(true);
				console.log('Поиск жанров:', genreSearchTerm);
				const results = await searchGenres(genreSearchTerm);
				console.log('Результаты поиска жанров:', results);
				setGenreResults(results);
			} catch (error) {
				console.error('Ошибка при поиске жанров:', error);
			} finally {
				setIsLoadingGenres(false);
			}
		};

		const timeoutId = setTimeout(searchGenresDebounced, 300);
		return () => clearTimeout(timeoutId);
	}, [genreSearchTerm]);

	// Обработчик ввода для авторов
	const handleAuthorInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
		const value = e.target.value;
		setAuthorSearchTerm(value);
		setShowAuthorDropdown(true);
		setIsTypingAuthors(true);

		if (typingTimeoutAuthors) {
			clearTimeout(typingTimeoutAuthors);
		}

		const newTimeout = setTimeout(() => {
			setIsTypingAuthors(false);
		}, 500);

		setTypingTimeoutAuthors(newTimeout);
	};

	// Обработчик ввода для жанров
	const handleGenreInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
		const value = e.target.value;
		setGenreSearchTerm(value);
		setShowGenreDropdown(true);
		setIsTypingGenres(true);

		if (typingTimeoutGenres) {
			clearTimeout(typingTimeoutGenres);
		}

		const newTimeout = setTimeout(() => {
			setIsTypingGenres(false);
		}, 500);

		setTypingTimeoutGenres(newTimeout);
	};

	// Очистка таймеров при размонтировании
	useEffect(() => {
		return () => {
			if (typingTimeoutAuthors) clearTimeout(typingTimeoutAuthors);
			if (typingTimeoutGenres) clearTimeout(typingTimeoutGenres);
		};
	}, []);

	const handleAuthorSelect = (author: Author) => {
		console.log('Выбран автор:', author);
		if (!selectedAuthors.some(a => a.author_id === author.author_id)) {
			setSelectedAuthors([...selectedAuthors, author]);
		}
		setAuthorSearchTerm("");
		setShowAuthorDropdown(false);
	};

	const handleGenreSelect = (genre: Genre) => {
		console.log('Выбран жанр:', genre);
		if (!selectedGenres.some(g => g.genre_id === genre.genre_id)) {
			setSelectedGenres([...selectedGenres, genre]);
		}
		setGenreSearchTerm("");
		setShowGenreDropdown(false);
	};

	const removeAuthor = (authorId: number) => {
		console.log('Удален автор с ID:', authorId);
		setSelectedAuthors(selectedAuthors.filter(a => a.author_id !== authorId));
	};

	const removeGenre = (genreId: number) => {
		console.log('Удален жанр с ID:', genreId);
		setSelectedGenres(selectedGenres.filter(g => g.genre_id !== genreId));
	};

	const handleAuthorKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
		if (e.key === 'Enter' && authorSearchTerm.trim()) {
			e.preventDefault();
			if (!authorResults.length) {
				// Если нет результатов поиска, создаем нового автора
				const newAuthor = createNewAuthor(authorSearchTerm);
				if (!selectedAuthors.some(a => a.full_name.toLowerCase() === newAuthor.full_name.toLowerCase())) {
					setSelectedAuthors([...selectedAuthors, newAuthor]);
					toast.info(`Будет создан новый автор: ${newAuthor.full_name}`);
				}
			}
			setAuthorSearchTerm('');
			setShowAuthorDropdown(false);
		}
	};

	const handleGenreKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
		if (e.key === 'Enter' && genreSearchTerm.trim()) {
			e.preventDefault();
			if (!genreResults.length) {
				// Если нет результатов поиска, создаем новый жанр
				const newGenre = createNewGenre(genreSearchTerm);
				if (!selectedGenres.some(g => g.genre.toLowerCase() === newGenre.genre.toLowerCase())) {
					setSelectedGenres([...selectedGenres, newGenre]);
					toast.info(`Будет создан новый жанр: ${newGenre.genre}`);
				}
			}
			setGenreSearchTerm('');
			setShowGenreDropdown(false);
		}
	};

	const validateForm = (): boolean => {
		if (!title || !totalPages || !rating || !publishedDate) {
			toast.error("Все обязательные поля должны быть заполнены!");
			return false;
		}
		if (selectedAuthors.length === 0) {
			toast.error("Добавьте хотя бы одного автора!");
			return false;
		}
		if (selectedGenres.length === 0) {
			toast.error("Добавьте хотя бы один жанр!");
			return false;
		}

		// Валидация даты публикации
		const publishedYear = new Date(publishedDate).getFullYear();
		const currentYear = new Date().getFullYear();
		const minYear = 1800;

		if (publishedYear < minYear || publishedYear > currentYear) {
			toast.error(`Год публикации должен быть между ${minYear} и ${currentYear}`);
			return false;
		}

		return true;
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
			borrow_date: new Date(),
			return_date: new Date(),
			loan_status: 0,
			is_in_my_wishlist: false,
			authors: selectedAuthors.map(a => a.full_name),
			genres: selectedGenres.map(g => g.genre)
		};

		try {
			const response = await addBook(book);
			if (response.error) {
				toast.error(response.error);
				return;
			}

			// Очищаем форму только при успешном добавлении
			setTitle("");
			setTotalPages(null);
			setRating(null);
			setIsbn(null);
			setPublishedDate("");
			setSelectedAuthors([]);
			setSelectedGenres([]);
			toast.success(response.message || "Книга успешно добавлена!");
			refreshAll();
		} catch (error: any) {
			// Обработка различных типов ошибок
			if (error.response?.data?.error) {
				// Ошибка с сервера с конкретным сообщением
				toast.error(error.response.data.error);
			} else if (error.message) {
				// Ошибка с сообщением
				toast.error(error.message);
			} else {
				// Неизвестная ошибка
				toast.error("Произошла неизвестная ошибка при добавлении книги");
			}
			console.error("Ошибка при добавлении книги:", error);
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
								<Form.Control
									type="number"
									value={isbn ?? ""}
									onChange={(e) => {
										const value = e.target.value;
										if (value.length <= 13) {
											setIsbn(value === "" ? null : Number(value));
										}
									}}
									maxLength={13}
								/>
								<Form.Text className="text-muted">13-значный номер (максимум 13 цифр)</Form.Text>
							</Form.Group>
						</Col>
						<Col md={6}>
							<Form.Group>
								<Form.Label>Дата публикации</Form.Label>
								<Form.Control
									type="date"
									value={publishedDate}
									onChange={(e) => setPublishedDate(e.target.value)}
									min="1800-01-01"
									max={new Date().toISOString().split('T')[0]}
									required
								/>
								<Form.Text className="text-muted">
									Дата должна быть между 1800 годом и текущей датой
								</Form.Text>
							</Form.Group>
						</Col>
					</Row>

					<hr />

					<Row className="mb-3">
						<Col md={6}>
							<Form.Group className="mb-4">
								<Form.Label>Поиск авторов</Form.Label>
								<div className="position-relative">
									<Form.Control
										type="text"
										value={authorSearchTerm}
										onChange={handleAuthorInputChange}
										onKeyDown={handleAuthorKeyDown}
										placeholder="Начните вводить имя автора..."
										onFocus={() => setShowAuthorDropdown(true)}
									/>
									{isTypingAuthors && (
										<div style={loadingBarStyle}>
											<ProgressBar
												animated
												now={100}
												variant="primary"
												style={progressBarStyle}
											/>
										</div>
									)}
									{showAuthorDropdown && authorResults.length > 0 && (
										<ListGroup className="position-absolute w-100 mt-1 shadow-sm" style={{ zIndex: 1000 }}>
											{authorResults.map((author) => (
												<ListGroup.Item
													key={author.author_id}
													action
													onClick={() => handleAuthorSelect(author)}
													className="cursor-pointer"
												>
													{author.full_name}
												</ListGroup.Item>
											))}
										</ListGroup>
									)}
								</div>
							</Form.Group>
							<div className="selected-items">
								{selectedAuthors.map((author) => (
									<div key={author.author_id} className="d-inline-block me-2 mb-2">
										<span className="badge bg-primary p-2">
											{author.full_name}
											<button
												type="button"
												className="btn-close btn-close-white ms-2"
												style={{ fontSize: '0.5rem' }}
												onClick={() => removeAuthor(author.author_id)}
											></button>
										</span>
									</div>
								))}
							</div>
						</Col>

						<Col md={6}>
							<Form.Group className="mb-4">
								<Form.Label>Поиск жанров</Form.Label>
								<div className="position-relative">
									<Form.Control
										type="text"
										value={genreSearchTerm}
										onChange={handleGenreInputChange}
										onKeyDown={handleGenreKeyDown}
										placeholder="Начните вводить название жанра..."
										onFocus={() => setShowGenreDropdown(true)}
									/>
									{isTypingGenres && (
										<div style={loadingBarStyle}>
											<ProgressBar
												animated
												now={100}
												variant="primary"
												style={progressBarStyle}
											/>
										</div>
									)}
									{showGenreDropdown && genreResults.length > 0 && (
										<ListGroup className="position-absolute w-100 mt-1 shadow-sm" style={{ zIndex: 1000 }}>
											{genreResults.map((genre) => (
												<ListGroup.Item
													key={genre.genre_id}
													action
													onClick={() => handleGenreSelect(genre)}
													className="cursor-pointer"
												>
													{genre.genre}
													{genre.parent_genre && (
														<small className="text-muted ms-2">
															(подкатегория {genre.parent_genre})
														</small>
													)}
												</ListGroup.Item>
											))}
										</ListGroup>
									)}
								</div>
							</Form.Group>
							<div className="selected-items">
								{selectedGenres.map((genre) => (
									<div key={genre.genre_id} className="d-inline-block me-2 mb-2">
										<span className="badge bg-success p-2">
											{genre.genre}
											<button
												type="button"
												className="btn-close btn-close-white ms-2"
												style={{ fontSize: '0.5rem' }}
												onClick={() => removeGenre(genre.genre_id)}
											></button>
										</span>
									</div>
								))}
							</div>
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
