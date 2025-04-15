import { useState } from "react";
import { borrowBook, returnBook } from "../api/DatabaseAPI";

export function AddLoanForm() {
	const [user, setUser] = useState(null);
	const [book, setBook] = useState(null);
	const [return_date, setDate] = useState(new Date);


	const addLoan = async () => {
		await borrowBook(user, book, return_date)
	}

	const removeLoan = async () => {
		await returnBook(book)
	}

	return (
		<>
		</>
	)
}
