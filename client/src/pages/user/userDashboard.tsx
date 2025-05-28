import Header from "../../components/header";
import { Route, Routes } from "react-router";
import { BookShelf } from "./userBookShelf";
import UserBookTable from "./userBookTable";
import { WishList } from "./userWishlist";
import { useLibrary } from "../../context/libraryContext";
import { useEffect } from "react";
import BookPageUserWrapper from "../../components/book/book_page_user_wrapper";
import UserProfile from "../profilePage";

export default function UserDashboard() {
	const { books, refreshAll } = useLibrary()

	useEffect(() => {
		// Вызываем refreshAll только если нет данных
		if (!books) {
			console.log('UserDashboard: refreshing data because books is null');
			refreshAll();
		}
	}, []); // Зависим только от начальной загрузки

	if (!books) {
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
					<Route index element={<UserBookTable />} />
					<Route path="bookshelf" element={<BookShelf books={books.filter(x => x.loan_status === 1)} />} />
					<Route path="wishlist" element={<WishList books={books.filter(x => x.is_in_my_wishlist === true)} />} />
					<Route path="book/:id" element={<BookPageUserWrapper />} />
					<Route path="profile" element={<UserProfile />} />
				</Routes>
			</div>
		</>
	)
}
