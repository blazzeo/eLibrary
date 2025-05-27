import * as db_request from '../controllers/queries.js'
import express from 'express'
import { verifyToken, requireRole, generateToken } from '../middleware/auth.js'
import { log } from '../server.js'

const router = express.Router()

// admin
router.post('/books', verifyToken, requireRole(['admin']), async (req, res) => {
	try {
		const book = req.body.book
		const result = await db_request.addBook(book)

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

router.delete('/books/:book_id', verifyToken, requireRole(['admin']), async (req, res) => {
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

router.get('/users/:user_id', verifyToken, requireRole(['admin', 'user', 'moder']), async (req, res) => {
	try {
		const user_id = parseInt(req.params.user_id, 10)
		const result = await db_request.getUser(user_id)

		res.json(result)
		log('users/ get-method success')
	} catch (error) {
		res.status(500).statusMessage(error.message)
		log(`users/ get-method failed:\t${error.message}`)
	}
})

router.get('/loans', verifyToken, requireRole(['admin', 'moder']), async (_req, res) => {
	try {
		const result = await db_request.getLoans()
		res.json(result)
		log(`getLoans success:\tLoans:\t[${result}]`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`getLoans failed:\t${error.message}`)
	}
})

router.get('/wishlist', verifyToken, requireRole(['admin', 'moder']), async (_req, res) => {
	try {
		const result = await db_request.getWishlist()
		res.json(result)
		log(`getWishlist success:\tWishes:\t[${result}]`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`getWishlist failed:\t${error.message}`)
	}
})

router.get('/users', verifyToken, requireRole(['admin', 'moder']), async (_req, res) => {
	try {
		const result = await db_request.getUsers()
		res.json(result.map(u => u.get_users))
		log(`getUsers success`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`getUsers failed:\t${error.message}`)
	}
})

router.delete('/users/:user_id', verifyToken, requireRole(['admin']), async (req, res) => {
	try {
		const user_id = req.params.user_id
		const result = await db_request.deleteUser(user_id)

		res.json(result)
		log(`deleteUser success:\tUser:\t{${user_id}}`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`deleteUser failed:\t${error.message}`)
	}
})

router.post('/register', async (req, res) => {
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

router.put('/books', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
	try {
		const book = req.body.book
		const result = await db_request.editBook(book)


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

router.post('/createmoder', verifyToken, requireRole(['admin']), async (req, res) => {
	try {
		const login = req.body.login;
		const password = req.body.password;
		const userLogin = req.body.login;
		const result = await db_request.createModer(login, password);
		res.json({ result: result });
		log(`createmoder success:\tLogin:\t{${userLogin}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`createmoder failed:\t${error.message}`)
	}
});

router.get('/checklogin', async (req, res) => {
	try {
		const login = req.query.login;
		const result = await db_request.checkLogin(login);
		res.json({ result: result });
		log(`checkLogin success:\tLogin:\t{${login}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`checkLogin failed:\t${error.message}`)
	}
});

router.post('/users', verifyToken, requireRole(['admin']), async (req, res) => {
	try {
		const name = req.body.login;
		const password = req.body.password;
		const role = req.body.role;
		const result = await db_request.createUser(name, password, role);

		if (!result) {
			res.status(500).json({ error: 'Неожиданный формат ответа от базы данных' });
			log(`addUser failed: unexpected response format`);
			return;
		}

		const match = result.match(/\((.*?),(.*?)\)/);

		if (!match) {
			res.status(500).json({ error: 'Не удалось разобрать ответ от базы данных' });
			log(`addUser failed: cannot parse response ${responseStr}`);
			return;
		}

		const success = match[1].trim() === 't';
		const message = match[2].replace(/"/g, '');

		if (!success) {
			res.status(400).json({ error: message });
			log(`addUser failed: ${message}`);
			return;
		}

		res.json({ success: success, message: message });
		log(`addUser success: User: ${name}`);
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`addUser failed: ${error.message}`);
	}
})

// moder
router.post('/returnbook', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
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

router.put('/loans', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
	try {
		const user_name = req.body.user_name;
		const book_id = req.body.book_id;
		const new_date = req.body.new_date;
		const result = await db_request.extentLoan(user_name, book_id, new_date);
		res.json({ result: result });
		log(`extentLoan success:\tBook:\t{${user_name}, ${book_id}, ${new_date}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`extentLoan failed:\t${error.message}`)
	}
});

router.get('/moderbooks', verifyToken, requireRole(['admin', 'moder']), async (_req, res) => {
	try {
		const result = await db_request.getModerBooks()
		res.json({ result: result.map(b => b.book_info) })
	} catch (error) {
		res.status(500).json({ error: error })
		log(`moderBooks failed:\t${error.message}`)
	}
})

router.post('/loans', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
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

router.post('/confirmextension', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
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

router.post('/rejectextension', verifyToken, requireRole(['admin', 'moder']), async (req, res) => {
	try {
		const book_id = req.body.book_id
		const user_id = req.body.user_id
		const request_date = req.body.request_date
		const result = await db_request.rejectExtension(book_id, user_id, request_date)
		res.json({ result: result })
		log('reject exntension success')
	} catch (error) {
		res.status(500).json({ error: error })
		log('reject extension failed: ', error)
	}
})

// user
router.post('/togglewishlist', verifyToken, requireRole(['admin', 'moder', 'user']), async (req, res) => {
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
		res.status(500).json({ error: error.message });
		log(`toggleWishlist failed:\t${error.message}`);
	}
})

router.post('/login', async (req, res) => {
	try {
		console.log("LOGIN")
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


router.get('/books/:user_id', verifyToken, requireRole(['admin', 'moder', 'user']), async (req, res) => {
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

router.post('/askextension', verifyToken, requireRole(['admin', 'moder', 'user']), async (req, res) => {
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
router.get('/authors', verifyToken, requireRole(['admin', 'moder',]), async (_req, res) => {
	try {
		const result = await db_request.getAuthors();
		res.json(result);
		log('getAuthors success');
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`getAuthors failed: ${error.message}`);
	}
});

router.get('/authors/search', verifyToken, requireRole(['admin', 'moder', 'user']), async (req, res) => {
	try {
		const searchTerm = req.query.term;
		if (!searchTerm) {
			return res.status(400).json({ error: 'Search term is required' });
		}
		const result = await db_request.searchAuthors(searchTerm);
		res.json(result);
		log(`searchAuthors success: term=${searchTerm}`);
	} catch (error) {
		console.error('GET /authors/search error:', error);
		res.status(500).json({ error: error.message });
		log(`searchAuthors failed: ${error.message}`);
	}
});

// Genres endpoints
router.get('/genres/search', verifyToken, requireRole(['admin', 'moder', 'user']), async (req, res) => {
	try {
		const searchTerm = req.query.term;
		if (!searchTerm) {
			return res.status(400).json({ error: 'Search term is required' });
		}
		const result = await db_request.searchGenres(searchTerm);
		res.json(result);
		log(`searchGenres success: term=${searchTerm}`);
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`searchGenres failed: ${error.message}`);
	}
});

router.get('/genres', verifyToken, requireRole(['admin', 'moder']), async (_req, res) => {
	try {
		const result = await db_request.getGenres();
		res.json(result);
		log('getGenres success');
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`getGenres failed: ${error.message}`);
	}
});

router.get('/health', async (_req, res) => {
	res.status(200).end()
})

export default router
