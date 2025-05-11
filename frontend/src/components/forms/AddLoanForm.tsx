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
		book.book.title.toLowerCase().includes(bookSearch.toLowerCase())
		// book.authors.toLowerCase().includes(bookSearch.toLowerCase())
	);

	return (
		<div className="container mt-4">
			<h2>Добавить новую бронь</h2>
			<Form>
				{/* User List */}
				<Form.Group className="mb-3">
					<Form.Label>Выберите пользователя: </Form.Label>
					<Form.Control
						list="users-list"
						placeholder="Type or select a user"
						value={selectedUser}
						onChange={(e) => setSelectedUser(e.target.value)}
					/>
					<datalist id="users-list">
						{users.map((user, index) => (
							<option key={index} value={user.username} />
						))}
					</datalist>
				</Form.Group>

				{/* Book Search */}
				<Form.Group className="mb-3">
					<Form.Label>Выберите книгу</Form.Label>
					<Form.Control
						type="text"
						placeholder="Search for a book..."
						value={bookSearch}
						onChange={(e) => setBookSearch(e.target.value)}
					/>
					{bookSearch && (
						<div className="mt-2">
							<div className="list-group">
								{filteredBooks.map((book, index) => (
									<button
										key={index}
										type="button"
										className="list-group-item list-group-item-action"
										onClick={() => {
											setSelectedBook(`${book.title} by ${book.authors.join(" ")}`);
											setBookSearch('');
										}}
									>
										<strong>{book.title}</strong> by {book.authors.join(" ")}
									</button>
								))}
								{filteredBooks.length === 0 && (
									<div className="list-group-item">No books found</div>
								)}
							</div>
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
