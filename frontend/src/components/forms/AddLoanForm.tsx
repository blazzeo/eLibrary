import { useState } from 'react';
import Form from 'react-bootstrap/Form';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import { BookInfo, UserData } from '../structs';

interface Props {
	books: BookInfo[]
	users: UserData[]
};

export default function AddLoanForm({ books, users }: Props) {
	// State
	const [selectedUser, setSelectedUser] = useState('');
	const [selectedBook, setSelectedBook] = useState('');
	const [selectedDate, setSelectedDate] = useState<Date | null>(new Date());
	const [bookSearch, setBookSearch] = useState('');

	// Filter books based on search input
	const filteredBooks = books.filter(book =>
		book.book_info.book.title.toLowerCase().includes(bookSearch.toLowerCase())
		// book.authors.toLowerCase().includes(bookSearch.toLowerCase())
	);

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
						value={selectedUser}
						onChange={(e) => setSelectedUser(e.target.value)}
						autoComplete="off"
					/>
					{selectedUser && (
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
								.filter((user) => {
									console.log(user)
									user.user_name.toLowerCase().includes(selectedUser.toLowerCase())
								})
								.map((user, index) => (
									<button
										key={index}
										type="button"
										className="dropdown-item"
										onClick={() => setSelectedUser(user.user_name)}
									>
										{user.user_name}
									</button>
								))}
							{users.filter((user) =>
								user.user_name.toLowerCase().includes(selectedUser.toLowerCase())
							).length === 0 && (
									<div className="dropdown-item">No users found</div>
								)}
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
								const authors = Array.isArray(book.book_info.book.authors)
									? book.book_info.book.authors.join(" ")
									: "Unknown Author";

								return (
									<button
										key={index}
										type="button"
										className="dropdown-item"
										onClick={() => {
											setSelectedBook(`${title} by ${authors}`);
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
							<strong>Выбрано:</strong> {selectedBook}
						</div>
					)}
				</Form.Group>

				{/* Date Picker */}
				<Form.Group className="mb-3">
					<Form.Label>Дата возврата</Form.Label>
					<div>
						<DatePicker
							selected={selectedDate}
							onChange={(date) => setSelectedDate(date)}
							className="form-control"
							dateFormat="MMMM d, yyyy"
						/>
					</div>
				</Form.Group>

				<button type="submit" className="btn btn-primary">
					Добавить
				</button>
			</Form>
		</div>
	);
};
