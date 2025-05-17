import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import BookPage from "./book_page";
import { BookInfo } from "./structs";
import { Spinner } from "react-bootstrap";

interface Props {
	books: BookInfo[];
}

export default function BookPageWrapper({ books }: Props) {
	const [searchParams] = useSearchParams();
	const id = searchParams.get("id");


	const [bookInfo, setBookInfo] = useState<BookInfo | null>(null);
	const [loading, setLoading] = useState(true);
	const [error, setError] = useState<string | null>(null);

	const updateBooks = async () => {
		if (!id) return;
		try {
			const book = books.find(b => b.book_info.book.book_id == Number(id))
			setBookInfo(book!);
			setError(null);
		} catch (err: any) {
			setError("Ошибка при загрузке книги");
		} finally {
			setLoading(false);
		}
	};

	useEffect(() => {
		updateBooks();
	}, [id]);

	if (loading) return <Spinner animation="border" />;
	if (error) return <p>{error}</p>;
	if (!bookInfo) return <p>Книга не найдена</p>;

	return <BookPage bookInfo={bookInfo} updateBooks={updateBooks} />;
}
