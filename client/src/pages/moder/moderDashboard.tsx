import Header from "../../components/header";
import { Route, Routes } from "react-router";
import AddLoanForm from "../../components/forms/AddLoanForm";
import ModerBookTable from "./moderBookTable";
import RequestsList from "./requestsList";
import BookPageWrapper from "../../components/book/book_page_wrapper";
import UserPageWrapper from "../../components/user/user_page_wrapper";
import { UserTable } from "../admin/userTable";
import { useEffect } from "react";
import { useLibrary } from "../../context/libraryContext";
import ProfilePage from "../profilePage";

export default function ModerDashboard() {
	const { refreshAll, moderBooks, users } = useLibrary()

	useEffect(() => {
		if (!moderBooks || !users) {
			console.log('ModerDashboard: refreshing data because moderBooks or users is null');
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
					<Route index element={<ModerBookTable />} />
					<Route path="usercontrol" element={<UserTable />} />
					<Route path="createloan" element={<AddLoanForm />} />
					<Route path="requests" element={<RequestsList />} />
					<Route path="book/:id" element={<BookPageWrapper />} />
					<Route path="user/:id" element={<UserPageWrapper />} />
					<Route path="profile" element={<ProfilePage />} />
				</Routes>
			</div>
		</>
	)
}
