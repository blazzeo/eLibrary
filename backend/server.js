const express = require('express');
const app = express();
const PORT = 3000;
const { checkLogin, checkUser, createUser, returnBook, borrowBook } = require('./queries');
const { server_health } = require('./monitoring')

app.get('/api/check_login', async (req, res) => {
  const userLogin = req.query.login;
  const result = await checkLogin(userLogin);
  res.json({ result: result });
});

app.get('/api/check_user', async (req, res) => {
  const userLogin = req.query.login;
  const userPassword = req.query.password;
  const result = await checkUser(userLogin, userPassword);
  res.json({ result: result });
});

app.get('/api/create_user', async (req, res) => {
  const userLogin = req.query.login;
  const userPassword = req.query.password;
  const result = await createUser(userLogin, userPassword);
  res.json({ result: result });
});

app.get('/api/borrow_book', async (req, res) => {
  const userId = req.query.user_id;
  const bookId = req.query.book_id;
  const result = await borrowBook(userId, bookId);
  res.json({ result: result });
});

app.get('/api/return_book', async (req, res) => {
  const bookId = req.query.book_id;
  const result = await returnBook(bookId);
  res.json({ result: result });
});

server_health();

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
