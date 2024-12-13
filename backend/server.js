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

app.post('/api/borrowbook', async (req, res) => {
  try {
    console.log("borrowBook")
    const borrow_data = req.body;
    const user_name = borrow_data.user_name;
    const book_id = borrow_data.book_id;
    const result = await db_request.borrowBook(user_name, book_id);
    res.json({ result: result });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/returnbook', async (req, res) => {
  try {
    console.log("returnBook")
    const book_id = req.body.book_id;
    const result = await db_request.returnBook(book_id);
    res.json({ result: result });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/getbooks', async (req, res) => {
  try {
    console.log("getBooks")
    const user_name = req.query.username;
    const result = await db_request.getBooks(user_name);
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
    const book_id = req.query.book_id
    const result = await db_request.deleteBook(book_id)
    res.json(result)
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
})

app.get('/api/getusers', async (req, res) => {
  try {
    console.log('getUsers')
    const result = await db_request.getUsers()
    res.json(result)
  } catch (error) {
    res.status(500).json({ error: error.message })

  }
})

app.post('/api/deleteuser', async (req, res) => {
  try {
    console.log('deleteUser')
    const user_name = req.body.user_name;
    const result = await db_request.deleteUser(user_name)
    res.json(result)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
})

app.get('/api/getloans', async (req, res) => {
  try {
    console.log('getLoans')
    const result = await db_request.getLoans()
    res.json(result)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
})

server_health();

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
