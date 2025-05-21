import {
	Button,
	Card,
	Badge,
	Row,
	Col
} from "react-bootstrap";
import { BookData } from "../structs";
import { toggleWishlist } from "../api/DatabaseAPI";
import { toast } from "react-toastify";
import { useLibrary } from "../../libraryContext";

interface Props {
	book: BookData;
}

export default function UserBookPage({ book }: Props) {
	const { refreshBooks } = useLibrary();

	// 0 - mine
	// 1 - in my wishlist
	// 2 - not in my wishlist
	const handle_wish = async () => {
		let init_state = book.loan_status;
		try {
			const user_name = sessionStorage.getItem("userName")
			if (user_name === null || user_name === undefined)
				throw Error("Имя пользователя не было получено")
			await toggleWishlist(user_name!, book.book_id!)
			if (init_state === 1)
				toast.success('Книга удалена')
			else
				toast.success('Книга добавлена')
		} catch (error) {
			console.error(error)
			if (init_state == 2)
				toast.error("Ошибка: книга не была добавлена в ожидаемоe")
			else
				toast.error("Ошибка: книга не была удалена из ожидаемого")
		} finally {
			refreshBooks()
		}
	}

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
					<Row>
						<Button className="btn" disabled={book.loan_status === 0} onClick={() => handle_wish()}>
							{book.loan_status === 0
								? "Моя"
								: book.loan_status === 1
									? "Удалить из ожидаемого"
									: "Добавить в ожидаемое"}
						</Button>
					</Row>
				</Card.Body>
			</Card>

		</div>
	);
}
