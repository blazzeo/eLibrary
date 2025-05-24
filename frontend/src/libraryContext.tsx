import React, { createContext, useContext, useEffect, useState, useCallback, useMemo } from "react";
import {
	getBooks,
	getUsers,
	getModerBooks,
	getUser,
} from "./components/api/DatabaseAPI";
import { BookData, BookInfo, UserData } from "./components/structs";
import { parseJwt } from "./components/auth/authContext";
import { toast } from "react-toastify";

interface LibraryContextType {
	books: BookData[] | null;
	users: UserData[] | null;
	user: UserData | null;
	user_role: string | null;
	moderBooks: BookInfo[] | null;
	token: string | null;
	refreshAll: () => Promise<void>;
	updateBookStatus: (bookId: number, newStatus: number) => void;
	setAuthToken: (token: string | null) => void;
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
	const [user, setUser] = useState<UserData | null>(null);
	const [token, setToken] = useState<string | null>(() => sessionStorage.getItem("token"));
	const [user_role, setRole] = useState<string | null>(() => {
		const storedToken = sessionStorage.getItem("token");
		if (storedToken) {
			const payload = parseJwt(storedToken);
			return payload?.role || null;
		}
		return null;
	});
	const [moderBooks, setModerBooks] = useState<BookInfo[] | null>(null);
	const [isRefreshing, setIsRefreshing] = useState(false);
	const [lastRefreshTime, setLastRefreshTime] = useState(0);

	const setAuthToken = useCallback((newToken: string | null) => {
		console.log('setAuthToken called with:', newToken);
		// Очищаем все данные перед установкой нового токена
		setBooks(null);
		setUsers(null);
		setUser(null);
		setModerBooks(null);
		
		if (newToken) {
			const parsed_token = parseJwt(newToken);
			if (parsed_token) {
				sessionStorage.setItem("token", newToken);
				setRole(parsed_token.role);
				setToken(newToken);
			} else {
				console.error('Invalid token provided to setAuthToken');
				sessionStorage.removeItem("token");
				setRole(null);
				setToken(null);
			}
		} else {
			sessionStorage.removeItem("token");
			setRole(null);
			setToken(null);
		}
	}, []);

	// Функция для локального обновления статуса книги
	const updateBookStatus = useCallback((bookId: number, newStatus: number) => {
		console.log('Updating book status locally:', { bookId, newStatus });
		setBooks(prevBooks => {
			if (!prevBooks) return null;
			
			// Находим книгу и обновляем её статус
			const updatedBooks = prevBooks.map(book => 
				book.book_id === bookId 
					? { ...book, loan_status: newStatus } 
					: book
			);
			
			console.log('Updated books:', updatedBooks);
			return updatedBooks;
		});
	}, []);

	const refreshAll = useCallback(async () => {
		const now = Date.now();
		// Предотвращаем слишком частые обновления (минимум 1 секунда между обновлениями)
		if (isRefreshing || (now - lastRefreshTime < 1000)) {
			console.log('Skipping refresh - too soon or already refreshing');
			return;
		}

		console.log('Starting refreshAll with token:', token);
		setIsRefreshing(true);
		setLastRefreshTime(now);

		try {
			if (!token) {
				console.log('No token, clearing data');
				setBooks(null);
				setUsers(null);
				setUser(null);
				setRole(null);
				setModerBooks(null);
				return;
			}

			const payload = parseJwt(token);
			if (!payload) {
				console.error('Invalid token');
				setAuthToken(null);
				return;
			}

			console.log('Fetching data for role:', payload.role);
			setRole(payload.role);

			const fetchedUser = await getUser(payload.user_id);
			console.log('Fetched user:', fetchedUser);
			setUser(fetchedUser);

			switch (payload.role) {
				case 'user': {
					console.log('Fetching books for user:', payload.user_id);
					const fetchedBooks = await getBooks(payload.user_id);
					console.log('Fetched books:', fetchedBooks);
					setBooks(fetchedBooks);
					break;
				}
				case 'moder':
				case 'admin': {
					console.log('Fetching admin/moder data');
					const [fetchedUsers, fetchedModerBooks] = await Promise.all([
						getUsers(),
						getModerBooks(),
					]);
					console.log('Fetched data:', { users: fetchedUsers, books: fetchedModerBooks });
					setUsers(fetchedUsers);
					setModerBooks(fetchedModerBooks);
					break;
				}
				default:
					console.log('Unknown role:', payload.role);
					setUsers(null);
					setModerBooks(null);
			}
		} catch (error) {
			console.error("Ошибка при обновлении данных:", error);
			toast.error("Ошибка при обновлении данных");
		} finally {
			setIsRefreshing(false);
		}
	}, [token, isRefreshing, lastRefreshTime, setAuthToken]);

	useEffect(() => {
		console.log('Token changed, current token:', token);
		if (token) {
			refreshAll();
		}
	}, [token, refreshAll]);

	const contextValue = useMemo(() => ({
		books,
		user_role,
		token,
		user,
		users,
		moderBooks,
		refreshAll,
		updateBookStatus,
		setAuthToken,
	}), [books, user_role, token, user, users, moderBooks, refreshAll, updateBookStatus, setAuthToken]);

	return (
		<LibraryContext.Provider value={contextValue}>
			{children}
		</LibraryContext.Provider>
	);
};
