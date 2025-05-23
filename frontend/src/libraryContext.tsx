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
	const [user_role, setRole] = useState<string | null>(() => {
		const storedToken = sessionStorage.getItem("token");
		if (storedToken) {
			const payload = parseJwt(storedToken);
			return payload.role;
		}
		return null;
	});
	const [moderBooks, setModerBooks] = useState<BookInfo[] | null>(null);
	const [token, setToken] = useState<string | null>(() => sessionStorage.getItem("token"));

	const refreshAll = useCallback(async () => {
		if (!token) {
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

			const fetchedUser = await getUser(payload.user_id);
			setUser(fetchedUser);

			switch (payload.role) {
				case 'user': {
					const fetchedBooks = await getBooks(payload.user_id);
					setBooks(fetchedBooks);
					break;
				}
				case 'moder': {
					const [fetchedUsers, fetchedModerBooks] = await Promise.all([
						getUsers(),
						getModerBooks(),
					]);
					setUsers(fetchedUsers);
					setModerBooks(fetchedModerBooks);
					break;
				}
				case 'admin': {
					const [fetchedUsers, fetchedModerBooks] = await Promise.all([
						getUsers(),
						getModerBooks(),
					]);
					setUsers(fetchedUsers);
					setModerBooks(fetchedModerBooks);
					break;
				}
				default:
					setUsers(null);
					setModerBooks(null);
			}
		} catch (error) {
			console.error("Ошибка при обновлении данных", error);
			setToken(null);
			setRole(null);
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
			const parsed_token = parseJwt(newToken);
			setRole(parsed_token.role);
		} else {
			sessionStorage.removeItem("token");
			setRole(null);
		}
		setToken(newToken);
	};

	return (
		<LibraryContext.Provider
			value={{
				books,
				user_role,
				token,
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
