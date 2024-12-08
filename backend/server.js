const PORT = 3000;
const express = require('express');
const cors = require('cors')
const app = express();
const db_request = require('./queries');
const { server_health } = require('./monitoring')

app.use(cors())

const server_port = server_health();

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
    const userId = req.query.user_id;
    const bookId = req.query.book_id;
    const result = await db_request.borrowBook(userId, bookId);
    res.json({ result: result });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/returnbook', async (req, res) => {
  try {
    console.log("returnBook")
    const bookId = req.query.book_id;
    const result = await db_request.returnBook(bookId);
    res.json({ result: result });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/getbooks', async (req, res) => {
  try {
    console.log("getBooks")
    const result = await db_request.getBooksTest();
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
