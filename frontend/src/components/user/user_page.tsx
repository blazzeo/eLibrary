import { UserData, Loan, WishlistItem, ExtensionRequest, BookInfo } from "../structs";

interface Props {
	user: UserData;
	books: BookInfo[] | null;
}

const formatDate = (date: Date) => {
	return new Date(date).toLocaleDateString();
};

export default function UserPage({ user, books }: Props) {
	// Отфильтруем книги, где пользователь владелец
	const ownedBooks = books?.filter(b => b.book_info.owner?.user_id === user.user_id) ?? [];
	// Отфильтруем книги, где пользователь в wishlist
	const wishedBooks = books?.filter(b => b.book_info.wishlist.some(w => w.user_id === user.user_id)) ?? [];

	return (
		<div className="container mt-4">
			<h2>Пользователь: {user.user_name}</h2>
			<p><strong>ID:</strong> {user.user_id}</p>
			<p><strong>Роль:</strong> {user.user_role}</p>
			<p><strong>Дата регистрации:</strong> {formatDate(user.registration_date)}</p>

			<hr />

			<section>
				<h3>Займы</h3>
				{user.loans && user.loans.length > 0 ? (
					<ul>
						{user.loans.map((loan: Loan, idx) => (
							<li key={idx}>
								Книга ID: {loan.book_id}, с {formatDate(loan.borrow_date)} по {formatDate(loan.return_date)}
							</li>
						))}
					</ul>
				) : (
					<p>Нет займов</p>
				)}
			</section>

			<section>
				<h3>Отложенные книги (Wishlist)</h3>
				{user.wishlist && user.wishlist.length > 0 ? (
					<ul>
						{user.wishlist.map((item: WishlistItem, idx) => (
							<li key={idx}>
								Книга ID: {item.book_id}, дата запроса: {formatDate(item.request_date)}
							</li>
						))}
					</ul>
				) : (
					<p>Отложенных книг нет</p>
				)}
			</section>

			<section>
				<h3>Запросы на продление</h3>
				{user.extension_requests && user.extension_requests.length > 0 ? (
					<ul>
						{user.extension_requests.map((ext: ExtensionRequest, idx) => (
							<li key={idx}>
								Книга ID: {ext.book_id}, дата запроса: {formatDate(ext.request_date)}
							</li>
						))}
					</ul>
				) : (
					<p>Запросов на продление нет</p>
				)}
			</section>

			<hr />

			<section>
				<h3>Книги пользователя (Владелец)</h3>
				{ownedBooks.length > 0 ? (
					<ul>
						{ownedBooks.map((b, idx) => (
							<li key={idx}>
								{b.book_info.book.title} (ID: {b.book_info.book.book_id})
							</li>
						))}
					</ul>
				) : (
					<p>У пользователя нет книг</p>
				)}
			</section>

			<section>
				<h3>Желаемые книги (Wishlist)</h3>
				{wishedBooks.length > 0 ? (
					<ul>
						{wishedBooks.map((b, idx) => (
							<li key={idx}>
								{b.book_info.book.title} (ID: {b.book_info.book.book_id})
							</li>
						))}
					</ul>
				) : (
					<p>У пользователя нет желаемых книг</p>
				)}
			</section>
		</div>
	);
}
