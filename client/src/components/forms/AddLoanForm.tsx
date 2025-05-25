import { useState } from 'react';
import Form from 'react-bootstrap/Form';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import { addLoan } from '../api/DatabaseAPI.tsx';
import { useLibrary } from '../../libraryContext';
import { toast } from 'react-toastify';

export default function AddLoanForm() {
	const { users, refreshAll, moderBooks } = useLibrary()
	let usersOnly = users?.filter(u => u.user_role != 'admin' && u.user_role != 'moder')

	// State
	const [selectedUser, setSelectedUser] = useState('');
	const [selectedBook, setSelectedBook] = useState({ id: -1, name: '' });
	const [selectedDate, setSelectedDate] = useState<Date>(new Date());
	const [bookSearch, setBookSearch] = useState('');
	const [userSearch, setUserSearch] = useState('');

	// Filter books based on search input
	const filteredBooks = moderBooks!.filter(b =>
		b.book.title.toLowerCase().includes(bookSearch.toLowerCase())
	);

	const handle_form = async (event: React.FormEvent) => {
		event.preventDefault();
		try {
			if (!selectedUser || selectedBook.id === -1) {
				toast.error('Необходимо выбрать пользователя и книгу');
				return;
			}
			const response = await addLoan(selectedUser, selectedBook.id, selectedDate);
			if (response.error) {
				toast.error(response.error);
				return;
			}
			toast.success('Бронь успешно добавлена');
		} catch (err: any) {
			console.error('Ошибка при создании брони:', err);
			if (err.response?.data?.error) {
				toast.error(err.response.data.error);
			} else if (err.message) {
				toast.error(err.message);
			} else {
				toast.error('Произошла неизвестная ошибка при создании брони');
			}
		} finally {
			setSelectedUser('');
			setSelectedBook({ id: -1, name: '' });
			setSelectedDate(new Date());
			setBookSearch('');
			setUserSearch('');
			refreshAll();
		}
	};

	return (
		<div className="container mt-4">
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
							{usersOnly!
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
							{usersOnly!.filter((user) =>
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
								const title = book.book.title;
								const id = book.book.book_id;
								const authors = Array.isArray(book.book.authors)
									? book.book.authors.join(" ")
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
