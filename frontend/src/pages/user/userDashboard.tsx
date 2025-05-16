import Header from "../../components/header";
import { useState, useEffect } from "react";
import { BookData } from "../../components/structs";
import { getBooks } from "../../components/api/DatabaseAPI";
import { Route, Routes } from "react-router";
import { BookShelf } from "./userBookShelf";
import UserBookTable from "./userBookTable";

export default function UserDashboard() {
	const [books, setBooks] = useState<BookData[]>([]);

	const fetchBooks = async () => {
		try {
			const userName = sessionStorage.getItem("userName")
			const bookData = await getBooks(userName)
			setBooks(bookData)
		} catch (err) {
			console.error(err)
		}
	};

	useEffect(() => {
		fetchBooks()
		console.log(books);
	}, []);

	return (
		<>
			<Header />
			<Routes>
				<Route path="/" element={
					<UserBookTable books={books} updateBooks={fetchBooks} />
				} />
				<Route path="/mybooks" element={
					<BookShelf books={books.filter(x => x.loan_status === 1 || x.loan_status === 0)} updateBooks={fetchBooks} />
				} />
			</Routes>
		</>
	)
}
