import { createContext, useContext, useState, ReactNode } from "react";
import { useNavigate } from "react-router-dom";

type AuthContextType = {
	token: string | null;
	login: (token: string) => void;
	logout: () => void;
};

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
	const [token, setToken] = useState<string | null>(() => sessionStorage.getItem("token"));
	const navigate = useNavigate();

	const login = (newToken: string) => {
		sessionStorage.setItem("token", newToken);
		setToken(newToken);
	};

	const logout = () => {
		sessionStorage.clear();
		setToken(null);
		navigate("/login");
	};

	return (
		<AuthContext.Provider value={{ token, login, logout }}>
			{children}
		</AuthContext.Provider>
	);
}

export function useAuth() {
	const context = useContext(AuthContext);
	if (context === undefined) {
		throw new Error("useAuth must be used within an AuthProvider");
	}
	return context;
}

export function parseJwt(token: string) {
	try {
		const base64Url = token.split('.')[1];
		const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
		const jsonPayload = decodeURIComponent(
			atob(base64)
				.split('')
				.map(c => '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2))
				.join('')
		);
		return JSON.parse(jsonPayload);
	} catch {
		return null;
	}
}
