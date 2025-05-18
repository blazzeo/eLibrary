import { useState } from "react";
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
import { BookData, BookInfo } from "../structs";
import { addLoan, confirmExtension, editBook, rejectExtension } from "../api/DatabaseAPI";
import { toast } from "react-toastify";
import { useLibrary } from "../../libraryContext";
// import { format } from 'date-fns';

interface Props {
	bookInfo: BookInfo;
}

export default function BookPage({ bookInfo }: Props) {
	const { refreshModerBooks } = useLibrary();
	const { book, owner, extension_request, wishlist } = bookInfo;

	const [showEditModal, setShowEditModal] = useState(false);
	const [showLoanModal, setShowLoanModal] = useState(false);
	const [selectedUser, setSelectedUser] = useState('');
	const [returnDate, setReturnDate] = useState('');


	const [title, setTitle] = useState(book.title);
	const [authors, setAuthors] = useState(book.authors);
	const [genres, setGenres] = useState(book.genres);
	const [authorInput, setAuthorInput] = useState("");
	const [genreInput, setGenreInput] = useState("");
	const [publishedDate, setPublishedDate] = useState(book.published_date);
	const [totalPages, setTotalPages] = useState(book.total_pages);
	const [rating, setRating] = useState(book.rating);

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

	const handleSave = async () => {
		const editedBook: BookData = {
			book_id: book.book_id,
			title: title,
			published_date: publishedDate,
			authors: authors,
			genres: genres,
			total_pages: totalPages,
			rating: rating,
			isbn: book.isbn,
			borrow_date: new Date(),
			return_date: new Date(),
			loan_status: 0
		}
		await editBook(editedBook)
		setShowEditModal(false);
	};

	const confirm_request = async () => {
		try {
			await confirmExtension(book.book_id, owner.user_id, extension_request);
			refreshModerBooks();
			toast.success('Продление подтверждено');
		} catch (err: any) {
			toast.error(err?.response?.data?.error || 'Ошибка при подтверждении продления');
		}
	};

	const reject_request = async () => {
		try {
			await rejectExtension(book.book_id, owner.user_id, extension_request);
			refreshModerBooks();
			toast.success('Продление отклонено');
		} catch (err: any) {
			toast.error(err?.response?.data?.error || 'Ошибка при отклонении продления');
		}
	};

	const handle_borrow = async () => {
		try {
			await addLoan(selectedUser, book.book_id, new Date(returnDate));
			refreshModerBooks();
			setShowLoanModal(false);
			toast.success(`Книга выдана пользователю ${selectedUser}`);
		} catch (err: any) {
			toast.error(err?.response?.data?.error || 'Ошибка при выдаче книги');
		}
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

								<Button
									variant="outline-primary"
									size="sm"
									onClick={() => setShowEditModal(true)}
								>
									<i className="bi bi-pencil"></i> Редактировать
								</Button>
							</div>

							<Row className="g-3 mb-3">
								<Col md={6}>
									<div className="book-meta">
										<p><strong>Дата публикации:</strong> {book.published_date}</p>
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
													<small>С {owner.borrow_date} по {owner.return_date}</small>
												</div>
											</div>
											{extension_request && (
												<div className="d-flex flex-column">
													<Alert variant="warning" className="mb-2">
														<Alert.Heading>Запрос на продление</Alert.Heading>
														<p>До: {extension_request}</p>
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

				<Tab eventKey="wishlist" title="Отложенные">
					<Card>
						<Card.Body>
							<Card.Title>Пользователи, ожидающие книгу</Card.Title>
							{wishlist.length > 0 ? (
								<ListGroup variant="flush">
									{wishlist.map(user => (
										<ListGroup.Item key={user.user_id}>
											<div className="d-flex justify-content-between align-items-center">
												<div>
													<h5>{user.user_name}</h5>
													<small className="text-muted">
														Запрос от {user.request_date}
													</small>
												</div>
												{/* Button here */}
												<button className="btn btn-outline-danger" >Снять</button>
											</div>
										</ListGroup.Item>
									))}
								</ListGroup>
							) : (
								<Alert variant="info">
									Нет пользователей, ожидающих эту книгу
								</Alert>
							)}
						</Card.Body>
					</Card>
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
									<div className="d-flex">
										<Form.Control
											value={authorInput}
											onChange={(e) => setAuthorInput(e.target.value)}
										/>
										<Button variant="secondary" className="ms-2" onClick={addAuthor}>+</Button>
									</div>
									<ul className="mt-2">
										{authors.map((a, i) => (
											<li key={i}>{a}</li>
										))}
									</ul>
								</Form.Group>
							</Col>

							<Col md={6}>
								<Form.Group>
									<Form.Label>Добавить жанр</Form.Label>
									<div className="d-flex">
										<Form.Control
											value={genreInput}
											onChange={(e) => setGenreInput(e.target.value)}
										/>
										<Button variant="secondary" className="ms-2" onClick={addGenre}>+</Button>
									</div>
									<ul className="mt-2">
										{genres.map((g, i) => (
											<li key={i}>{g}</li>
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
									/>
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
								<Form.Group>
									<Form.Label>Рейтинг</Form.Label>
									<Form.Control
										type="number"
										step="0.1"
										min={0}
										max={5}
										value={rating}
										onChange={(e) => setRating(Number(e.target.value))}
									/>
								</Form.Group>
							</Col>
						</Row>
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
						<Form.Group className="mb-3">
							<Form.Label>Выберите пользователя</Form.Label>
							<Form.Select
								value={selectedUser}
								onChange={(e) => setSelectedUser(e.target.value)}
								className="mb-3"
							>
								<option value="">Выберите пользователя</option>
								{wishlist.map(user => (
									<option key={user.user_id} value={user.user_id}>
										{user.user_name} (запрос от {user.request_date})
									</option>
								))}
							</Form.Select>
						</Form.Group>
						<Form.Group>
							<Form.Label>Дата возврата</Form.Label>
							<Form.Control
								type="date"
								value={returnDate}
								onChange={(e) => setReturnDate(e.target.value)}
								min={new Date().toISOString().split('T')[0]}
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
		</div>
	);
}
