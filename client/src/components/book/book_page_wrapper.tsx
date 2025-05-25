import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import BookPage from "./book_page";
import { BookInfo } from "../structs";
import { Spinner } from "react-bootstrap";
import { useLibrary } from "../../libraryContext";

export default function BookPageWrapper() {
	const { moderBooks } = useLibrary();
	const { id } = useParams();

	const [bookInfo, setBookInfo] = useState<BookInfo | null>(null);
	const [loading, setLoading] = useState(true);
	const [error, setError] = useState<string | null>(null);

	useEffect(() => {
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
		} catch (error) {
			console.error("Ошибка при загрузке книги:", error);
			setError("Ошибка при загрузке книги");
			setBookInfo(null);
		} finally {
			setLoading(false);
		}
	}, [id, moderBooks]);

	if (loading) {
		return (
			<div className="d-flex justify-content-center p-5">
				<Spinner animation="border" role="status">
					<span className="visually-hidden">Загрузка...</span>
				</Spinner>
			</div>
		);
	}

	if (error) {
		return <div className="alert alert-danger m-3">{error}</div>;
	}

	if (!bookInfo) {
		return <div className="alert alert-warning m-3">Книга не найдена</div>;
	}

	return <BookPage bookInfo={bookInfo} />;
}
