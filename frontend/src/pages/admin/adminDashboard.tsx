import { useState, useEffect } from "react";
import { BookInfo, UserData } from "../../components/structs";
import { getModerBooks, getUsers } from "../../components/api/DatabaseAPI";
import { Route, Routes } from "react-router";
import { AddBookForm } from "../../components/forms/AddBookForm";
import { EditBookForm } from "../../components/forms/EditBookForm";
import Header from "../../components/header";
import { AdminBookTable } from "./adminBookTable";
import { UserTable } from "./userTable";
import BookPageWrapper from "../../components/book_page_wrapper";

export default function AdminDashboard() {
	const [books, setBooks] = useState<BookInfo[]>([]);
	const [users, setUsers] = useState<UserData[]>([]);
	const [editBook, setEditBook] = useState<BookInfo | null>(null); // To track if we need to show the overlay

	const fetchUsers = async () => {
		try {
			const fetchedUsers = await getUsers();
			setUsers(fetchedUsers);
		} catch (err) {
			console.error(err);
		}
	};

	const fetchBooks = async () => {
		try {
			const bookData = await getModerBooks();
			console.log(bookData)
			setBooks(bookData);
		} catch (err) {
			console.error(err);
		}
	};

	const editBookCallback = (book: BookInfo) => {
		setEditBook(book); // Set the book to be edited
	};

	const closeEditBookModal = () => {
		setEditBook(null); // Close the modal by setting editBook to null
	};

	useEffect(() => {
		fetchUsers();
		fetchBooks();
	}, []);

	return (
		<>
			<Header />
			<Routes>
				<Route
					path="/"
					element={
						<AdminBookTable
							books={books}
							updateBooks={fetchBooks}
							editBook={editBookCallback}
						/>
					}
				/>
				<Route
					path="/usercontrol"
					element={<UserTable users={users} updateUsers={fetchUsers} />}
				/>
				<Route
					path="/addbook"
					element={<AddBookForm updateBooks={fetchBooks} />}
				/>
				<Route path="/book" element={<BookPageWrapper books={books} />} />
			</Routes>

			{/* Modal Overlay for EditBookForm */}
			{editBook && (
				<div className="modal-overlay">
					<div className="modal-content">
						<button className="close-btn" onClick={closeEditBookModal}>
							&times;
						</button>
						<EditBookForm book={editBook} updateBooks={fetchBooks} />
					</div>
				</div>
			)}

			<style>{`
        .modal-overlay {
          position: fixed;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background-color: rgba(0, 0, 0, 0.5);
          display: flex;
          justify-content: center;
          align-items: center;
          z-index: 1000;
        }

        .modal-content {
          background-color: white;
          padding: 20px;
          border-radius: 8px;
          position: relative;
          max-width: 600px;
          width: 100%;
        }

        .close-btn {
          position: absolute;
          top: 10px;
          right: 10px;
          font-size: 24px;
          border: none;
          background: transparent;
          cursor: pointer;
        }
      `}</style>
		</>
	);
}
