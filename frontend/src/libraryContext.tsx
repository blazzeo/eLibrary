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
	moderBooks: BookInfo[] | null;
	token: string | null;
	refreshAll: () => Promise<void>;
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
	const [moderBooks, setModerBooks] = useState<BookInfo[] | null>(null);

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
				setToken(newToken);
			} else {
				console.error('Invalid token provided to setAuthToken');
				sessionStorage.removeItem("token");
				setToken(null);
			}
		} else {
			sessionStorage.removeItem("token");
			setToken(null);
		}
	}, []);

	const refreshAll = useCallback(async () => {
		console.log('Starting refreshAll with token:', token);

		try {
			if (!token) {
				console.log('No token, clearing data');
				setBooks(null);
				setUsers(null);
				setUser(null);
				setModerBooks(null);
				return; // Выходим без показа ошибки, так как это нормальная ситуация при логауте
			}

			const payload = parseJwt(token);
			if (!payload) {
				console.log('Invalid token, clearing data');
				setAuthToken(null);
				return; // Также выходим без ошибки
			}

			console.log('Fetching data for role:', payload.role);

			// Сначала получаем обновленные данные пользователя
			console.log('Fetching user data for ID:', payload.user_id);
			const fetchedUser = await getUser(payload.user_id);
			console.log('Fetched user data:', fetchedUser);
			setUser(fetchedUser);

			// Затем получаем книги для текущего пользователя
			console.log('Fetching books for user:', payload.user_id);
			const fetchedBooks = await getBooks(payload.user_id);
			console.log('Fetched books:', fetchedBooks);
			setBooks(fetchedBooks);

			// Если пользователь админ или модератор, получаем дополнительные данные
			if (fetchedUser.user_role === 'admin' || fetchedUser.user_role === 'moder') {
				console.log('Fetching admin/moder data');
				const [fetchedUsers, fetchedModerBooks] = await Promise.all([
					getUsers(),
					getModerBooks(),
				]);
				console.log('Fetched admin data:', {
					users: fetchedUsers,
					moderBooks: fetchedModerBooks
				});
				setUsers(fetchedUsers);
				setModerBooks(fetchedModerBooks);
			} else {
				console.log('Regular user, clearing admin data');
				setUsers(null);
				setModerBooks(null);
			}
		} catch (error) {
			console.error("Ошибка при обновлении данных:", error);
			// Показываем ошибку только если есть токен и это не ошибка авторизации
			if (token && (error as any)?.response?.status !== 401 && (error as any)?.response?.status !== 403) {
				toast.error("Ошибка при обновлении данных");
			}
		}
	}, [token, setAuthToken]);

	useEffect(() => {
		if (token) {
			refreshAll();
		}
	}, [token]);

	const contextValue = useMemo(() => ({
		books,
		token,
		user,
		users,
		moderBooks,
		refreshAll,
		setAuthToken,
	}), [books, token, user, users, moderBooks, setAuthToken]);

	return (
		<LibraryContext.Provider value={contextValue}>
			{children}
		</LibraryContext.Provider>
	);
};
