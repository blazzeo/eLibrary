import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import { BookData } from "../structs";
import { Spinner } from "react-bootstrap";
import { useLibrary } from "../../libraryContext";
import UserBookPage from "./book_page_user";

export default function BookPageUserWrapper() {
	const { books } = useLibrary();

	const [searchParams] = useSearchParams();
	const id = searchParams.get("id");

	const [bookData, setBookData] = useState<BookData | null>(null);
	const [loading, setLoading] = useState(true);
	const [error, setError] = useState<string | null>(null);

	const updateBooks = () => {
		if (!id || !books) {
			setBookData(null);
			setLoading(false);
			return;
		}
		setLoading(true);
		try {
			const book = books.find(b => b.book_id === Number(id));
			if (!book) {
				setError("Книга не найдена");
				setBookData(null);
			} else {
				setBookData(book);
				setError(null);
			}
		} catch {
			setError("Ошибка при загрузке книги");
			setBookData(null);
		} finally {
			setLoading(false);
		}
	};

	useEffect(() => {
		updateBooks();
		// eslint-disable-next-line react-hooks/exhaustive-deps
	}, [id, books]);

	if (loading) return <Spinner animation="border" />;
	if (error) return <p>{error}</p>;
	if (!bookData) return <p>Книга не найдена</p>;

	return <UserBookPage book={bookData} />;
}
