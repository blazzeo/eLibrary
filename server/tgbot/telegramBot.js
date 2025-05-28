import TelegramBot from 'node-telegram-bot-api';

const token = process.env.TELEGRAM_BOT_TOKEN;

if (!token) {
	console.error('Telegram Bot Token is not set in environment variables.');
}

// polling для простоты, для прода лучше webhooks
export const bot = new TelegramBot(token, { polling: true });

// Карта для хранения Chat ID в памяти (для демонстрации).
// В реальном приложении это должно быть в базе данных!
const userChatIds = {};

// Обработка команды /start
bot.onText(/\/start/, (msg) => {
	const chatId = msg.chat.id;
	const userName = msg.from.first_name || msg.from.username || 'Пользователь';

	// Сохраняем Chat ID. В продакшене это должна быть БД
	userChatIds[msg.from.id] = chatId; // Используем msg.from.id как ключ, если нужно привязать к user_id из вашей БД

	bot.sendMessage(chatId, `Привет, ${userName}! Твой Telegram ID для уведомлений: \`${chatId}\`. Я сохраню его, чтобы отправлять тебе уведомления о появившихся книгах😉.`);

	// В реальном приложении: сохранить chatId в вашей базе данных, связанный с user_id.
	// Например, если у вас есть таблица users, добавить поле telegram_chat_id
	console.log(`Received /start from user ${userName} (ID: ${msg.from.id}, Chat ID: ${chatId})`);
});

// Добавляем функцию для отправки уведомлений
export async function sendBookReturnedNotification(chatId, bookTitle) {
	try {
		await bot.sendMessage(chatId, `Книга "${bookTitle}", которую вы забронировали, теперь доступна!`);
		console.log(`Notification sent to chat ID ${chatId} for book "${bookTitle}".`);
	} catch (error) {
		console.error(`Error sending notification to chat ID ${chatId}:`, error.message);
		// Обработка ошибок: например, если бот заблокирован пользователем
		if (error.response && error.response.statusCode === 403) {
			console.warn(`User ${chatId} blocked the bot.`);
			// В реальном приложении: пометить chatId как неактивный или удалить его из БД
		}
	}
}

// Запуск бота (если это отдельный файл, который запускается)
// bot.startPolling(); // Если используем polling
