// telegramBot.js
import TelegramBot from 'node-telegram-bot-api';
// Возможно, вам придется импортировать вашу функцию для работы с БД,
// если вы планируете сохранять chat_id прямо из бота.
// Но пока что мы будем полагаться на то, что пользователь вводит ID в веб-приложении.
// import * as db_request from './controllers/queries'; // Пример импорта

const token = process.env.TELEGRAM_BOT_TOKEN;

export function escapeMDV2(text) {
	// Символы, которые нужно экранировать для MarkdownV2
	const reservedChars = /[_*\[\]()~`>#+\-=|{}.!]/g;
	return text.replace(reservedChars, '\\$&');
}

if (!token) {
	console.error('Telegram Bot Token is not set in environment variables. Please set it to run the bot.');
	// В продакшене, возможно, стоит выйти из процесса или не инициализировать бота.
}

// Инициализация бота: polling для простоты разработки.
// Для продакшена рассмотрите webhooks.
export const bot = new TelegramBot(token, { polling: true });

console.log('Telegram Bot is running in polling mode...');

// --- Обработка команды /start ---
bot.onText(/\/start/, async (msg) => {
	const chatId = msg.chat.id;
	const userName = msg.from.first_name || msg.from.username || 'Пользователь';

	const welcomeMessage = escapeMDV2(`
Привет, ${userName}! 👋
Это бот нашей библиотеки\.

Для получения уведомлений о книгах и других событиях, тебе нужно привязать свой аккаунт в библиотеке к этому Telegram ID\.

*Твой уникальный Telegram Chat ID*:
\`${chatId}\`

Пожалуйста, скопируй этот ID и вставь его на *странице своего профиля* в веб-приложении библиотеки\.
После сохранения ты начнешь получать уведомления! 😉
    `);

	try {
		await bot.sendMessage(chatId, welcomeMessage, {
			parse_mode: 'MarkdownV2' // Для форматирования (жирный, курсив, моноширинный)
		});
		console.log(`Sent /start welcome to user ${userName} (Chat ID: ${chatId})`);
	} catch (error) {
		console.error(`Error sending /start message to chat ID ${chatId}:`, error.message);
	}
});

// --- Обработка других команд (пример) ---
bot.onText(/\/myid/, async (msg) => {
	const chatId = msg.chat.id;
	try {
		await bot.sendMessage(chatId, escapeMDV2(`Твой Telegram Chat ID: \`${chatId}\``), {
			parse_mode: 'MarkdownV2'
		});
		console.log(`Sent /myid to chat ID: ${chatId}`);
	} catch (error) {
		console.error(`Error sending /myid message to chat ID ${chatId}:`, error.message);
	}
});


export async function sendTelegramNotification(chatId, message, parseMode = 'Markdown') {
	if (!token) {
		console.warn(`[Telegram Bot]: Bot token is not set. Cannot send message to chat_id ${chatId}.`);
		return; // Не пытаемся отправить, если токена нет
	}
	if (!chatId) {
		console.warn(`[Telegram Bot]: Attempted to send notification without a valid chat ID. Message: "${message.substring(0, 50)}..."`);
		return;
	}

	try {
		await bot.sendMessage(chatId, message, { parse_mode: parseMode });
		console.log(`[Telegram Bot]: Message sent to chat ID ${chatId}.`);
	} catch (error) {
		console.error(`[Telegram Bot]: Error sending message to chat ID ${chatId}:`, error.message);
		// Дополнительная логика обработки ошибок Telegram API
		if (error.response && error.response.statusCode) {
			const statusCode = error.response.statusCode;
			const description = error.response.description || error.response.data?.description;

			if (statusCode === 403) { // 403 Forbidden - обычно означает, что бот заблокирован
				console.warn(`[Telegram Bot]: User ${chatId} blocked the bot or chat not found. Description: ${description}.`);
				// !!! ВАЖНО: Здесь вы можете добавить логику для удаления chat_id из вашей БД
				// Например, вызвать функцию: await db_request.toggleUserSubscription(user_id, null);
				// Для этого вам потребуется user_id, который можно получить по chat_id,
				// или передавать user_id в эту функцию.
			} else {
				console.error(`[Telegram Bot]: Telegram API Error ${statusCode}: ${description}`);
			}
		}
	}
}
