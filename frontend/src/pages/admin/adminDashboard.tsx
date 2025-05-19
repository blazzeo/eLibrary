import { Route, Routes } from "react-router";
import Header from "../../components/header";
import { AdminBookTable } from "./adminBookTable";
import { UserTable } from "./userTable";
import { AddBookForm } from "../../components/forms/AddBookForm";
import BookPageWrapper from "../../components/book/book_page_wrapper";
import UserPageWrapper from "../../components/user/user_page_wrapper";
import { useEffect } from "react";
import { useLibrary } from "../../libraryContext";
import AddModerForm from "../../components/forms/AddModerForm";

export default function AdminDashboard() {
	const { refreshUsers, refreshModerBooks } = useLibrary();

	useEffect(() => {
		refreshModerBooks();
		refreshUsers();
	}, []);

	return (
		<>
			<Header />

			{/* Ограничиваем ширину и центрируем */}
			<div className="container my-4">
				<Routes>
					<Route path="/" element={<AdminBookTable />} />
					<Route path="/usercontrol" element={<UserTable />} />
					<Route path="/addbook" element={<AddBookForm />} />
					<Route path="/book" element={<BookPageWrapper />} />
					<Route path="/user" element={<UserPageWrapper />} />
					<Route path="/createmoder" element={<AddModerForm />} />
				</Routes>
			</div>
		</>
	);
}
