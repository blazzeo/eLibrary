import { useState } from "react";
import { BookInfo } from "../../components/structs";
import ExtensionCard from "../../components/extension_card";

interface Props {
	bookList: BookInfo[];
	updateBooks: () => void;
}

export default function RequestsList({ bookList, updateBooks }: Props) {
	const [books, _setBooks] = useState(bookList)

	const update = async () => {
		await updateBooks();
	}

	return (
		books.filter(book => book.owner || book.wishlist.length > 0).map((book, index) => (
			<div>
				<ExtensionCard key={index} bookInfo={book} updateBooks={update} />
			</div>
		))
	)
}
