import {
	Button,
	Card,
	Badge,
	Row,
	Col
} from "react-bootstrap";
import { BookData } from "../structs";
import { toggleWishlist } from "../../api/DatabaseAPI";
import { toast } from "react-toastify";
import { useLibrary } from "../../context/libraryContext";
import { AskExtensionForm } from "../../components/forms/AskExtensionForm";
import { useState } from "react";

interface Props {
	book: BookData;
}

export default function UserBookPage({ book }: Props) {
	const { refreshAll, user } = useLibrary();

	// Состояния для модального окна продления
	const [showExtensionModal, setShowExtensionModal] = useState(false);

	const handleToggleWishlist = async () => {
		const wasInWishlist = book.is_in_my_wishlist; // Используем новое булево поле
		try {
			if (!user?.user_id) {
				throw new Error("ID пользователя не был получен. Пожалуйста, войдите в систему.");
			}

			await toggleWishlist(user.user_id, book.book_id);

			if (wasInWishlist) { // Была в вишлисте -> удалили
				toast.success('Книга удалена из списка бронирований!');
			} else { // Не была в вишлисте -> добавили
				toast.success('Книга добавлена в список желаний/забронирована!');
			}

		} catch (error: any) {
			console.error("Ошибка при обновлении статуса списка бронирований:", error);
			let errorMessage = "Произошла неизвестная ошибка.";
			if (error.message) {
				errorMessage = error.message;
			}
			toast.error(`Ошибка: ${errorMessage}`);
		} finally {
			refreshAll(); // Всегда обновляем данные, чтобы UI отражал изменения
		}
	}

	// Открытие модального окна запроса на продление
	const handleOpenExtensionModal = () => {
		if (book.loan_status === 1 && book.return_date) { // Используем book.return_date
			setShowExtensionModal(true);
		} else {
			toast.error("Невозможно продлить срок: книга не на руках у вас или нет даты возврата.");
		}
	};

	// Закрытие модального окна запроса на продление
	const handleCloseExtensionModal = () => {
		setShowExtensionModal(false);
	};

	// --- Текст и логика кнопки действия ---
	const getActionButton = () => {
		const isInWishlist = book.is_in_my_wishlist; // Используем новое булево поле

		// 1: My Book (Книга на руках у p_user_id)
		if (book.loan_status === 1) {
			const returnDateText = book.return_date
				? `(до ${new Date(book.return_date).toLocaleDateString()})`
				: '';
			return (
				<Button className="btn btn-warning" onClick={handleOpenExtensionModal}>
					Продлить срок {returnDateText}
				</Button>
			);
		}
		// Книга не у меня на руках
		else {
			// Если книга в моём вишлисте
			if (isInWishlist) {
				return (
					<Button className="btn btn-danger" onClick={handleToggleWishlist}>
						Отменить бронь / Удалить из списка желаний
					</Button>
				);
			}
			// Если книга не в моём вишлисте
			else {
				const borrowedByOtherText = book.loan_status === 3 ? '(занята)' : '';
				const returnDateText = book.loan_status === 3 && book.return_date
					? ` до ${new Date(book.return_date).toLocaleDateString()}`
					: '';

				return (
					<Button className="btn btn-success" onClick={handleToggleWishlist}>
						Забронировать  {borrowedByOtherText}{returnDateText}
					</Button>
				);
			}
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
							</div>

							<Row className="g-3 mb-3">
								<Col md={6}>
									<div className="book-meta">
										<p>
											<strong>Дата публикации:</strong>{' '}
											{book.published_date
												? new Date(book.published_date).toLocaleDateString()
												: 'Не указана'}
										</p>
										<p><strong>Страниц:</strong> {book.total_pages}</p>
										<p><strong>Рейтинг:</strong>
											<span className="ms-2">{book.rating}</span>
										</p>
										<p><strong>ISBN:</strong> {book.isbn || 'Не указан'}</p>

										{/* Информация о текущем займе */}
										{(book.loan_status === 1 || book.loan_status === 3) && (
											<>
												<p>
													<strong>Дата выдачи:</strong>{' '}
													{book.borrow_date
														? new Date(book.borrow_date).toLocaleDateString()
														: 'Неизвестно'}
												</p>
												<p>
													<strong>Ожидаемая дата возврата:</strong>{' '}
													{book.return_date
														? new Date(book.return_date).toLocaleDateString()
														: 'Неизвестно'}
												</p>
											</>
										)}
									</div>
								</Col>
							</Row>
						</Col>
					</Row>
					<Row className="mt-3">
						<Col>
							{getActionButton()}
						</Col>
					</Row>
				</Card.Body>
			</Card>

			{/* Модальное окно для запроса на продление */}
			{showExtensionModal && (
				<AskExtensionForm
					show={showExtensionModal}
					onClose={handleCloseExtensionModal}
					bookId={book.book_id!}
					currentReturnDate={book.return_date ? new Date(book.return_date) : null}
				/>
			)}
		</div>
	);
}
