import React, { createContext, useContext, useEffect, useState } from "react";
import {
	getBooks,
	getUsers,
	addBook,
	deleteBook,
	getModerBooks,
} from "./components/api/DatabaseAPI"; // поправь путь при необходимости
import { BookData, BookInfo, UserData } from "./components/structs";

interface LibraryContextType {
	books: BookData[] | null;
	users: UserData[] | null;
	moderBooks: BookInfo[] | null;
	refreshBooks: () => Promise<void>;
	refreshUsers: () => Promise<void>;
	refreshModerBooks: () => Promise<void>;

	// Обновление с перезапросом
	addBookAndRefresh: (book: BookData) => Promise<void>;
	deleteBookAndRefresh: (bookId: number) => Promise<void>;
	// и другие
}

const LibraryContext = createContext<LibraryContextType | undefined>(undefined);

export const useLibrary = () => {
	const context = useContext(LibraryContext);
	if (!context) throw new Error("useLibrary must be used within LibraryProvider");
	return context;
};

export const LibraryProvider = ({ children }: { children: React.ReactNode }) => {
	const [books, setBooks] = useState<BookData[] | null>(null);
	const [users, setUsers] = useState<UserData[] | null>(null);
	const [moderBooks, setModerBooks] = useState<BookInfo[] | null>(null);

	const refreshBooks = async () => {
		try {
			const user_name = sessionStorage.getItem("userName")
			const fetchedBooks = await getBooks(user_name); // или текущий username
			setBooks(fetchedBooks);
		} catch (err) {
			console.error("Ошибка загрузки книг", err);
		}
	};

	const refreshUsers = async () => {
		try {
			const fetchedUsers = await getUsers();
			setUsers(fetchedUsers);
		} catch (err) {
			console.error("Ошибка загрузки пользователей", err);
		}
	};

	const refreshModerBooks = async () => {
		try {
			const fetchedModerBooks = await getModerBooks();
			setModerBooks(fetchedModerBooks);
		} catch (err) {
			console.error("Ошибка загрузки книг модератора", err);
		}
	}

	useEffect(() => {
		refreshBooks();
		refreshUsers();
		refreshModerBooks();
	}, []);

	// Обертки с обновлением
	const addBookAndRefresh = async (book: BookData) => {
		await addBook(book);
		await refreshModerBooks();
	};

	const deleteBookAndRefresh = async (bookId: number) => {
		await deleteBook(bookId);
		await refreshModerBooks();
	};


	return (
		<LibraryContext.Provider
			value={{
				books,
				users,
				moderBooks,
				refreshBooks,
				refreshUsers,
				refreshModerBooks,
				addBookAndRefresh,
				deleteBookAndRefresh,
			}}
		>
			{children}
		</LibraryContext.Provider>
	);
};
