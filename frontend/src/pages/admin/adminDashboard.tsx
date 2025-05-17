import { useState, useEffect } from "react";
import { Route, Routes } from "react-router";
import Header from "../../components/header";

import { getModerBooks, getUsers } from "../../components/api/DatabaseAPI";
import { BookInfo, UserData } from "../../components/structs";

import { AdminBookTable } from "./adminBookTable";
import { UserTable } from "./userTable";
import { AddBookForm } from "../../components/forms/AddBookForm";
import { EditBookForm } from "../../components/forms/EditBookForm";
import BookPageWrapper from "../../components/book/book_page_wrapper";
import UserPageWrapper from "../../components/user/user_page_wrapper";

export default function AdminDashboard() {
	const [books, setBooks] = useState<BookInfo[]>([]);
	const [users, setUsers] = useState<UserData[]>([]);
	const [editBook, setEditBook] = useState<BookInfo | null>(null);

	useEffect(() => {
		(async () => {
			try {
				const [fetchedBooks, fetchedUsers] = await Promise.all([
					getModerBooks(),
					getUsers(),
				]);
				setBooks(fetchedBooks);
				setUsers(fetchedUsers);
				console.log(users)
			} catch (error) {
				console.error("Ошибка при загрузке данных:", error);
			}
		})();
	}, []);

	const updateBooks = async () => {
		try {
			const data = await getModerBooks();
			setBooks(data);
		} catch (error) {
			console.error("Ошибка при обновлении книг:", error);
		}
	};

	const updateUsers = async () => {
		try {
			const data = await getUsers();
			setUsers(data);
		} catch (error) {
			console.error("Ошибка при обновлении пользователей:", error);
		}
	};

	return (
		<>
			<Header />
			<Routes>
				<Route
					path="/"
					element={
						<>
							<AdminBookTable
								books={books}
								updateBooks={updateBooks}
								editBook={setEditBook}
							/>
							{editBook && (
								<div className="mt-4">
									<h3>Редактирование книги</h3>
									<EditBookForm book={editBook} updateBooks={updateBooks} />
								</div>
							)}
						</>
					}
				/>
				<Route
					path="/usercontrol"
					element={<UserTable users={users} updateUsers={updateUsers} />}
				/>
				<Route
					path="/addbook"
					element={<AddBookForm updateBooks={updateBooks} />}
				/>
				<Route path="/book" element={<BookPageWrapper books={books} />} />
				<Route path="/user" element={<UserPageWrapper users={users} books={books} />} />
			</Routes>
		</>
	);
}
