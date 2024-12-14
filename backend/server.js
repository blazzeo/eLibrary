import express from 'express'
import cors from 'cors'
import * as db_request from './queries.js'
import { server_health } from './monitoring.js';
import fs from 'fs'
import path from 'path'

const PORT = 3000;
const app = express();

const logFilePath = path.join(__dirname, 'log')
fs.rmSync(logFilePath)

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
    log('checkLogin success.')
  } catch (error) {
    res.status(500).json({ error: error.message });
    log(`checkLogin failed:\t${error.message}`)
  }
});

app.get('/api/checkuser', async (req, res) => {
  try {
    console.log("checkUser")
    const userLogin = req.query.login;
    const userPassword = req.query.password;
    const result = await db_request.checkUser(userLogin, userPassword);
    res.json({ result: result });
    log('checkUser success')
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
    log(`createUser success`)
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
    log(`borrowBook success`)
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
    log(`returnBook success`)
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
    log(`getBooks success`)
  } catch (error) {
    res.status(500).json({ error: error.message });
    log(`getBooks failed:\t${error.message}`)
  }
});

app.post('/api/addbook', async (req, res) => {
  try {
    const book = req.body
    const result = await db_request.addBook(book)
    res.json(result)
    log(`addBook success`)
  } catch (error) {
    res.status(500).json({ error: error.message });
    log(`addBook failed:\t${error.message}`)
  }
})

app.get('/api/deletebook', async (req, res) => {
  try {
    const book_id = req.query.book_id
    const result = await db_request.deleteBook(book_id)
    res.json(result)
    log(`deleteBook success`)
  } catch (error) {
    res.status(500).json({ error: error.message });
    log(`deleteBook failed:\t${error.message}`)
  }
})

app.get('/api/getusers', async (req, res) => {
  try {
    const result = await db_request.getUsers()
    res.json(result)
    log(`getUsers success`)
  } catch (error) {
    res.status(500).json({ error: error.message })
    log(`getUsers failed:\t${error.message}`)
  }
})

app.post('/api/deleteuser', async (req, res) => {
  try {
    const user_name = req.body.user_name;
    const result = await db_request.deleteUser(user_name)
    res.json(result)
    log(`deleteUser success`)
  } catch (error) {
    res.status(500).json({ error: error.message })
    log(`deleteUser failed:\t${error.message}`)
  }
})

app.get('/api/getloans', async (req, res) => {
  try {
    const result = await db_request.getLoans()
    res.json(result)
    log(`getLoans success`)
  } catch (error) {
    res.status(500).json({ error: error.message })
    log(`getLoans failed:\t${error.message}`)
  }
})

server_health();

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
