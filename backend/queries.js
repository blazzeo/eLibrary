const { dbuser, dbadmin } = require('./db_roles');

const user = dbuser(5432)
const admin = dbadmin(5432)

async function checkLogin(userLogin) {
  try {
    const result = await admin.query('SELECT check_available_login($1);', [userLogin]);
    console.log(result);
    return result.rows;
  } catch(err) {
    console.error(err);
  }
}

async function checkUser(userLogin, userPassword) {
  try {
    const result = await admin.query('SELECT check_user($1, $2);', [userLogin, userPassword]);
    console.log(result);
    return result.rows;
  } catch(err) {
    console.error(err);
  }
}

async function createUser(userLogin, userPassword) {
  try {
    const result = await admin.query('SELECT create_user($1, $2);', [userLogin, userPassword])
    console.log(result)
    return result.rows;
  } catch(err) {
    console.error(err)
  }
}

async function borrowBook(userId, bookId) {
  try {
    const result = await user.query('SELECT borrow_book($1, $2);', [userId, bookId])
    console.log(result)
    return result.rows;
  } catch (err) {
    console.error(err)
  }
}

async function returnBook(bookId) {
  try {
    const result = await user.query('SELECT return_book($1);', [bookId])
    console.log(result)
    return result.rows;
  } catch (err) {
    console.error(err);
  }
}

async function getBooksTest() {
  try {
    const books = await user.query('select * from books;')
    console.log(books.rowCount);
    return books.rows;
  } catch (err) {
    console.error(err)
  }
}

module.exports = { checkLogin, checkUser, createUser, borrowBook, returnBook, getBooksTest };
