const PORT = 3000;
const express = require('express');
const cors = require('cors')
const app = express();
const { checkLogin, checkUser, createUser, returnBook, borrowBook, getBooksTest } = require('./queries');
const { server_health } = require('./monitoring')

app.use(cors())

app.get('/api/check_login', async (req, res) => {
  console.log("checkLogin")
  const userLogin = req.query.login;
  const result = await checkLogin(userLogin);
  res.json({ result: result });
});

app.get('/api/check_user', async (req, res) => {
  console.log("checkUser")
  const userLogin = req.query.login;
  const userPassword = req.query.password;
  const result = await checkUser(userLogin, userPassword);
  res.json({ result: result });
});

app.get('/api/create_user', async (req, res) => {
  console.log("createUser")
  const userLogin = req.query.login;
  const userPassword = req.query.password;
  const result = await createUser(userLogin, userPassword);
  res.json({ result: result });
});

app.get('/api/borrow_book', async (req, res) => {
  console.log("borrowBook")
  const userId = req.query.user_id;
  const bookId = req.query.book_id;
  const result = await borrowBook(userId, bookId);
  res.json({ result: result });
});

app.get('/api/return_book', async (req, res) => {
  console.log("returnBook")
  const bookId = req.query.book_id;
  const result = await returnBook(bookId);
  res.json({ result: result });
});

app.get('/api/get_books', async (req, res) => {
  console.log("getBooks")
  try {
    const result = await getBooksTest();
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

server_health();

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
