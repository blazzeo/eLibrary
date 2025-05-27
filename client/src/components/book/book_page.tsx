import { useEffect, useState } from "react";
import {
	Button,
	Modal,
	Form,
	Card,
	Badge,
	ListGroup,
	Tab,
	Tabs,
	Alert,
	Row,
	Col
} from "react-bootstrap";
import { BookData, BookInfo, UserData, Author } from "../structs";
import { addLoan, confirmExtension, deleteBook, editBook, rejectExtension, toggleWishlist, searchAuthors, searchGenres, returnBook } from "../../api/DatabaseAPI";
import { toast } from "react-toastify";
import { useLibrary } from "../../context/libraryContext";
import { useNavigate } from "react-router";

interface Props {
	bookInfo: BookInfo;
}

export default function BookPage({ bookInfo }: Props) {
	const navigate = useNavigate()
	const { refreshAll, users, user } = useLibrary();
	const { book, owner, extension_request, wishlist } = bookInfo;

	const [showEditModal, setShowEditModal] = useState(false);
	const [showLoanModal, setShowLoanModal] = useState(false);
	const [showDeleteModal, setShowDeleteModal] = useState(false);
	const [showBorrowBook, setShowBorrowBook] = useState(false);
	const [selectedUser, setSelectedUser] = useState('');
	const [returnDate, setReturnDate] = useState('');

	const [searchTerm, setSearchTerm] = useState("");
	const [filteredUsers, setFilteredUsers] = useState<UserData[]>([]);
	const [dropdownVisible, setDropdownVisible] = useState(false);

	const [authorSearchResults, setAuthorSearchResults] = useState<Author[]>([]);
	const [genreSearchResults, setGenreSearchResults] = useState<Array<{ genre: string }>>([]);
	const [showAuthorDropdown, setShowAuthorDropdown] = useState(false);
	const [showGenreDropdown, setShowGenreDropdown] = useState(false);

	const [authors, setAuthors] = useState<Author[]>(
		(book.authors || []).map(authorName => {
			if (!authorName) return {
				author_id: 0,
				first_name: '',
				middle_name: null,
				last_name: null,
				full_name: ''
			};

			const parts = authorName.split(' ');
			return {
				author_id: 0,
				first_name: parts[0] || '',
				middle_name: parts[2] || null,
				last_name: parts[1] || null,
				full_name: authorName
			};
		}).filter(author => author.first_name !== '') // Удаляем пустых авторов
	);

	const [book_id, _setBookId] = useState<number | null>(book.book_id)
	const [title, setTitle] = useState(book.title);
	const [genres, setGenres] = useState(book.genres);
	const [authorInput, setAuthorInput] = useState("");
	const [genreInput, setGenreInput] = useState("");
	const [publishedDate, setPublishedDate] = useState<string>(
		book.published_date instanceof Date
			? book.published_date.toISOString().split('T')[0]
			: new Date(book.published_date).toISOString().split('T')[0]
	);
	const [totalPages, setTotalPages] = useState(book.total_pages);
	const [rating, setRating] = useState(book.rating);
	const [isbn, setIsbn] = useState(book.isbn || '');

	useEffect(() => {
		if (searchTerm.trim() === "") {
			setFilteredUsers([]);
			return;
		}

		const filtered = users?.filter((u) =>
			u.user_name.toLowerCase().includes(searchTerm.toLowerCase())
		) || [];
		setFilteredUsers(filtered);
	}, [searchTerm, users]);

	const handleSelectUser = (name: string) => {
		setSelectedUser(name);
		setSearchTerm(name);
		setDropdownVisible(false);
	};

	const handleAuthorSearch = async (searchTerm: string) => {
		setAuthorInput(searchTerm);
		if (searchTerm.trim() === '') {
			setAuthorSearchResults([]);
			return;
		}
		try {
			const results = await searchAuthors(searchTerm);
			setAuthorSearchResults(results);
			setShowAuthorDropdown(true);
		} catch (error) {
			console.error('Error searching authors:', error);
		}
	};

	const handleGenreSearch = async (searchTerm: string) => {
		setGenreInput(searchTerm);
		if (searchTerm.trim() === '') {
			setGenreSearchResults([]);
			return;
		}
		try {
			const results = await searchGenres(searchTerm);
			setGenreSearchResults(results);
			setShowGenreDropdown(true);
		} catch (error) {
			console.error('Error searching genres:', error);
		}
	};

	const selectAuthor = (author: Author) => {
		console.log('Selecting author:', author);
		console.log('Current authors:', authors);
		const isDuplicate = authors.some(a => a.full_name === author.full_name);
		if (!isDuplicate) {
			const updatedAuthors = [...authors, author];
			console.log('Updated authors after selection:', updatedAuthors);
			setAuthors(updatedAuthors);
		} else {
			console.log('Duplicate author detected, not adding');
		}
		setAuthorInput('');
		setShowAuthorDropdown(false);
	};

	const selectGenre = (genre: string) => {
		if (!genres.includes(genre)) {
			setGenres([...genres, genre]);
		}
		setGenreInput('');
		setShowGenreDropdown(false);
	};

	// const addAuthor = () => {
	// 	console.log('Adding author, current input:', authorInput);
	// 	if (authorInput.trim()) {
	// 		const parts = authorInput.trim().split(' ');
	// 		const newAuthor: Author = {
	// 			author_id: 0,
	// 			first_name: parts[0] || '',
	// 			middle_name: parts[1] || null,
	// 			last_name: parts[2] || null,
	// 			full_name: authorInput.trim()
	// 		};
	// 		console.log('New author object:', newAuthor);
	// 		if (newAuthor.first_name) {
	// 			const updatedAuthors = [...authors, newAuthor];
	// 			console.log('Updated authors array:', updatedAuthors);
	// 			setAuthors(updatedAuthors);
	// 			setAuthorInput('');
	// 		} else {
	// 			toast.error('Имя автора обязательно');
	// 		}
	// 	}
	// };

	const removeAuthor = (indexToRemove: number) => {
		console.log('Removing author:', {
			indexToRemove,
			currentAuthors: authors,
			authorToRemove: authors[indexToRemove]
		});
		const newAuthors = authors.filter((_, index) => index !== indexToRemove);
		console.log('Authors after removal:', newAuthors);
		setAuthors(newAuthors);
	};

	// const addGenre = () => {
	// 	if (genreInput.trim()) {
	// 		setGenres([...genres, genreInput.trim()]);
	// 		setGenreInput("");
	// 	}
	// };

	const removeGenre = (indexToRemove: number) => {
		setGenres(genres.filter((_, index) => index !== indexToRemove));
	};

	const validateForm = (): boolean => {
		if (!title || !totalPages || !rating || !isbn) {
			toast.error("Все обязательные поля должны быть заполнены!");
			return false;
		}
		if (authors.length === 0) {
			toast.error("Добавьте хотя бы одного автора!");
			return false;
		}
		if (genres.length === 0) {
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

		if (rating < 0 || rating > 5) {
			toast.error("Рейтинг должен быть между 0 и 5!");
			return false;
		}

		// Валидация ISBN
		if (!/^\d{13}$/.test(isbn.toString())) {
			toast.error("ISBN должен содержать ровно 13 цифр!");
			return false;
		}

		return true;
	};

	const handleSave = async () => {
		if (!validateForm()) return;

		try {
			console.log('Saving book with authors:', authors);
			const editedBook: BookData = {
				book_id: book_id,
				title: title,
				published_date: new Date(publishedDate),
				authors: authors.filter(a => a.first_name).map(a => {
					console.log('Processing author for save:', a);
					// IDK
					return a.full_name;
				}),
				genres: genres,
				total_pages: Number(totalPages),
				rating: Number(rating),
				isbn: Number(isbn),
				borrow_date: new Date(),
				return_date: new Date(),
				loan_status: 0
			};
			console.log('Final editedBook object:', editedBook);

			const response = await editBook(editedBook);

			if (response.error) {
				toast.error(response.error);
				return;
			}

			toast.success(response.message || "Книга успешно обновлена");
			setShowEditModal(false);
			refreshAll();
		} catch (error: any) {
			if (error.response?.data?.error) {
				toast.error(error.response.data.error);
			} else if (error.message) {
				toast.error(error.message);
			} else {
				toast.error("Произошла неизвестная ошибка при обновлении книги");
			}
			console.error("Ошибка при обновлении книги:", error);
		}
	};

	const handle_delete = async () => {
		try {
			await deleteBook(book.book_id)
			toast.success('Книга успешно удалена')
			setShowDeleteModal(false);
			navigate('/')
		} catch (error) {
			toast.error('Ошибка при удалении книги')
		} finally {
			refreshAll()
		}
	}

	const confirm_request = async () => {
		try {
			await confirmExtension(book.book_id, owner.user_id, extension_request);
			toast.success('Продление подтверждено');
		} catch (err: any) {
			toast.error(err?.response?.data?.error || 'Ошибка при подтверждении продления');
		} finally {
			refreshAll();
		}

	};

	const reject_request = async () => {
		try {
			await rejectExtension(book.book_id, owner.user_id, extension_request);
			toast.success('Продление отклонено');
		} catch (err: any) {
			toast.error(err?.response?.data?.error || 'Ошибка при отклонении продления');
		} finally {
			refreshAll();
		}
	};

	const handle_borrow = async () => {
		try {
			if (!selectedUser || !returnDate) {
				toast.error('Необходимо выбрать пользователя и дату возврата');
				return;
			}
			const response = await addLoan(selectedUser, book.book_id, new Date(returnDate));
			if (response.error) {
				toast.error(response.error);
				return;
			}
			toast.success(`Книга выдана пользователю ${selectedUser}`);
			setShowLoanModal(false);
			setShowBorrowBook(false);
			refreshAll();
		} catch (err: any) {
			if (err.response?.data?.error) {
				toast.error(err.response.data.error);
			} else if (err.message) {
				toast.error(err.message);
			} else {
				toast.error('Произошла неизвестная ошибка при выдаче книги');
			}
			console.error('Ошибка при выдаче книги:', err);
		} finally {
			setSelectedUser("")
			setReturnDate("")
		}
	};

	const delete_wish = async (user_id: number) => {
		try {
			await toggleWishlist(user_id, book.book_id);
			toast.success('Пользователь удален из списка')
		} catch (error) {
			console.error(error)
			toast.error('Пользователь не был удален из списка')
		} finally {
			refreshAll()
		}
	}

	const return_book = async () => {
		try {
			await returnBook(bookInfo.book.book_id)
			toast.success('Запись аннулирована')
		} catch (error) {
			console.error(error)
			toast.error('Произошла ошибка аннулирования записи')
		} finally {
			refreshAll()
		}
	}

	const formatDate = (date: string | Date) => {
		return new Date(date).toLocaleDateString('ru-RU');
	};

	return (
		<div className="container py-4">
			<Card className="mb-4 shadow-sm">
				<Card.Body>
					<Row className="align-items-center">
						<Col md={12}>
							<div className="d-flex justify-content-between align-items-start">
								<div>
									<h2 className="mb-3 fs-2 fw-semibold">{book.title}</h2>

									{/* Авторы */}
									<div className="d-flex flex-wrap gap-2 mb-2">
										<h4>Авторы: </h4>
										{book.authors.map((author, index) => (
											<Badge key={index} bg="primary" pill className="fs-6 px-3 py-2">
												{author}
											</Badge>
										))}
									</div>

									{/* Жанры */}
									<div className="d-flex flex-wrap gap-2 mb-3">
										<h4>Жанры: </h4>
										{book.genres.map((genre, index) => (
											<Badge key={index} bg="success" pill className="fs-6 px-3 py-2">
												{genre}
											</Badge>
										))}
									</div>
								</div>

								{user?.user_role == 'admin' &&
									<div className="d-flex gap-2">
										<Button
											variant="outline-danger"
											size="sm"
											onClick={() => setShowDeleteModal(true)}
										>
											<i className="bi bi-trash"></i> Удалить
										</Button>

										<Button
											variant="outline-primary"
											size="sm"
											onClick={() => setShowEditModal(true)}
										>
											<i className="bi bi-pencil"></i> Редактировать
										</Button>
									</div>}
							</div>

							<Row className="g-3 mb-3">
								<Col md={6}>
									<div className="book-meta">
										<p><strong>Дата публикации:</strong> {formatDate(book.published_date)}</p>
										<p><strong>Страниц:</strong> {book.total_pages}</p>
										<p><strong>Рейтинг:</strong>
											<span className="ms-2">{book.rating}</span>
										</p>
										<p><strong>ISBN:</strong> {book.isbn || 'Не указан'}</p>
									</div>
								</Col>
							</Row>
						</Col>
					</Row>
				</Card.Body>
			</Card>

			<Tabs defaultActiveKey="loan" className="mb-3">
				<Tab eventKey="loan" title="Выдача книги">
					{owner ? (
						<Card className="mb-4">
							<Card.Body>
								<Card.Title className="mb-3">Текущий владелец</Card.Title>
								<ListGroup variant="flush">
									<ListGroup.Item>
										<div className="d-flex justify-content-between align-items-center">
											<div>
												<h5>{owner.user_name}</h5>
												<div className="text-muted">
													<small>С {formatDate(owner.borrow_date)} по {formatDate(owner.return_date)}</small>
												</div>
											</div>
											{extension_request && (
												<div className="d-flex flex-column">
													<Alert variant="warning" className="mb-2">
														<Alert.Heading>Запрос на продление</Alert.Heading>
														<p>До: {formatDate(extension_request)}</p>
													</Alert>
													<div className="d-flex gap-2">
														<Button variant="success" size="sm" onClick={confirm_request}>
															<i className="bi bi-check-circle"></i> Подтвердить
														</Button>
														<Button variant="danger" size="sm" onClick={reject_request}>
															<i className="bi bi-x-circle"></i> Отклонить
														</Button>
													</div>
												</div>
											)}
											<Button
												variant="outline-danger"
												size="lg"
												onClick={() => { return_book() }}
												className="ms-3"
											>
												<i className="bi bi-trash">Удалить</i>
											</Button>
										</div>
									</ListGroup.Item>
								</ListGroup>
							</Card.Body>
						</Card>
					) : (
						<Card className="mb-4">
							<Card.Body>
								<div className="d-flex justify-content-between align-items-center">
									<div>
										<Card.Title>Книга доступна для выдачи</Card.Title>
										<Card.Text className="text-muted">
											В настоящее время книга находится в библиотеке
										</Card.Text>
									</div>
									<Button
										variant="success"
										onClick={() => setShowLoanModal(true)}
										className="d-flex align-items-center gap-2"
									>
										<i className="bi bi-bookmark-plus"></i> Выдать книгу
									</Button>
								</div>
							</Card.Body>
						</Card>
					)}
				</Tab>

				<Tab eventKey="wishlist" title="Отложили">
					<div className="p-3">
						{wishlist && wishlist.length > 0 ? (
							<div className="list-group">
								{wishlist.map(user => (
									<div key={user.user_id} className="list-group-item">
										<div className="d-flex justify-content-between align-items-center">
											<div>
												<strong>{user.user_name}</strong>
												<div className="small text-muted">
													Отложил(а): {formatDate(user.request_date)}
												</div>
											</div>
											<div className="d-flex gap-2">
												{!bookInfo.owner && <button
													className="btn btn-outline-success btn-md"
													onClick={() => {
														setSelectedUser(user.user_name)
														setShowBorrowBook(true)
													}}
												>
													Выдать
												</button>}
												<button
													className="btn btn-outline-danger btn-md"
													onClick={() => delete_wish(user.user_id)}
												>
													Удалить
												</button>
											</div>
										</div>
									</div>
								))}
							</div>
						) : (
							<Alert variant="info">
								Нет пользователей, отложивших эту книгу
							</Alert>
						)}
					</div>
				</Tab>
			</Tabs>

			{/* Модальное окно редактирования */}
			<Modal show={showEditModal} onHide={() => setShowEditModal(false)} size="lg">
				<Modal.Header closeButton>
					<Modal.Title>
						<i className="bi bi-pencil me-2"></i>
						Редактировать книгу
					</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<Form>
						<Form.Group className="mb-3">
							<Form.Label>Название</Form.Label>
							<Form.Control type="text" value={title} onChange={(e) => setTitle(e.target.value)} />
						</Form.Group>

						<Row className="mb-3">
							<Col md={6}>
								<Form.Group>
									<Form.Label>Добавить автора</Form.Label>
									<div className="d-flex position-relative">
										<Form.Control
											value={authorInput}
											onChange={(e) => handleAuthorSearch(e.target.value)}
											onFocus={() => setShowAuthorDropdown(true)}
											placeholder="Начните вводить имя автора..."
										/>
										<Button
											variant="secondary"
											className="ms-2"
											onClick={() => {
												if (authorInput.trim()) {
													selectAuthor({
														author_id: 0,
														first_name: authorInput.trim().split(' ')[0] || '',
														last_name: authorInput.trim().split(' ')[1] || null,
														middle_name: authorInput.trim().split(' ')[2] || null,
														full_name: authorInput.trim()
													});
												}
											}}
										>
											+
										</Button>
										{showAuthorDropdown && authorSearchResults.length > 0 && (
											<div
												className="position-absolute w-100 bg-white border rounded mt-1 shadow-sm"
												style={{ top: '100%', zIndex: 1000, maxHeight: '200px', overflowY: 'auto' }}
											>
												{authorSearchResults.map((author, index) => (
													<div
														key={index}
														className="p-2 hover-bg-light cursor-pointer"
														style={{ cursor: 'pointer' }}
														onClick={() => selectAuthor(author)}
													>
														{author.full_name}
													</div>
												))}
											</div>
										)}
									</div>
									<ul className="mt-2 list-unstyled">
										{authors.map((author, i) => (
											<li key={i} className="d-flex align-items-center mb-2">
												<span>{author.full_name}</span>
												<Button
													variant="link"
													className="text-danger ms-2 p-0"
													onClick={() => removeAuthor(i)}
													style={{ textDecoration: 'none' }}
												>
													<i className="bi bi-x-circle"></i>
												</Button>
											</li>
										))}
									</ul>
								</Form.Group>
							</Col>

							<Col md={6}>
								<Form.Group>
									<Form.Label>Добавить жанр</Form.Label>
									<div className="d-flex position-relative">
										<Form.Control
											value={genreInput}
											onChange={(e) => handleGenreSearch(e.target.value)}
											onFocus={() => setShowGenreDropdown(true)}
											placeholder="Начните вводить название жанра..."
										/>
										<Button
											variant="secondary"
											className="ms-2"
											onClick={() => {
												if (genreInput.trim()) {
													selectGenre(genreInput.trim());
												}
											}}
										>
											+
										</Button>
										{showGenreDropdown && genreSearchResults.length > 0 && (
											<div
												className="position-absolute w-100 bg-white border rounded mt-1 shadow-sm"
												style={{ top: '100%', zIndex: 1000, maxHeight: '200px', overflowY: 'auto' }}
											>
												{genreSearchResults.map((genre, index) => (
													<div
														key={index}
														className="p-2 hover-bg-light cursor-pointer"
														style={{ cursor: 'pointer' }}
														onClick={() => selectGenre(genre.genre)}
													>
														{genre.genre}
													</div>
												))}
											</div>
										)}
									</div>
									<ul className="mt-2 list-unstyled">
										{genres.map((g, i) => (
											<li key={i} className="d-flex align-items-center mb-2">
												<span>{g}</span>
												<Button
													variant="link"
													className="text-danger ms-2 p-0"
													onClick={() => removeGenre(i)}
													style={{ textDecoration: 'none' }}
												>
													<i className="bi bi-x-circle"></i>
												</Button>
											</li>
										))}
									</ul>
								</Form.Group>
							</Col>
						</Row>

						<Row className="mb-3">
							<Col md={4}>
								<Form.Group>
									<Form.Label>Дата публикации</Form.Label>
									<Form.Control
										type="date"
										value={publishedDate}
										onChange={(e) => setPublishedDate(e.target.value)}
										min="1800-01-01"
										max={new Date().toISOString().split('T')[0]}
									/>
									<Form.Text className="text-muted">
										Дата должна быть между 1800 годом и текущей датой
									</Form.Text>
								</Form.Group>
							</Col>
							<Col md={4}>
								<Form.Group>
									<Form.Label>Количество страниц</Form.Label>
									<Form.Control
										type="number"
										value={totalPages}
										onChange={(e) => setTotalPages(Number(e.target.value))}
									/>
								</Form.Group>
							</Col>
							<Col md={4}>
								<Form.Group className="mb-3">
									<Form.Label>Рейтинг</Form.Label>
									<Form.Control
										type="number"
										min="0"
										max="5"
										step="0.1"
										value={rating}
										onChange={(e) => setRating(parseFloat(e.target.value))}
									/>
								</Form.Group>
							</Col>
						</Row>

						<Form.Group className="mb-3">
							<Form.Label>ISBN</Form.Label>
							<Form.Control
								type="text"
								pattern="\d{13}"
								maxLength={13}
								placeholder="Введите 13 цифр ISBN"
								value={isbn}
								onChange={(e) => {
									const value = e.target.value.replace(/\D/g, '').slice(0, 13);
									setIsbn(value);
								}}
								required
							/>
							<Form.Text className="text-muted">
								ISBN должен содержать ровно 13 цифр
							</Form.Text>
						</Form.Group>
					</Form>
				</Modal.Body>
				<Modal.Footer>
					<Button variant="secondary" onClick={() => setShowEditModal(false)}>
						Отмена
					</Button>
					<Button variant="primary" onClick={handleSave}>
						Сохранить изменения
					</Button>
				</Modal.Footer>
			</Modal>

			{/* Модальное окно выдачи */}
			<Modal show={showLoanModal} onHide={() => setShowLoanModal(false)}>
				<Modal.Header closeButton className="bg-light">
					<Modal.Title>
						<i className="bi bi-bookmark-plus me-2"></i>
						Выдать книгу
					</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<Form>
						<Form.Group className="mb-3 position-relative">
							<Form.Label>Выберите пользователя</Form.Label>
							<Form.Control
								type="text"
								placeholder="Начните вводить имя пользователя..."
								value={searchTerm}
								onChange={(e) => {
									setSearchTerm(e.target.value);
									setDropdownVisible(true);
								}}
								onFocus={() => setDropdownVisible(true)}
								autoComplete="off"
							/>
							{dropdownVisible && filteredUsers.length > 0 && (
								<div className="position-absolute w-100 bg-white border rounded mt-1 shadow-sm z-3" style={{ maxHeight: '200px', overflowY: 'auto' }}>
									{filteredUsers.map((u) => (
										<div
											key={u.user_id}
											className="px-3 py-2 dropdown-item"
											style={{ cursor: "pointer" }}
											onClick={() => handleSelectUser(u.user_name)}
										>
											{u.user_name}
										</div>
									))}
								</div>
							)}
						</Form.Group>

						<Form.Group>
							<Form.Label>Дата возврата</Form.Label>
							<Form.Control
								type="date"
								value={returnDate}
								onChange={(e) => setReturnDate(e.target.value)}
								min={new Date().toISOString().split("T")[0]}
							/>
						</Form.Group>
					</Form>
				</Modal.Body>
				<Modal.Footer>
					<Button variant="secondary" onClick={() => setShowLoanModal(false)}>
						Отмена
					</Button>
					<Button
						variant="success"
						onClick={handle_borrow}
						disabled={!selectedUser || !returnDate}
					>
						Подтвердить выдачу
					</Button>
				</Modal.Footer>
			</Modal>

			<Modal show={showDeleteModal} onHide={() => setShowDeleteModal(false)} centered>
				<Modal.Header closeButton>
					<Modal.Title>Подтверждение удаления</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					Вы уверены, что хотите удалить книгу <strong>{book.title}</strong>?
				</Modal.Body>
				<Modal.Footer>
					<Button variant="secondary" onClick={() => setShowDeleteModal(false)}>
						Отмена
					</Button>
					<Button variant="danger" onClick={handle_delete}>
						Удалить
					</Button>
				</Modal.Footer>
			</Modal>

			<Modal show={showBorrowBook} centered onHide={() => setShowBorrowBook(false)}>
				<Modal.Header closeButton>
					<Modal.Title>Выдача книги</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<Form>
						<Form.Group>
							<Form.Label>Дата возврата</Form.Label>
							<Form.Control
								type="date"
								value={returnDate}
								onChange={(e) => setReturnDate(e.target.value)}
								min={new Date().toISOString().split("T")[0]}
							/>
						</Form.Group>
					</Form>
				</Modal.Body>
				<Modal.Footer>
					<Button variant="success" onClick={handle_borrow} disabled={!returnDate}>
						Выдать
					</Button>
					<Button variant="secondary" onClick={() => setShowBorrowBook(false)}>
						Отмена
					</Button>
				</Modal.Footer>
			</Modal>

		</div >
	);
}
