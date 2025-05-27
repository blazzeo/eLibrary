import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import UserPage from "./user_page";
import { BookInfo, UserData } from "../structs.tsx";
import { Spinner } from "react-bootstrap";
import { useLibrary } from "../../context/libraryContext";
import { getUser } from "../../api/DatabaseAPI.tsx";

export default function UserPageWrapper() {
	const { moderBooks } = useLibrary()
	const { id } = useParams();

	const [user, setUser] = useState<UserData | null>(null);
	const [userBooks, setUserBooks] = useState<BookInfo[] | null>(null);
	const [loading, setLoading] = useState(true);
	const [error, setError] = useState<string | null>(null);

	const updateUser = async () => {
		if (!id) return;

		try {
			const userData = await getUser(id);
			setUser(userData);

			if (moderBooks) {
				const user_books = moderBooks.filter(b => {
					const ownerMatches = b.owner?.user_id === userData.user_id;
					const inWishlist = b.wishlist.some(w => w.user_id === userData.user_id);
					return ownerMatches || inWishlist;
				});
				setUserBooks(user_books);
			}

			setError(null);
		} catch (err) {
			console.error('Error fetching user data:', err);
			setError("Ошибка при загрузке данных пользователя");
			setUserBooks(null);
		}
		setLoading(false);
	};

	useEffect(() => {
		setLoading(true);
		updateUser();
	}, [id, moderBooks]);

	if (loading) return <Spinner animation="border" />;
	if (error) return <p>{error}</p>;
	if (!user) return <p>Пользователь не найден</p>;

	return <UserPage user={user} books={userBooks} />;
}
