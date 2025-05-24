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
	const { refreshAll, moderBooks, users } = useLibrary();

	useEffect(() => {
		if (!moderBooks || !users) {
			console.log('AdminDashboard: refreshing data because moderBooks or users is null');
			refreshAll();
		}
	}, []);

	if (!moderBooks || !users) return <h1>Загрузка...</h1>;

	return (
		<>
			<Header />
			<div className="container my-4">
				<Routes>
					<Route index element={<AdminBookTable />} />
					<Route path="usercontrol" element={<UserTable />} />
					<Route path="addbook" element={<AddBookForm />} />
					<Route path="book/:id" element={<BookPageWrapper />} />
					<Route path="user/:id" element={<UserPageWrapper />} />
					<Route path="createmoder" element={<AddModerForm />} />
				</Routes>
			</div>
		</>
	);
}
