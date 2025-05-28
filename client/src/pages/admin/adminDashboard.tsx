import { Route, Routes } from "react-router";
import Header from "../../components/header";
import { AdminBookTable } from "./adminBookTable";
import { UserTable } from "./userTable";
import { AddBookForm } from "../../components/forms/AddBookForm";
import BookPageWrapper from "../../components/book/book_page_wrapper";
import UserPageWrapper from "../../components/user/user_page_wrapper";
import { useEffect } from "react";
import { useLibrary } from "../../context/libraryContext";
import AddUserForm from "../../components/forms/AddUserForm";
import RequestsList from "../moder/requestsList";

export default function AdminDashboard() {
	const { refreshAll, moderBooks, users } = useLibrary();

	useEffect(() => {
		if (!moderBooks || !users) {
			refreshAll();
		}
	}, []);

	if (!moderBooks && !users) {
		return (
			<div
				className="d-flex justify-content-center align-items-center bg-light"
				style={{ height: "100vh", width: "100vw" }}
			>
				<div className="text-center">
					<div
						className="spinner-border text-primary"
						style={{ width: "4rem", height: "4rem" }}
						role="status"
					/>
					<p className="mt-3 text-muted fs-5">Загрузка...</p>
				</div>
			</div>
		);
	}


	return (
		<>
			<Header />
			<div className="container my-4">
				<Routes>
					<Route index element={<AdminBookTable />} />
					<Route path="usercontrol" element={<UserTable />} />
					<Route path="requests" element={<RequestsList />} />
					<Route path="addbook" element={<AddBookForm />} />
					<Route path="book/:id" element={<BookPageWrapper />} />
					<Route path="user/:id" element={<UserPageWrapper />} />
					<Route path="createmoder" element={<AddUserForm />} />
				</Routes>
			</div>
		</>
	);
}
