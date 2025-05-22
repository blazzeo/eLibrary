import type { AxiosResponse } from "axios";
import axios from '../auth/axiosInstanse'
import { BookData, UserData } from "../structs";

const SERVER = 'http://localhost:3000'

export async function authenticate(user_name: string, user_password: string) {
	try {
		const response = await axios.post(`${SERVER}/api/authenticate`, {
			login: user_name,
			password: user_password,
		});

		const { token } = response.data;
		localStorage.setItem("token", token); // или cookie
		return token;
	} catch (error) {
		console.error("Auth failed:", error);
		throw error;
	}
}

export async function getUser(user_name: string) {
	try {
		const response = await axios.get(SERVER + `/api/users/${user_name}`)
		return response.data
	} catch (error) {
		console.error("Error get user: ", error)
		throw error
	}
}

export async function updateUser(user_name: string, user: UserData) {
	try {
		const response = await axios.put(SERVER + `/api/users/${user_name}`, user, {
			headers: {
				'Content-Type': 'application/json',
			},
		});
		return response.data
	} catch (error) {
		console.error("Error updating user: ", error)
		throw error
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

export async function createUser(user_name: string, user_password: string) {
	try {
		const response = await axios.post(
			SERVER + `/api/register`, { login: user_name, password: user_password }
		);
		return response.data;
	} catch (error) {
		console.error(`Error creating user: ${error}`);
		throw error;
	}
}

export async function createModer(name: string, password: string) {
	try {
		const response = await axios.post(SERVER + `/api/createmoder`, { login: name, password: password })
		return response
	} catch (error) {
		console.error("Error creating moder: ", error)
		throw error
	}
}

export async function getBooks(username: string | null): Promise<BookData[]> {
	try {
		if (!username)
			throw new Error("Invalid username");

		const response: AxiosResponse<BookData[]> = await axios.get(`/api/books/${encodeURIComponent(username)}`);

		return response.data;
	} catch (error) {
		console.error("Error fetching books:", error);
		throw error;
	}
}

export async function getModerBooks() {
	try {
		const response = await axios.get(SERVER + '/api/moderbooks')
		return response.data.result
	} catch (error) {
		console.error("Error on getting moder books: ", error)
		throw error;
	}
}

export async function addBook(book: BookData) {
	try {
		const response = await axios.post(SERVER + `/api/books`, { book: book })
		return response.data
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function addLoan(username: string | null, bookId: number | null, date: Date) {
	try {
		if (username === null || bookId === null)
			throw 'invalid username or bookid'
		const response = await axios.post(SERVER + `/api/loans`, { user_name: username, book_id: bookId, return_date: date })
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

export async function askExtension(userName: string, bookId: number, request_date: Date) {
	try {
		const response = await axios.post(SERVER + `/api/askextension`, { user_name: userName, book_id: bookId, request_date: request_date })
		return response.data
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function extentLoan(userName: string, bookId: number, newDate: Date) {
	try {
		const response = await axios.put(SERVER + `/api/loans`, { user_name: userName, book_id: bookId, new_date: newDate })
		return response.data
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function confirmExtension(bookId: number, userId: number, requestDate: Date) {
	try {
		const response = await axios.post(SERVER + '/api/confirmextension', { book_id: bookId, user_id: userId, request_date: requestDate })
		console.log(response)
		return response.data
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function rejectExtension(bookId: number, userId: number, requestDate: Date) {
	try {
		const response = await axios.post(SERVER + '/api/rejectextension', { book_id: bookId, user_id: userId, request_date: requestDate })
		console.log(response)
		return response.data
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function getUsers() {
	try {
		const response = await axios.get(SERVER + `/api/users`);
		return response.data;
	} catch (error) {
		console.error(error);
		throw error;
	}
}

export async function deleteUser(user_id: number) {
	try {
		const response = await axios.delete(SERVER + `/api/users/${user_id}`)
		return response.data
	} catch (error) {
		console.error(error);
		throw error;
	}
}

export async function getLoans() {
	try {
		const response = await axios.get(SERVER + '/api/loans')
		return response.data
	} catch (error) {
		console.error(error);
		throw error;
	}
}

export async function editBook(book: BookData) {
	try {
		const response = await axios.put(SERVER + '/api/books', { book: book })
		return response.data
	} catch (error) {
		console.error(error);
		throw error;
	}
}

export async function deleteBook(book_id: number) {
	try {
		const response = await axios.delete(SERVER + `/api/deletebook/${book_id}`)
		return response.data
	} catch (error) {
		console.error(error);
		throw error;
	}
}

export async function toggleWishlist(user_name: string, book_id: number) {
	try {
		const response = await axios.post(SERVER + '/api/togglewishlist', { user_name: user_name, book_id: book_id })
		return response.data
	} catch (error) {
		console.error(error);
		throw error;
	}
}
