import Header from "../../components/header";
import { Route, Routes } from "react-router";
import { BookShelf } from "./userBookShelf";
import UserBookTable from "./userBookTable";
import { WishList } from "./userWishlist";
import { useLibrary } from "../../libraryContext";

export default function UserDashboard() {
	const { books } = useLibrary()

	return (
		<>
			<Header />
			<Routes>
				<Route path="/" element={
					<UserBookTable />
				} />
				<Route path="/bookshelf" element={
					<BookShelf books={books?.filter(x => x.loan_status === 0)} />
				} />
				<Route path="/wishlist" element={
					<WishList books={books?.filter(x => x.loan_status === 1)} />
				} />
			</Routes>
		</>
	)
}
