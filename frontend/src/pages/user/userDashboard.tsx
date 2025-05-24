import Header from "../../components/header";
import { Route, Routes } from "react-router";
import { BookShelf } from "./userBookShelf";
import UserBookTable from "./userBookTable";
import { WishList } from "./userWishlist";
import { useLibrary } from "../../libraryContext";
import { useEffect } from "react";
import BookPageUserWrapper from "../../components/book/book_page_user_wrapper";
import UserProfile from "../../components/user_profile";

export default function UserDashboard() {
	const { books, refreshAll, user } = useLibrary()

	useEffect(() => {
		// Вызываем refreshAll только если нет данных
		if (!books) {
			console.log('UserDashboard: refreshing data because books is null');
			refreshAll();
		}
	}, []); // Зависим только от начальной загрузки

	if (!books) return <h1>Загрузка...</h1>;

	return (
		<>
			<Header />
			<div className="container my-4">
				<Routes>
					<Route index element={<UserBookTable />} />
					<Route path="bookshelf" element={<BookShelf books={books.filter(x => x.loan_status === 0)} />} />
					<Route path="wishlist" element={<WishList books={books.filter(x => x.loan_status === 1)} />} />
					<Route path="book/:id" element={<BookPageUserWrapper />} />
					<Route path="profile" element={<UserProfile user={user} />} />
				</Routes>
			</div>
		</>
	)
}
