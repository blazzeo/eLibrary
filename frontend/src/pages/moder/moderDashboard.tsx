import Header from "../../components/header";
import { Route, Routes } from "react-router";
import AddLoanForm from "../../components/forms/AddLoanForm";
import ModerBookTable from "./moderBookTable";
import RequestsList from "./requestsList";
import BookPageWrapper from "../../components/book/book_page_wrapper";
import UserPageWrapper from "../../components/user/user_page_wrapper";

export default function ModerDashboard() {
	return (
		<>
			<Header />
			<Routes>
				<Route path="/" element={
					<ModerBookTable />
				} />
				<Route path="/createloan" element={
					<AddLoanForm />
				} />
				<Route path="/requests" element={
					<RequestsList />
				} />
				<Route path="/book" element={<BookPageWrapper />} />
				<Route
					path="/user"
					element={<UserPageWrapper />}
				/>
			</Routes>
		</>
	)
}
