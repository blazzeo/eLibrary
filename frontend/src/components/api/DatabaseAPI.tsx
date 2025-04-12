import axios, { AxiosResponse } from "axios";
import { BookData, UserData } from "../structs";

const SERVER = 'http://localhost:3000'

export async function checkUser({ username, password }: UserData) {
	try {
		const response = await axios.get(
			SERVER + `/api/checkuser`,
			{
				params: {
					login: username,
					password: password,
				},
			}
		);
		return response.data;
	} catch (error) {
		console.error(`Error checking user: ${error}`);
		throw error;
	}
}

export async function checkAvailableLogin(userLogin: string) {
	try {
		const response = await axios.get(
			SERVER + `/api/checklogin`,
			{
				params: { login: userLogin },
			}
		);
		return response.data;
	} catch (error) {
		console.error("Error checking login:", error);
		throw error;
	}
}

export async function createUser({ username, password }: UserData) {
	try {
		const response = await axios.get(
			SERVER + `/api/createuser`,
			{
				params: {
					login: username,
					password: password,
				},
			}
		);
		return response.data;
	} catch (error) {
		console.error(`Error creating user: ${error}`);
		throw error;
	}
}

export async function getBooks(username: string | null) {
	try {
		if (username === null)
			throw "invalid username"
		const response: AxiosResponse<BookData[]> = await axios.get(
			SERVER + `/api/getbooks?username=${username}`
		);

		return response.data;
	} catch (error) {
		console.error("Error fetching books:", error);
		throw error;
	}
}

export async function addBook(book: BookData) {
	try {
		console.log("ADD BOOK");

		const response = await axios.post(SERVER + `/api/addbook`, { book: book })
		return response.data
	} catch (error) {
		console.log("failed add book");

		console.error(error)
		throw error
	}
}

export async function borrowBook(username: string | null, bookId: number | null) {
	try {
		if (username === null || bookId === null)
			throw 'invalid username or bookid'
		const response = await axios.post(SERVER + `/api/borrowbook`, { user_name: username, book_id: bookId })
		return response.data
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function returnBook(bookId: number | null) {
	try {
		if (bookId === null)
			throw 'invalid bookid'
		const response = await axios.post(SERVER + `/api/returnbook`, { book_id: bookId })
		return response.data
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function askExtension(bookId: number) {
	try {
		const response = await axios.post(SERVER + `/api/askextension`, { book_id: bookId })
		return response.data
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function getUsers() {
	try {
		const response = await axios.get(SERVER + `/api/getusers`);
		return response.data;
	} catch (error) {
		console.error(error);
		throw error;

	}
}

export async function deleteUser(userName: string) {
	try {
		const response = await axios.post(SERVER + `/api/deleteuser`, { user_name: userName })
		return response.data
	} catch (error) {
		console.error(error);
		throw error;
	}
}

export async function getLoans() {
	try {
		const response = await axios.get(SERVER + '/api/getloans')
		return response.data
	} catch (error) {
		console.error(error);
		throw error;
	}
}

export async function editBook(book: BookData) {
	try {
		const response = await axios.post(SERVER + '/api/editbook', { book: book })
		return response.data
	} catch (error) {
		console.error(error);
		throw error;
	}
}

export async function deleteBook(book_id: number) {
	try {
		const response = await axios.post(SERVER + '/api/deletebook', { book_id: book_id })
		return response.data
	} catch (error) {
		console.log("DELETE ERROR")
		console.error(error);
		throw error;
	}
}

export async function addWishlist(user_name: string, book_id: number) {
	try {
		const response = await axios.post(SERVER + '/api/addwishlist', { user_name: user_name, book_id: book_id })
		return response.data
	} catch (error) {
		console.log("DELETE ERROR")
		console.error(error);
		throw error;
	}
}


