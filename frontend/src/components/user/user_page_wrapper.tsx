import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import UserPage from "./user_page";
import { BookInfo, UserData } from "../structs";
import { Spinner } from "react-bootstrap";
import { useLibrary } from "../../libraryContext";

export default function UserPageWrapper() {
	const { moderBooks, users } = useLibrary()
	const [searchParams] = useSearchParams();
	const id = searchParams.get("id");

	const [user, setUser] = useState<UserData | null>(null);
	const [userBooks, setUserBooks] = useState<BookInfo[] | null>(null);
	const [loading, setLoading] = useState(true);
	const [error, setError] = useState<string | null>(null);

	const updateUser = () => {
		if (!id) return;

		const user = users!.find(u => u.user_id === Number(id));
		if (user) {
			setUser(user);

			const user_books = moderBooks!.filter(b => {
				const ownerMatches = b.owner?.user_id === user.user_id;
				const inWishlist = b.wishlist.some(w => w.user_id === user.user_id);
				return ownerMatches || inWishlist;
			});

			setUserBooks(user_books);
			setError(null);
		} else {
			setError("Пользователь не найден");
			setUserBooks(null);
		}
		setLoading(false);
	};

	useEffect(() => {
		setLoading(true);
		updateUser();
	}, [id, users, moderBooks]);

	if (loading) return <Spinner animation="border" />;
	if (error) return <p>{error}</p>;
	if (!user) return <p>Пользователь не найден</p>;

	return <UserPage user={user} books={userBooks} />;
}
