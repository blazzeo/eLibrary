import express from 'express'
import cors from 'cors'
import * as db_request from './queries.js'
import { server_health } from './monitoring.js';

const PORT = 3000;
const app = express();

app.use(cors())
app.use(express.json())

app.get('/api/checklogin', async (req, res) => {
  try {
    console.log("checkLogin")
    const userLogin = req.query.login;
    const result = await db_request.checkLogin(userLogin);
    res.json({ result: result });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/checkuser', async (req, res) => {
  try {
    console.log("checkUser")
    const userLogin = req.query.login;
    const userPassword = req.query.password;
    const result = await db_request.checkUser(userLogin, userPassword);
    res.json({ result: result });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/createuser', async (req, res) => {
  try {
    console.log("createUser")
    const userLogin = req.query.login;
    const userPassword = req.query.password;
    const result = await db_request.createUser(userLogin, userPassword);
    res.json({ result: result });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/borrowbook', async (req, res) => {
  try {
    console.log("borrowBook")
    const user_id = req.query.user_id;
    const book_id = req.query.book_id;
    const result = await db_request.borrowBook(user_id, book_id);
    res.json({ result: result });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/returnbook', async (req, res) => {
  try {
    console.log("returnBook")
    const book_id = req.query.book_id;
    const result = await db_request.returnBook(book_id);
    res.json({ result: result });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/getbooks', async (req, res) => {
  try {
    console.log("getBooks")
    const user_id = req.query.user_id;
    const result = await db_request.getBooksTest(user_id);
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/addbook', async (req, res) => {
  try {
    console.log('addBook')
    const book = req.body
    const result = await db_request.addBook(book)
    res.json(result)
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
})

app.get('/api/deletebook', async (req, res) => {
  try {
    console.log('deleteBook')
    req.query.book_id
    const result = await db_request.deleteBook(book_id)
    res.json(result)
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
})

server_health();

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
