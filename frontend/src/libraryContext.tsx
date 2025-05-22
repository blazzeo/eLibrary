import React, { createContext, useContext, useEffect, useState, useCallback } from "react";
import {
	getBooks,
	getUsers,
	getModerBooks,
	getUser,
} from "./components/api/DatabaseAPI";
import { BookData, BookInfo, UserData } from "./components/structs";
import { parseJwt } from "./components/auth/authContext";

interface LibraryContextType {
	books: BookData[] | null;
	users: UserData[] | null;
	user: UserData | null;
	user_role: string | null;
	moderBooks: BookInfo[] | null;
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
	const [user_role, setRole] = useState<string | null>(null);
	const [moderBooks, setModerBooks] = useState<BookInfo[] | null>(null);
	const [token, setToken] = useState<string | null>(() => sessionStorage.getItem("token"));

	const refreshAll = useCallback(async () => {
		if (!token) {
			// Сброс данных
			setBooks(null);
			setUsers(null);
			setUser(null);
			setRole(null);
			setModerBooks(null);
			return;
		}

		try {
			const payload = parseJwt(token);
			setRole(payload.role);

			// Для всех грузим книги и текущего пользователя
			const fetchedBooks = await getBooks(payload.user_name);
			const fetchedUser = await getUser(payload.user_name);
			setBooks(fetchedBooks);
			setUser(fetchedUser);

			if (payload.role === "admin" || payload.role === "moder") {
				// Дополнительные данные для модераторов и админов
				const [fetchedUsers, fetchedModerBooks] = await Promise.all([
					getUsers(),
					getModerBooks(),
				]);
				setUsers(fetchedUsers);
				setModerBooks(fetchedModerBooks);
			} else {
				// Для обычных пользователей очищаем эти данные
				setUsers(null);
				setModerBooks(null);
			}
		} catch (error) {
			console.error("Ошибка при обновлении данных", error);
			setToken(null);
			sessionStorage.removeItem("token");
		}
	}, [token]);

	// При изменении токена — обновляем данные
	useEffect(() => {
		refreshAll();
	}, [refreshAll]);

	// Функция установки токена и сохранения в sessionStorage
	const setAuthToken = (newToken: string | null) => {
		if (newToken) {
			sessionStorage.setItem("token", newToken);
			let parsed_token = parseJwt(newToken)
			console.log(parsed_token)
			setRole(parsed_token.role)
		} else {
			sessionStorage.removeItem("token");
		}
		setToken(newToken);
	};

	return (
		<LibraryContext.Provider
			value={{
				books,
				user_role,
				user,
				users,
				moderBooks,
				refreshAll,
				setAuthToken,
			}}
		>
			{children}
		</LibraryContext.Provider>
	);
};
