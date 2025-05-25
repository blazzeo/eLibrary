import { useEffect, useState } from "react";
import { useSearchParams, useParams } from "react-router-dom";
import { BookData } from "../structs";
import { Spinner } from "react-bootstrap";
import { useLibrary } from "../../libraryContext";
import UserBookPage from "./book_page_user";

export default function BookPageUserWrapper() {
	const { books } = useLibrary();
	const { id } = useParams();
	const [bookData, setBookData] = useState<BookData | null>(null);
	const [loading, setLoading] = useState(true);
	const [error, setError] = useState<string | null>(null);

	useEffect(() => {
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
		} catch (error) {
			console.error("Ошибка при загрузке книги:", error);
			setError("Ошибка при загрузке книги");
			setBookData(null);
		} finally {
			setLoading(false);
		}
	}, [id, books]);

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

	if (!bookData) {
		return <div className="alert alert-warning m-3">Книга не найдена</div>;
	}

	return <UserBookPage book={bookData} />;
}
