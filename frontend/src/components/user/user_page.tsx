import { UserData, BookInfo } from "../structs";
import { LoanListItem } from "./loanListItem";
import { WishlistItem } from "./wishListItem";
import { ExtensionRequestItem } from "./extensionRequestItem";
import { deleteUser } from "../api/DatabaseAPI";

interface Props {
	user: UserData;
	books: BookInfo[] | null;
	updateUsers: () => void;
}

const formatDate = (date: Date | string) =>
	new Date(date).toLocaleDateString("ru-RU");

export default function UserPage({ user, books }: Props) {
	if (!user) return <div className="alert alert-danger mt-3">Пользователь не найден</div>;

	const wishlist = user.wishlist || [];
	const extensions = user.extension_requests || [];

	const currentLoans = books?.filter(b =>
		user.loans?.some(l => l.book_id === b.book.book_id)
	) || [];

	const wishedBooks = books?.filter(b =>
		b.wishlist?.some(w => w.user_id === user.user_id)
	) || [];

	// Обработчики (заглушки)
	const handleCancelLoan = (bookId: number) => {
		console.log("Аннулировать", bookId);
	};

	const handleDelete = async () => {
		const user_name = user.user_name
		await deleteUser(user_name)
		// TODO update users and redirect to '/'
	}

	const handleExtendLoan = (bookId: number) => {
		console.log("Продлить", bookId);
	};

	const handleRemoveWishlist = (bookId: number) => {
		console.log("Убрать из желаемого", bookId);
	};

	const handleIssueBook = (bookId: number) => {
		console.log("Выдать книгу", bookId);
	};

	const handleApproveExtension = (bookId: number) => {
		console.log("Одобрить продление", bookId);
	};

	const handleRejectExtension = (bookId: number) => {
		console.log("Отклонить продление", bookId);
	};

	return (
		<div className="container py-3">
			{/* Шапка профиля */}
			<div className="card mb-4 border-2 border-primary shadow-sm">
				<div className="card-body">
					<div className="d-flex align-items-center justify-content-between gap-3 flex-wrap">
						<div>
							<h1 className="h3 mb-1">{user.user_name}</h1>
							<div className="d-flex gap-3 text-muted small">
								<span>ID: {user.user_id}</span>
								<span>Роль: {user.user_role}</span>
								<span>Регистрация: {formatDate(user.registration_date)}</span>
							</div>
						</div>
						<button className="btn btn-danger" onClick={handleDelete}>Удалить пользователя</button>
					</div>
				</div>
			</div>

			{/* Основные блоки */}
			<div className="row g-4">

				{/* Текущие займы */}
				<div className="col-lg-4">
					<div className="card h-100 border-success border-2 shadow-sm">
						<div className="card-header bg-success bg-opacity-10 text-success border-bottom border-success border-1">
							<strong>На руках</strong>
						</div>
						<div className="card-body p-0">
							{currentLoans.length === 0 ? (
								<div className="text-center py-4 text-muted">Нет книг на руках</div>
							) : (
								<ul className="list-group list-group-flush">
									{currentLoans.map(book => {
										const loan = user.loans?.find(l => l.book_id === book.book.book_id);
										return (
											<LoanListItem
												key={book.book.book_id}
												book={book}
												loanDate={formatDate(loan?.return_date || "")}
												onCancel={() => handleCancelLoan(book.book.book_id)}
												onExtend={() => handleExtendLoan(book.book.book_id)}
											/>
										);
									})}
								</ul>
							)}
						</div>
					</div>
				</div>

				{/* Желаемые книги */}
				<div className="col-lg-4">
					<div className="card h-100 border-warning border-2 shadow-sm">
						<div className="card-header bg-warning bg-opacity-10 text-warning border-bottom border-warning border-1">
							<strong>Желаемые</strong>
						</div>
						<div className="card-body p-0">
							{wishlist.length === 0 && wishedBooks.length === 0 ? (
								<div className="text-center py-4 text-muted">Нет желаемых книг</div>
							) : (
								<ul className="list-group list-group-flush">
									{wishlist.map(item => {
										const book = books?.find(b => b.book.book_id === item.book_id);
										if (!book) return null;
										return (
											<WishlistItem
												key={`wish-${item.book_id}`}
												book={book}
												requestDate={formatDate(item.request_date)}
												canIssue={!book.wishlist?.length}
												onRemove={() => handleRemoveWishlist(book.book.book_id)}
												onIssue={() => handleIssueBook(book.book.book_id)}
											/>
										);
									})}
								</ul>
							)}
						</div>
					</div>
				</div>

				{/* Запросы продления */}
				<div className="col-lg-4">
					<div className="card h-100 border-info border-2 shadow-sm">
						<div className="card-header bg-info bg-opacity-10 text-info border-bottom border-info border-1">
							<strong>Продления</strong>
						</div>
						<div className="card-body p-0">
							{extensions.length === 0 ? (
								<div className="text-center py-4 text-muted">Нет запросов</div>
							) : (
								<ul className="list-group list-group-flush">
									{extensions.map(ext => {
										const book = books?.find(b => b.book.book_id === ext.book_id);
										if (!book) return null;
										return (
											<ExtensionRequestItem
												key={`ext-${ext.book_id}`}
												book={book}
												requestDate={formatDate(ext.request_date)}
												onApprove={() => handleApproveExtension(ext.book_id)}
												onReject={() => handleRejectExtension(ext.book_id)}
											/>
										);
									})}
								</ul>
							)}
						</div>
					</div>
				</div>

			</div>
		</div>
	);
}
