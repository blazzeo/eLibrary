import { UserData, BookInfo } from "../structs.tsx";
import { LoanListItem } from "./loanListItem";
import { ReservedBookItem } from "./reservedBookItem";
import { ExtensionRequestItem } from "./extensionRequestItem";
import { deleteUser } from "../../api/DatabaseAPI.tsx";
import { Button, Card, Badge, Alert, Row, Col, ListGroup } from "react-bootstrap";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import { useLibrary } from "../../context/libraryContext";

interface Props {
	user: UserData;
	books: BookInfo[] | null;
}

export default function UserPage({ user, books }: Props) {
	const { refreshAll, user: currentUser } = useLibrary()
	const navigate = useNavigate();

	if (!user) return <Alert variant="danger" className="mt-3">Пользователь не найден</Alert>;

	const handleDelete = async () => {
		try {
			await deleteUser(user.user_id);
			toast.success(`Пользователь ${user.user_name} удален`);
			navigate('/usercontrol');
		} catch (error) {
			toast.error('Ошибка при удалении пользователя');
		} finally {
			refreshAll();
		}
	};

	const formatDate = (date: string | Date) => {
		return new Date(date).toLocaleDateString();
	};

	return (
		<div className="container py-4">
			{/* Шапка профиля */}
			<Card className="mb-4 shadow-sm border-primary">
				<Card.Body>
					<Row className="align-items-center">
						<Col md={12}>
							<div className="d-flex justify-content-between align-items-start">
								<div>
									<h2 className="mb-2 fs-2">{user.user_name}</h2>
									<div className="d-flex flex-wrap gap-3 mb-4">
										<Badge bg="secondary" className="fs-6 px-3 py-2">ID: {user.user_id}</Badge>
										<Badge bg={user?.user_role === 'admin' ? 'danger' : 'primary'} className="fs-6 px-3 py-2">
											{user.user_role === 'admin' || user.user_role === 'moder' ? 'Администратор' : 'Пользователь'}
										</Badge>
										<Badge bg="info" className="fs-6 px-3 py-2">
											<i className="bi bi-calendar me-2"></i>
											Регистрация: {formatDate(user.registration_date)}
										</Badge>
									</div>
								</div>
								{currentUser?.user_role === 'admin' && <Button
									variant="outline-danger"
									onClick={handleDelete}
									className="d-flex align-items-center gap-1"
								>
									<i className="bi bi-trash"></i> Удалить
								</Button>}
							</div>
						</Col>
					</Row>
				</Card.Body>
			</Card>

			{/* Основные блоки */}
			<Row className="g-4">
				{/* Текущие займы */}
				<Col lg={4}>
					<Card className="h-100 border-success shadow-sm">
						<Card.Header className="bg-success bg-opacity-10 text-success border-success">
							<div className="d-flex justify-content-between align-items-center">
								<span><i className="bi bi-book me-2"></i>На руках</span>
								<Badge bg="success" pill>{user.loans?.length || 0}</Badge>
							</div>
						</Card.Header>
						<Card.Body className="p-0">
							{!user.loans || user.loans.length === 0 ? (
								<Alert variant="light" className="text-center m-3">
									Нет книг на руках
								</Alert>
							) : (
								<ListGroup variant="flush">
									{books?.filter(b =>
										user.loans?.some(l => l.book_id === b.book.book_id)
									).map(book => (
										<LoanListItem
											key={book.book.book_id}
											book={book}
										/>
									))}
								</ListGroup>
							)}
						</Card.Body>
					</Card>
				</Col>

				{/* Отложенные книги */}
				<Col lg={4}>
					<Card className="h-100 border-warning shadow-sm">
						<Card.Header className="bg-warning bg-opacity-10 text-warning border-warning">
							<div className="d-flex justify-content-between align-items-center">
								<span><i className="bi bi-bookmark me-2"></i>Отложенные</span>
								<Badge bg="warning" pill>{user.wishlist?.length || 0}</Badge>
							</div>
						</Card.Header>
						<Card.Body className="p-0">
							{!user.wishlist || user.wishlist.length === 0 ? (
								<Alert variant="light" className="text-center m-3">
									Нет отложенных книг
								</Alert>
							) : (
								<ListGroup variant="flush">
									{user.wishlist.map(item => {
										const book = books?.find(b => b.book.book_id === item.book_id);
										if (!book) return null;
										return (
											<ReservedBookItem
												key={`reserve-${item.book_id}`}
												user={user}
												book={book}
												requestDate={formatDate(item.request_date)}
												isTaken={book.owner !== null}
											/>
										);
									})}
								</ListGroup>
							)}
						</Card.Body>
					</Card>
				</Col>

				{/* Запросы продления */}
				<Col lg={4}>
					<Card className="h-100 border-info shadow-sm">
						<Card.Header className="bg-info bg-opacity-10 text-info border-info">
							<div className="d-flex justify-content-between align-items-center">
								<span><i className="bi bi-clock me-2"></i>Продления</span>
								<Badge bg="info" pill>{user.extension_requests?.length || 0}</Badge>
							</div>
						</Card.Header>
						<Card.Body className="p-0">
							{!user.extension_requests || user.extension_requests.length === 0 ? (
								<Alert variant="light" className="text-center m-3">
									Нет запросов на продление
								</Alert>
							) : (
								<ListGroup variant="flush">
									{user.extension_requests.map(ext => {
										const book = books?.find(b => b.book.book_id === ext.book_id);
										if (!book) return null;
										return (
											<ExtensionRequestItem
												key={`ext-${ext.book_id}`}
												book={book}
												requestDate={formatDate(ext.request_date)}
											/>
										);
									})}
								</ListGroup>
							)}
						</Card.Body>
					</Card>
				</Col>
			</Row>
		</div>
	);
}
