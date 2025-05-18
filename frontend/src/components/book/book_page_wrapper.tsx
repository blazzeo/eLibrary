import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import BookPage from "./book_page";
import { BookInfo } from "../structs";
import { Spinner } from "react-bootstrap";
import { useLibrary } from "../../libraryContext";

export default function BookPageWrapper() {
	const { moderBooks } = useLibrary();

	const [searchParams] = useSearchParams();
	const id = searchParams.get("id");

	const [bookInfo, setBookInfo] = useState<BookInfo | null>(null);
	const [loading, setLoading] = useState(true);
	const [error, setError] = useState<string | null>(null);

	const updateBooks = () => {
		if (!id || !moderBooks) {
			setBookInfo(null);
			setLoading(false);
			return;
		}
		setLoading(true);
		try {
			const book = moderBooks.find(b => b.book.book_id === Number(id));
			if (!book) {
				setError("Книга не найдена");
				setBookInfo(null);
			} else {
				setBookInfo(book);
				setError(null);
			}
		} catch {
			setError("Ошибка при загрузке книги");
			setBookInfo(null);
		} finally {
			setLoading(false);
		}
	};

	useEffect(() => {
		updateBooks();
		// eslint-disable-next-line react-hooks/exhaustive-deps
	}, [id, moderBooks]);

	if (loading) return <Spinner animation="border" />;
	if (error) return <p>{error}</p>;
	if (!bookInfo) return <p>Книга не найдена</p>;

	return <BookPage bookInfo={bookInfo} />;
}
