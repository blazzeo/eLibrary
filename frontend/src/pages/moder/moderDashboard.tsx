import Header from "../../components/header";
import { Route, Routes } from "react-router";
import AddLoanForm from "../../components/forms/AddLoanForm";
import ModerBookTable from "./moderBookTable";
import RequestsList from "./requestsList";
import BookPageWrapper from "../../components/book/book_page_wrapper";
import UserPageWrapper from "../../components/user/user_page_wrapper";
import { UserTable } from "../admin/userTable";
import { useEffect } from "react";
import { useLibrary } from "../../libraryContext";

export default function ModerDashboard() {
	const { refreshAll, moderBooks, users } = useLibrary()

	useEffect(() => {
		if (!moderBooks || !users) {
			console.log('ModerDashboard: refreshing data because moderBooks or users is null');
			refreshAll();
		}
	}, []);

	if (!moderBooks || !users) return <h1>Загрузка...</h1>;

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
				</Routes>
			</div>
		</>
	)
}
