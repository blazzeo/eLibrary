import { useState } from 'react';
import Form from 'react-bootstrap/Form';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import { BookInfo, UserData } from '../structs';
import { addLoan } from '../api/DatabaseAPI';
import { Toast, ToastContainer } from 'react-bootstrap';

interface Props {
	books: BookInfo[]
	users: UserData[]
};

export default function AddLoanForm({ books, users }: Props) {
	// State
	const [selectedUser, setSelectedUser] = useState('');
	const [selectedBook, setSelectedBook] = useState({ id: -1, name: '' });
	const [selectedDate, setSelectedDate] = useState<Date>(new Date());
	const [bookSearch, setBookSearch] = useState('');
	const [userSearch, setUserSearch] = useState('');
	const [showErrorToast, setShowErrorToast] = useState(false);
	const [errorMessage, setErrorMessage] = useState('');

	const [showSuccessToast, setShowSuccessToast] = useState(false);
	const [successMessage, setSuccessMessage] = useState('');

	// Filter books based on search input
	const filteredBooks = books.filter(book =>
		book.book_info.book.title.toLowerCase().includes(bookSearch.toLowerCase())
	);

	const handle_form = async (event: React.FormEvent) => {
		event.preventDefault();
		try {
			const res = await addLoan(selectedUser, selectedBook.id, selectedDate);
			console.log(res);

			// success toast
			setSuccessMessage('Бронь успешно добавлена');
			setShowSuccessToast(true);
			setTimeout(() => setShowSuccessToast(false), 5000);
		} catch (err: any) {
			setErrorMessage(err.response?.data?.error || 'Неизвестная ошибка');
			setShowErrorToast(true);
			setTimeout(() => setShowErrorToast(false), 5000);
		}
	};

	return (
		<div className="container mt-4">
			<ToastContainer position="top-end" className="p-3" style={{ zIndex: 9999 }}>
				<Toast
					onClose={() => setShowErrorToast(false)}
					show={showErrorToast}
					bg="danger"
					delay={5000}
					autohide
				>
					<Toast.Header>
						<strong className="me-auto">Ошибка</strong>
					</Toast.Header>
					<Toast.Body className="text-white">{errorMessage}</Toast.Body>
				</Toast>

				<Toast
					onClose={() => setShowSuccessToast(false)}
					show={showSuccessToast}
					bg="success"
					delay={5000}
					autohide
				>
					<Toast.Header>
						<strong className="me-auto">Успешно</strong>
					</Toast.Header>
					<Toast.Body className="text-white">{successMessage}</Toast.Body>
				</Toast>
			</ToastContainer>
			<h2>Добавить новую бронь</h2>
			<Form>
				{/* User List */}
				<Form.Group className="mb-3" style={{ position: 'relative' }}>
					<Form.Label>Выберите пользователя</Form.Label>
					<Form.Control
						type="text"
						placeholder="Search for a user..."
						value={userSearch}
						onChange={(e) => setUserSearch(e.target.value)}
						autoComplete="off"
					/>
					{userSearch && (
						<div
							style={{
								position: 'absolute',
								zIndex: 1000,
								width: '100%',
								maxHeight: '200px',
								overflowY: 'auto',
								backgroundColor: 'white',
								border: '1px solid #ccc',
								borderTop: 'none',
							}}
							className="dropdown-menu show"
						>
							{users
								.filter((user) =>
									user.user_name.toLowerCase().includes(userSearch.toLowerCase())
								)
								.map((user, index) => {
									return (
										<button
											key={index}
											type="button"
											className="dropdown-item"
											onClick={() => {
												setUserSearch('')
												setSelectedUser(user.user_name)
											}}
										>
											{user.user_name}
										</button>
									)
								})}
							{users.filter((user) =>
								user.user_name.toLowerCase().includes(selectedUser.toLowerCase())
							).length === 0 && (
									<div className="dropdown-item">No users found</div>
								)}
						</div>
					)}
					{selectedUser && (
						<div className="mt-2">
							<strong>Выбрано:</strong> {selectedUser}
						</div>
					)}
				</Form.Group>

				{/* Book Search */}
				<Form.Group className="mb-3" style={{ position: 'relative' }}>
					<Form.Label>Выберите книгу</Form.Label>
					<Form.Control
						type="text"
						placeholder="Search for a book..."
						value={bookSearch}
						onChange={(e) => setBookSearch(e.target.value)}
						autoComplete="off"
					/>
					{bookSearch && filteredBooks.length > 0 && (
						<div
							style={{
								position: 'absolute',
								zIndex: 1000,
								width: '100%',
								maxHeight: '200px',
								overflowY: 'auto',
								backgroundColor: 'white',
								border: '1px solid #ccc',
								borderTop: 'none',
							}}
							className="dropdown-menu show"
						>
							{filteredBooks.map((book, index) => {
								const title = book.book_info.book.title;
								const id = book.book_info.book.book_id;
								const authors = Array.isArray(book.book_info.book.authors)
									? book.book_info.book.authors.join(" ")
									: "Unknown Author";

								return (
									<button
										key={index}
										type="button"
										className="dropdown-item"
										onClick={() => {
											setSelectedBook({ id: id, name: title });
											setBookSearch('');
										}}
									>
										<strong>{title}</strong> by {authors}
									</button>
								);
							})}
						</div>
					)}
					{filteredBooks.length === 0 && bookSearch && (
						<div className="dropdown-menu show">
							<div className="dropdown-item">No books found</div>
						</div>
					)}
					{selectedBook && (
						<div className="mt-2">
							<strong>Выбрано:</strong> {selectedBook.name}
						</div>
					)}
				</Form.Group>

				{/* Date Picker */}
				<Form.Group className="mb-3">
					<Form.Label>Дата возврата</Form.Label>
					<div>
						<DatePicker
							selected={selectedDate}
							onChange={(date) => setSelectedDate(date!)}
							className="form-control"
							dateFormat="MMMM d, yyyy"
						/>
					</div>
				</Form.Group>

				<button type="submit" className="btn btn-primary" onClick={handle_form}>
					Добавить
				</button>
			</Form>
		</div>
	);
};
