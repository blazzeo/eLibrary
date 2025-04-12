import { useState } from "react";
import { borrowBook } from "../api/DatabaseAPI";

export function AddLoanForm() {
	const [user, setUser] = useState(null);
	const [book, setBook] = useState(null);


	async const addLoan = () => {
		await borrowBook(user, book)
	}

	return (
		<>
		</>
	)
}
