import Header from "../../components/header";
import { useState, useEffect } from "react";
import { BookInfo, UserData } from "../../components/structs";
import { getModerBooks, getUsers } from "../../components/api/DatabaseAPI";
import { Route, Routes } from "react-router";
import AddLoanForm from "../../components/forms/AddLoanForm";
import ModerBookTable from "./moderBookTable";
import RequestsList from "./requestsList";

export default function ModerDashboard() {
	const [books, setBooks] = useState<BookInfo[]>([]);
	const [users, setUsers] = useState<UserData[]>([]);

	const fetchBooks = async () => {
		try {
			const result = await getModerBooks()
			setBooks(result)
		} catch (err) {
			console.error(err)
		}
	};

	const fetchUsers = async () => {
		try {
			const users = await getUsers()
			setUsers(users)
		} catch (err) {
			console.error(err)
		}
	};

	useEffect(() => {
		fetchBooks().then(() => {
			console.log(books);
		})
		fetchUsers().then(() => {
			console.log(users)
		})
	}, []);

	return (
		<>
			<Header />
			<Routes>
				<Route path="/" element={
					<ModerBookTable bookList={books} updateBooks={fetchBooks} />
				} />
				<Route path="/createloan" element={
					<AddLoanForm books={books} users={users} />
				} />
				<Route path="/requests" element={
					<RequestsList bookList={books} updateBooks={fetchBooks} />
				} />
			</Routes>
		</>
	)
}
