import axios from 'axios';
import { useAuth } from './authContext';

const SERVER = import.meta.env.VITE_API_SERVER || "http://localhost:3000"; // пример

const axiosInstance = axios.create({
	baseURL: SERVER,
	headers: {
		'Content-Type': 'application/json'
	}
});

// Добавляем токен к каждому запросу
axiosInstance.interceptors.request.use(
	(config) => {
		const token = sessionStorage.getItem("token");
		if (token) {
			config.headers.Authorization = `Bearer ${token}`;
		}
		return config;
	},
	(error) => Promise.reject(error)
);

// Создаем обработчик ошибок
const createErrorHandler = (logout: () => void) => {
	return async (error: any) => {
		if (error.response?.status === 401 || error.response?.status === 403) {
			logout(); // Используем функцию logout из контекста
		}
		return Promise.reject(error);
	};
};

// Экспортируем функцию для установки обработчика ошибок
export const setupAxiosInterceptors = (logout: () => void) => {
	axiosInstance.interceptors.response.use(
		(response) => response,
		createErrorHandler(logout)
	);
};

export default axiosInstance;
