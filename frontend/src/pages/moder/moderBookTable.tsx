import { useState } from "react";
import { BookInfo } from "../../components/structs"

interface Props {
	bookList: BookInfo[];
	updateBooks: () => void;
}

export default function ModerBookTable({ bookList, updateBooks }: Props) {
	const [books, setBooks] = useState(bookList)

	const handleUpdate = () => {
		updateBooks()
	}

	return (
		<div />
	)
}
