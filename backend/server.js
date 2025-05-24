import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import * as db_request from './queries.js'
import { fileURLToPath } from 'url';
import fs from 'fs'
import path from 'path'
import { generateToken, requireRole, verifyToken } from './auth.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config()

const PORT = 3000;
const app = express();
const JWT_SECRET = process.env.JWT_SECRET || 'island_club';

app.use(cors())
app.use(express.json())

const logFilePath = path.join(__dirname, 'log')
if (fs.existsSync(logFilePath))
	fs.rmSync(logFilePath);

export function log(message) {
	const timestamp = new Date().toISOString();
	const logEntry = `[${timestamp}]\t${message}\n`;

	fs.appendFile(logFilePath, logEntry, (err) => {
		if (err) {
			console.error('Error writing to log file', err);
		}
	});
}

// admin
app.post('/api/books', verifyToken, requireRole(['admin']), async (req, res) => {
	try {
		const book = req.body.book
		console.log('Adding book:', book)
		const result = await db_request.addBook(book)

		console.log('Server received result:', result)

		// Проверяем, что результат существует и имеет нужное поле
		if (!result || !result[0] || !result[0].add_full_book) {
			res.status(500).json({ error: 'Неожиданный формат ответа от базы данных' });
			log(`addBook failed: unexpected response format`);
			return;
		}

		// Парсим строку ответа, которая приходит в формате '(success,"message")'
		const responseStr = result[0].add_full_book;
		const match = responseStr.match(/\((.*?),(.*?)\)/);
		
		if (!match) {
			res.status(500).json({ error: 'Не удалось разобрать ответ от базы данных' });
			log(`addBook failed: cannot parse response ${responseStr}`);
			return;
		}

		const success = match[1].trim() === 't';
		const message = match[2].replace(/"/g, '');

		if (!success) {
			res.status(400).json({ error: message });
			log(`addBook failed: ${message}`);
			return;
		}

		res.json({ message: message });
		log(`addBook success: Book: ${JSON.stringify(book)}`);
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`addBook failed: ${error.message}`);
	}
})

app.delete('/api/books/:book_id', verifyToken, requireRole(['admin']), async (req, res) => {
	try {
		const book_id = parseInt(req.params.book_id, 10)
		const result = await db_request.deleteBook(book_id)

		res.json(result)
		log(`deleteBook success:\tBook:\t{${book_id}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`deleteBook failed:\t${error.message}`)
	}
})

app.get('/api/users/:user_id', verifyToken, requireRole(['admin', 'user', 'moder']), async (req, res) => {
	try {
		const user_id = parseInt(req.params.user_id, 10)
		const result = await db_request.getUser(user_id)

		res.json(result)
		log('/users/ get-method success')
	} catch (error) {
		res.status(500).statusMessage(error.message)
		log(`/users/ get-method failed:\t${error.message}`)
	}
})

app.get('/api/loans', verifyToken, requireRole(['admin', 'moder']), async (_req, res) => {
	try {
		const result = await db_request.getLoans()
		res.json(result)
		log(`getLoans success:\tLoans:\t[${result}]`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`getLoans failed:\t${error.message}`)
	}
})

app.get('/api/users', verifyToken, requireRole(['admin', 'moder']), async (_req, res) => {
	try {
		const result = await db_request.getUsers()
		res.json(result.map(u => u.get_users))
		log(`getUsers success`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`getUsers failed:\t${error.message}`)
	}
})

app.delete('/api/users/:user_id', verifyToken, requireRole(['admin']), async (req, res) => {
	try {
		const user_id = req.params.user_id
		console.log(user_id)
		const result = await db_request.deleteUser(user_id)

		res.json(result)
		log(`deleteUser success:\tUser:\t{${user_id}}`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`deleteUser failed:\t${error.message}`)
	}
})

app.post('/api/register', async (req, res) => {
	try {
		const { login, password, role } = req.body;
		if (!login || !password) return res.status(400).json({ error: "Missing fields" });

		await db_request.register(login, password, role)

		res.status(201).json({ message: "User registered successfully" });
	} catch (error) {
		console.error("Registration failed:", error);
		res.status(500).json({ error: "Server error" });
	}
});

app.put('/api/books', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
	try {
		const book = req.body.book
		console.log('Editing book:', book)
		const result = await db_request.editBook(book)
		
		console.log('Server received result:', result)

		// Проверяем, что результат существует и имеет нужное поле
		if (!result || !result[0] || !result[0].edit_book) {
			res.status(500).json({ error: 'Неожиданный формат ответа от базы данных' });
			log(`editBook failed: unexpected response format`);
			return;
		}

		// Парсим строку ответа, которая приходит в формате '(success,"message")'
		const responseStr = result[0].edit_book;
		const match = responseStr.match(/\((.*?),(.*?)\)/);
		
		if (!match) {
			res.status(500).json({ error: 'Не удалось разобрать ответ от базы данных' });
			log(`editBook failed: cannot parse response ${responseStr}`);
			return;
		}

		const success = match[1].trim() === 't';
		const message = match[2].replace(/"/g, '');

		if (!success) {
			res.status(400).json({ error: message });
			log(`editBook failed: ${message}`);
			return;
		}

		res.json({ message: message });
		log(`editBook success: Book: ${JSON.stringify(book)}`);
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`editBook failed: ${error.message}`);
	}
});

app.post('/api/createmoder', verifyToken, requireRole(['admin']), async (req, res) => {
	try {
		const login = req.body.login;
		const password = req.body.password;
		const userLogin = req.body.login;
		const result = await db_request.createModer(login, password);
		console.log(result)
		res.json({ result: result });
		log(`createmoder success:\tLogin:\t{${userLogin}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`createmoder failed:\t${error.message}`)
	}
});

app.get('/api/checklogin', async (req, res) => {
	try {
		const login = req.query.login;
		const result = await db_request.checkLogin(login);
		console.log(result)
		res.json({ result: result });
		log(`checkLogin success:\tLogin:\t{${login}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`checkLogin failed:\t${error.message}`)
	}
});

// moder
app.post('/api/returnbook', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
	try {
		const book_id = req.body.book_id;
		const result = await db_request.returnBook(book_id);
		res.json({ result: result });
		log(`returnBook success:\tBook:\t{${book_id}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`returnBook failed:\t${error.message}`)
	}
});

app.put('/api/loans', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
	try {
		const user_name = req.body.user_name;
		const book_id = req.body.book_id;
		const new_date = req.body.new_date;
		console.log(user_name, book_id, new_date)
		const result = await db_request.extentLoan(user_name, book_id, new_date);
		res.json({ result: result });
		log(`extentLoan success:\tBook:\t{${user_name}, ${book_id}, ${new_date}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`extentLoan failed:\t${error.message}`)
	}
});

app.get('/api/moderbooks', verifyToken, requireRole(['admin', 'moder']), async (_req, res) => {
	try {
		const result = await db_request.getModerBooks()
		res.json({ result: result.map(b => b.book_info) })
	} catch (error) {
		res.status(500).json({ error: error })
		log(`moderBooks failed:\t${error.message}`)
	}
})

app.post('/api/loans', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
	try {
		const user_name = req.body.user_name;
		const book_id = req.body.book_id;
		const return_date = new Date(req.body.return_date);
		const result = await db_request.addLoan(user_name, book_id, return_date);
		res.json({ result: result });
		log(`borrowBook success:\tBook:\t{${user_name}, ${book_id}, ${return_date}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`borrowBook failed: \t${error.message}`)
	}
});

app.post('/api/confirmextension', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
	try {
		const book_id = req.body.book_id
		const user_id = req.body.user_id
		const request_date = req.body.request_date
		const result = await db_request.confirmExtension(book_id, user_id, request_date)
		res.json({ result: result })
		log('confirm extension success', result)
	} catch (error) {
		res.status(500).json({ error: error })
		log('confirm extension failed: ', error)
	}
})

app.post('/api/rejectextension', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
	try {
		const book_id = req.body.book_id
		const user_id = req.body.user_id
		const request_date = req.body.request_date
		const result = await db_request.rejectExtension(book_id, user_id, request_date)
		res.json({ result: result })
		console.log('reject exntension success')
	} catch (error) {
		res.status(500).json({ error: error })
		console.log('reject extension failed: ', error)
	}
})

// user
app.post('/api/togglewishlist', verifyToken, requireRole(['admin', 'moder', 'user']), async (req, res) => {
	try {
		const book_id = req.body.book_id;
		const user_id = req.body.user_id;
		if (!user_id) {
			throw new Error('User ID cannot be NULL');
		}
		const userData = await db_request.toggleWishlist(user_id, book_id);
		res.json(userData);
		log(`toggleWishlist success:\tUser:\t{${user_id}}, Book:\t{${book_id}}`);
	} catch (error) {
		console.error('toggleWishlist error:', error);
		res.status(500).json({ error: error.message });
		log(`toggleWishlist failed:\t${error.message}`);
	}
})

app.post('/api/login', async (req, res) => {
	try {
		const { login, password } = req.body;

		const result = await db_request.login(login, password);
		if (!result) {
			return res.status(401).json({ error: "Invalid credentials" });
		}

		const token = generateToken({ user_id: result.id, user_name: login, role: result.role }, "1h")

		res.json({ token });
		log(`Auth success: \t${login}`);
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`Auth failed: \t${error.message}`);
	}
});


app.get('/api/books/:user_id', verifyToken, requireRole(['admin', 'moder', 'user']), async (req, res) => {
	try {
		const user_id = req.params.user_id
		const result = await db_request.getBooks(user_id);
		res.json(result);
		log(`getBooks success: \tBookCount: \t{ ${result.length}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`getBooks failed: \t${error.message}`)
	}
});

app.post('/api/askextension', verifyToken, requireRole(['admin', 'moder', 'user']), async (req, res) => {
	try {
		const user_name = req.body.user_name
		const book_id = req.body.book_id
		const request_date = req.body.request_date
		const result = await db_request.requestExtent(user_name, book_id, request_date)
		res.json(result)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`addWishlist failed: \t${error.message}`)
	}
})

// Authors endpoints
app.get('/api/authors', verifyToken, requireRole(['admin', 'moder',]), async (_req, res) => {
	try {
		console.log('GET /api/authors: Получение списка авторов');
		const result = await db_request.getAuthors();
		console.log('GET /api/authors: Получено авторов:', result.length);
		res.json(result);
		log('getAuthors success');
	} catch (error) {
		console.error('GET /api/authors error:', error);
		res.status(500).json({ error: error.message });
		log(`getAuthors failed: ${error.message}`);
	}
});

app.get('/api/authors/search', verifyToken, requireRole(['admin', 'moder', 'user']), async (req, res) => {
	try {
		const searchTerm = req.query.term;
		console.log('GET /api/authors/search: Поиск авторов по термину:', searchTerm);
		if (!searchTerm) {
			return res.status(400).json({ error: 'Search term is required' });
		}
		const result = await db_request.searchAuthors(searchTerm);
		console.log('GET /api/authors/search: Найдено авторов:', result.length);
		res.json(result);
		log(`searchAuthors success: term=${searchTerm}`);
	} catch (error) {
		console.error('GET /api/authors/search error:', error);
		res.status(500).json({ error: error.message });
		log(`searchAuthors failed: ${error.message}`);
	}
});

// Genres endpoints
app.get('/api/genres/search', verifyToken, requireRole(['admin', 'moder', 'user']), async (req, res) => {
	try {
		const searchTerm = req.query.term;
		console.log('GET /api/genres/search: Поиск жанров по термину:', searchTerm);
		if (!searchTerm) {
			return res.status(400).json({ error: 'Search term is required' });
		}
		const result = await db_request.searchGenres(searchTerm);
		console.log('GET /api/genres/search: Найдено жанров:', result.length);
		res.json(result);
		log(`searchGenres success: term=${searchTerm}`);
	} catch (error) {
		console.error('GET /api/genres/search error:', error);
		res.status(500).json({ error: error.message });
		log(`searchGenres failed: ${error.message}`);
	}
});

app.get('/api/genres', verifyToken, requireRole(['admin', 'moder']), async (_req, res) => {
	try {
		console.log('GET /api/genres: Получение списка жанров');
		const result = await db_request.getGenres();
		console.log('GET /api/genres: Получено жанров:', result.length);
		res.json(result);
		log('getGenres success');
	} catch (error) {
		console.error('GET /api/genres error:', error);
		res.status(500).json({ error: error.message });
		log(`getGenres failed: ${error.message}`);
	}
});

app.listen(PORT, () => {
	console.log('JWT_SECRET length:', JWT_SECRET.length);
	console.log('JWT_SECRET raw:', JSON.stringify(JWT_SECRET));
	console.log(`Server running at http://localhost:${PORT}`);
});
