import type { AxiosResponse } from "axios";
import type { BookData, UserData, Author } from "../components/structs";
import axios from "../components/auth/axiosInstanse";

const SERVER = import.meta.env.VITE_API_SERVER;

export async function authenticate(username: string, password: string) {
	const response = await fetch(SERVER + "/api/login", {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify({ login: username, password }),
	});

	if (!response.ok) {
		throw new Error("Authentication failed");
	}

	let response_json = await response.json()

	return response_json.token;
}

export async function getUser(user_id: string) {
	try {
		console.log('getUser: Fetching data for user_id:', user_id);
		const response = await axios.get(SERVER + `/api/users/${user_id}`);
		console.log('getUser: Received response:', response.data);
		return response.data;
	} catch (error) {
		console.error("Error get user: ", error);
		throw error;
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

export enum userRole {
	admin = 'admin',
	moder = 'moder',
	user = 'user'
}

export async function createUser(user_name: string, user_password: string, user_role: userRole) {
	try {
		const response = await axios.post(
			SERVER + `/api/users`, { login: user_name, password: user_password, role: user_role }
		);
		console.log(response.data)
		return response.data;
	} catch (error) {
		console.error(`Error creating user: ${error}`);
		throw error;
	}
}

export async function register(user_name: string, user_password: string) {
	try {
		const response = await axios.post(
			SERVER + `/api/register`, { login: user_name, password: user_password }
		);
		console.log(response.data)
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

export async function getBooks(user_id: number | null): Promise<BookData[]> {
	try {
		if (!user_id)
			throw new Error("Invalid user_id");

		const response: AxiosResponse<BookData[]> = await axios.get(`/api/books/${user_id}`);

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
		const response = await axios.post(SERVER + `/api/books`, { book: book });
		console.log(response);
		if (response.data.error) {
			throw new Error(response.data.error);
		}
		return response.data;
	} catch (error: any) {
		if (error.response?.data?.error) {
			throw new Error(error.response.data.error);
		}
		throw error;
	}
}

export async function addLoan(username: string | null, bookId: number | null, date: Date) {
	try {
		if (!username || !bookId) {
			throw new Error('Необходимо указать пользователя и книгу');
		}
		const response = await axios.post(SERVER + `/api/loans`, {
			user_name: username,
			book_id: bookId,
			return_date: date
		});
		if (response.data.error) {
			throw new Error(response.data.error);
		}
		return response.data;
	} catch (error: any) {
		if (error.response?.data?.error) {
			throw new Error(error.response.data.error);
		}
		throw error;
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

export async function askExtension(userId: number, bookId: number, request_date: Date) {
	try {
		const response = await axios.post(SERVER + `/api/askextension`, { user_id: userId, book_id: bookId, request_date: request_date })
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
		const response = await axios.put(SERVER + '/api/books', { book: book });
		return response.data;
	} catch (error) {
		console.error(error);
		throw error;
	}
}

export async function deleteBook(book_id: number) {
	try {
		const response = await axios.delete(SERVER + `/api/books/${book_id} `)
		return response.data
	} catch (error) {
		console.error(error);
		throw error;
	}
}

export async function toggleWishlist(user_id: number, book_id: number) {
	try {
		console.log('toggleWishlist: Sending request for book_id:', book_id);
		const response = await axios.post(SERVER + '/api/togglewishlist', { user_id: user_id, book_id: book_id });
		console.log('toggleWishlist: Received response:', response.data);
		return response.data; // Теперь сервер возвращает обновленные данные пользователя напрямую
	} catch (error) {
		console.error('toggleWishlist error:', error);
		throw error;
	}
}

export async function searchAuthors(searchTerm: string): Promise<Author[]> {
	try {
		const response = await axios.get(SERVER + `/api/authors/search?term=${searchTerm}`);
		return response.data;
	} catch (error) {
		console.error("Error searching authors:", error);
		throw error;
	}
}

export async function searchGenres(searchTerm: string) {
	try {
		console.log('API searchGenres: отправка запроса с термином:', searchTerm);
		const response = await axios.get(`${SERVER}/api/genres/search`, {
			params: { term: searchTerm },
			headers: {
				'Authorization': `Bearer ${localStorage.getItem('token')}`
			}
		});
		console.log('API searchGenres: получен ответ:', response.data);
		return response.data;
	} catch (error) {
		console.error("API searchGenres: ошибка:", error);
		throw error;
	}
}

export async function getAuthors() {
	try {
		console.log('API getAuthors: запрос списка авторов');
		const response = await axios.get(`${SERVER}/api/authors`, {
			headers: {
				'Authorization': `Bearer ${localStorage.getItem('token')}`
			}
		});
		console.log('API getAuthors: получен ответ:', response.data);
		return response.data;
	} catch (error) {
		console.error("API getAuthors: ошибка:", error);
		throw error;
	}
}
