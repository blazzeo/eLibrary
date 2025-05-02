import React, { useState } from 'react';
import Form from 'react-bootstrap/Form';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import { BookData, UserData } from '../structs';

interface Props {
	books: BookData[]
	users: UserData[]
};

export function AddLoanForm({ books, users }: Props) {
	// State
	const [selectedUser, setSelectedUser] = useState('');
	const [selectedBook, setSelectedBook] = useState('');
	const [selectedDate, setSelectedDate] = useState<Date | null>(new Date());
	const [bookSearch, setBookSearch] = useState('');

	// Filter books based on search input
	const filteredBooks = books.filter(book =>
		book.title.toLowerCase().includes(bookSearch.toLowerCase()) ||
		book.authors.toLowerCase().includes(bookSearch.toLowerCase())
	);

	return (
		<div className="container mt-4">
			<h2>Library Form</h2>
			<Form>
				{/* User List */}
				<Form.Group className="mb-3">
					<Form.Label>Select User</Form.Label>
					<Form.Control
						list="users-list"
						placeholder="Type or select a user"
						value={selectedUser}
						onChange={(e) => setSelectedUser(e.target.value)}
					/>
					<datalist id="users-list">
						{users.map(user => (
							<option key={user.id} value={user.username} />
						))}
					</datalist>
				</Form.Group>

				{/* Book Search */}
				<Form.Group className="mb-3">
					<Form.Label>Search and Select Book</Form.Label>
					<Form.Control
						type="text"
						placeholder="Search for a book..."
						value={bookSearch}
						onChange={(e) => setBookSearch(e.target.value)}
					/>
					{bookSearch && (
						<div className="mt-2">
							<div className="list-group">
								{filteredBooks.map(book => (
									<button
										key={book.id}
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
							<strong>Selected:</strong> {selectedBook}
						</div>
					)}
				</Form.Group>

				{/* Date Picker */}
				<Form.Group className="mb-3">
					<Form.Label>Select Date</Form.Label>
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
					Submit
				</button>
			</Form>
		</div>
	);
};

export default UserBookForm;
