import { UserData } from "./structs";

interface Props {
	user: UserData | null;
}

export default function UserProfile({ user }: Props) {
	if (user === null)
		return (
			<h1>
				Ooops, error occured
			</h1>
		)


	return (
		<div className="container my-5">
			<h1 className="mb-4">Профиль пользователя</h1>

			{/* Основная информация */}
			<div className="card mb-4">
				<div className="card-body">
					<h4 className="card-title">Основная информация</h4>
					<p><strong>ID:</strong> {user.user_id}</p>
					<p><strong>Имя:</strong> {user.user_name}</p>
					<p><strong>Роль:</strong> {user.user_role}</p>
					<p><strong>Дата регистрации:</strong> {new Date(user.registration_date).toLocaleDateString()}</p>
				</div>
			</div>

			{/* Займы */}
			<div className="card mb-4">
				<div className="card-body">
					<h4 className="card-title">Текущие займы</h4>
					{user.loans && user.loans.length > 0 ? (
						<table className="table table-striped">
							<thead>
								<tr>
									<th>Книга ID</th>
									<th>Дата займа</th>
									<th>Дата возврата</th>
								</tr>
							</thead>
							<tbody>
								{user.loans.map((loan, index) => (
									<tr key={index}>
										<td>{loan.book_id}</td>
										<td>{new Date(loan.borrow_date).toLocaleDateString()}</td>
										<td>{new Date(loan.return_date).toLocaleDateString()}</td>
									</tr>
								))}
							</tbody>
						</table>
					) : (
						<p>Нет активных займов.</p>
					)}
				</div>
			</div>

			{/* Wishlist */}
			<div className="card mb-4">
				<div className="card-body">
					<h4 className="card-title">Список желаемых книг</h4>
					{user.wishlist && user.wishlist.length > 0 ? (
						<ul className="list-group">
							{user.wishlist.map((item, index) => (
								<li key={index} className="list-group-item d-flex justify-content-between">
									<span>Книга ID: {item.book_id}</span>
									<span>Дата запроса: {new Date(item.request_date).toLocaleDateString()}</span>
								</li>
							))}
						</ul>
					) : (
						<p>Список желаемого пуст.</p>
					)}
				</div>
			</div>

			{/* Запросы на продление */}
			<div className="card mb-4">
				<div className="card-body">
					<h4 className="card-title">Запросы на продление</h4>
					{user.extension_requests && user.extension_requests.length > 0 ? (
						<ul className="list-group">
							{user.extension_requests.map((req, index) => (
								<li key={index} className="list-group-item d-flex justify-content-between">
									<span>Книга ID: {req.book_id}</span>
									<span>Дата запроса: {new Date(req.request_date).toLocaleDateString()}</span>
								</li>
							))}
						</ul>
					) : (
						<p>Нет запросов на продление.</p>
					)}
				</div>
			</div>
		</div>
	);
}
