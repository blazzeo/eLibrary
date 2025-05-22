import axios from 'axios';

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

// Обработка 401 (Unauthorized)
axiosInstance.interceptors.response.use(
	(response) => response,
	(error) => {
		if (error.response?.status === 401) {
			sessionStorage.clear();
			window.location.href = "/login"; // редирект на логин
		}
		return Promise.reject(error);
	}
);

export default axiosInstance;
