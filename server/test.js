import axios from 'axios';
import jwt from 'jsonwebtoken';

const API_URL = 'http://localhost:3000/api';
const credentials = {
	login: 'user2',
	password: 'qwer'
};

function getLoanStatusText(status) {
	switch (status) {
		case 0: return 'Взята мной';
		case 1: return 'В моем избранном';
		case 2: return 'Не в избранном';
		default: return 'Неизвестный статус';
	}
}

// Функция для паузы
const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms));

async function testAPI() {
	try {
		// 1. Логин
		console.log('1. Попытка входа в систему...');
		const loginResponse = await axios.post(`${API_URL}/login`, credentials);
		const token = loginResponse.data.token;
		console.log('Успешный вход, получен токен');

		// Декодируем токен для получения user_id
		const decoded = jwt.decode(token);
		const user_id = decoded.user_id;
		console.log('ID пользователя:', user_id);
		console.log('Данные из токена:', decoded);

		// Настройка headers для последующих запросов
		const config = {
			headers: { Authorization: `Bearer ${token}` }
		};

		// 2. Получение первой книги
		console.log('\n2. Получение информации о первой книге...');
		const booksResponse = await axios.get(`${API_URL}/books/${user_id}`, config);
		if (booksResponse.data && booksResponse.data.length > 0) {
			const firstBook = booksResponse.data[0];
			console.log('Информация о книге:');
			console.log('ID:', firstBook.book_id);
			console.log('Название:', firstBook.title);
			console.log('Статус:', getLoanStatusText(firstBook.loan_status));
			console.log('Полные данные книги:', firstBook);

			const wishlistData = {
				book_id: firstBook.book_id
			};

			// 3. Первое переключение wishlist
			console.log(`\n3. Первое переключение wishlist...`);
			console.log('Отправляем данные:', wishlistData);
			try {
				const toggleResponse1 = await axios.post(`${API_URL}/togglewishlist`, wishlistData, config);
				console.log('Ответ сервера:', toggleResponse1.data);
			} catch (error) {
				console.error('Ошибка при первом переключении:', error.response ? error.response.data : error.message);
			}

			// Проверяем изменение статуса
			const afterFirstToggle = await axios.get(`${API_URL}/books/${user_id}`, config);
			const bookAfterFirstToggle = afterFirstToggle.data.find(b => b.book_id === firstBook.book_id);
			console.log('Статус после первого переключения:', getLoanStatusText(bookAfterFirstToggle.loan_status));
			console.log('Полные данные книги после первого переключения:', bookAfterFirstToggle);

			// 4. Второе переключение wishlist
			console.log(`\n4. Второе переключение wishlist...`);
			console.log('Отправляем данные:', wishlistData);
			try {
				const toggleResponse2 = await axios.post(`${API_URL}/togglewishlist`, wishlistData, config);
				console.log('Ответ сервера:', toggleResponse2.data);
			} catch (error) {
				console.error('Ошибка при втором переключении:', error.response ? error.response.data : error.message);
			}

			// Проверяем изменение статуса
			const afterSecondToggle = await axios.get(`${API_URL}/books/${user_id}`, config);
			const bookAfterSecondToggle = afterSecondToggle.data.find(b => b.book_id === firstBook.book_id);
			console.log('Статус после второго переключения:', getLoanStatusText(bookAfterSecondToggle.loan_status));
			console.log('Полные данные книги после второго переключения:', bookAfterSecondToggle);

		} else {
			console.log('Нет доступных книг для тестирования');
		}

	} catch (error) {
		console.error('Ошибка:', error.response ? error.response.data : error.message);
		if (error.response) {
			console.error('Статус ошибки:', error.response.status);
			console.error('Заголовки ответа:', error.response.headers);
		}
	}
}

testAPI();
