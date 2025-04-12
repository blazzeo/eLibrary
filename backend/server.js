import express from 'express'
import cors from 'cors'
import * as db_request from './queries.js'
import { server_health } from './monitoring.js';
import { fileURLToPath } from 'url';
import fs from 'fs'
import path from 'path'

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const PORT = 3000;
const app = express();

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

app.use(cors())
app.use(express.json())

app.get('/api/checklogin', async (req, res) => {
	try {
		const userLogin = req.query.login;
		const result = await db_request.checkLogin(userLogin);
		res.json({ result: result });
		log(`checkLogin success:\tLogin:\t{${userLogin}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`checkLogin failed:\t${error.message}`)
	}
});

app.get('/api/checkuser', async (req, res) => {
	try {
		const userLogin = req.query.login;
		const userPassword = req.query.password;
		const result = await db_request.checkUser(userLogin, userPassword);
		res.json({ result: result });
		log(`checkUser success:\tUser:\t{${userLogin}, ${userPassword}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`checkUser failed:\t${error.message}`)
	}
});

app.get('/api/createuser', async (req, res) => {
	try {
		const userLogin = req.query.login;
		const userPassword = req.query.password;
		const result = await db_request.createUser(userLogin, userPassword);
		res.json({ result: result });
		log(`createUser success:\tUser:\t{${userLogin}, ${userPassword}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`createUser failed:\t${error.message}`)
	}
});

app.post('/api/borrowbook', async (req, res) => {
	try {
		const borrow_data = req.body;
		const user_name = borrow_data.user_name;
		const book_id = borrow_data.book_id;
		const result = await db_request.borrowBook(user_name, book_id);
		res.json({ result: result });
		log(`borrowBook success:\tBook:\t{${user_name}, ${book_id}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`borrowBook failed:\t${error.message}`)
	}
});

app.post('/api/returnbook', async (req, res) => {
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

app.get('/api/getbooks', async (req, res) => {
	try {
		const user_name = req.query.username;
		const result = await db_request.getBooks(user_name);
		res.json(result);
		log(`getBooks success:\tBookCount:\t{${result.length}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`getBooks failed:\t${error.message}`)
	}
});

app.post('/api/addbook', async (req, res) => {
	try {
		const book = req.body.book
		const result = await db_request.addBook(book)
		res.json(result)
		log(`addBook success:\tBook:\t{${book}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`addBook failed:\t${error.message}`)
	}
})

app.post('/api/deletebook', async (req, res) => {
	try {
		const book_id = req.body.book_id
		const result = await db_request.deleteBook(Number(book_id))
		res.json(result)
		log(`deleteBook success:\tBook:\t{${book_id}}`)
	} catch (error) {
		res.status(500).json({ error: error.message });
		log(`deleteBook failed:\t${error.message}`)
	}
})

app.get('/api/getusers', async (req, res) => {
	try {
		const result = await db_request.getUsers()
		res.json(result)
		const printUser = (user) => {
			return `${user.user_id}, ${user.user_name}, ${user.user_password}, ${user.user_role}`
		}
		log(`getUsers success:\tUsers:\t[${result.map(user => `{${printUser(user)}}`)}]`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`getUsers failed:\t${error.message}`)
	}
})

app.post('/api/deleteuser', async (req, res) => {
	try {
		const user_name = req.body.user_name
		const result = await db_request.deleteUser(user_name)
		res.json(result)
		log(`deleteUser success:\tUser:\t{${user_name}}`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`deleteUser failed:\t${error.message}`)
	}
})

app.get('/api/getloans', async (req, res) => {
	try {
		const result = await db_request.getLoans()
		res.json(result)
		log(`getLoans success:\tLoans:\t[${result}]`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`getLoans failed:\t${error.message}`)
	}
})

app.post('/api/editbook', async (req, res) => {
	try {
		const book = req.body.book
		const result = await db_request.editBook(book)
		if (result[0].edit_book == false)
			throw new Error("Failed to edit book")
		res.json(result)
		log(`editBook success:\tBook:\t[${book}]`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`editBook failed:\t${error.message}`)
	}
})

app.post('/api/addwishlist', async (req, res) => {
	try {
		const user_name = req.body.user_name
		const book_id = req.body.book_id
		const result = await db_request.addWishlist(user_name, book_id)
		console.log(result)
		// if (result[0].edit_book == false)
		// 	throw new Error("Failed to edit book")
		res.json(result)
		log(`addWishlist success:\tBook:\t[]`)
	} catch (error) {
		res.status(500).json({ error: error.message })
		log(`addWishlist failed:\t${error.message}`)
	}
})

// server_health();

app.listen(PORT, () => {
	console.log(`Server running at http://localhost:${PORT}`);
});
