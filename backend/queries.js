import { dbuser, dbadmin } from './db_roles.js'
import { get_current_server_port } from './monitoring.js'

export async function checkLogin(userLogin) {
  try {
    const admin = dbadmin(get_current_server_port())
    const result = await admin.query('SELECT check_available_login($1);', [userLogin])
    console.log(result.rows)
    return result.rows
  } catch (err) {
    console.error(err)
  }
}

export async function checkUser(userLogin, userPassword) {
  try {
    const admin = dbadmin(get_current_server_port())
    const result = await admin.query('SELECT check_user($1, $2);', [userLogin, userPassword])
    console.log(result.rows)
    return result.rows
  } catch (err) {
    console.error(err)
  }
}

export async function createUser(userLogin, userPassword) {
  try {
    const admin = dbadmin(get_current_server_port())
    const user = {
      user_name: userLogin,
      user_password: userPassword
    }
    const result = await admin.query('SELECT add_users($1, $2);', [JSON.stringify(user)])
    console.log(result.rows)
    return result.rows;
  } catch (err) {
    console.error(err)
  }
}

export async function borrowBook(user_id, book_id) {
  try {
    const user = dbuser(get_current_server_port())
    const result = await user.query('SELECT borrow_book($1, $2);', [user_id, book_id])
    console.log(result.rows)
    return result.rows;
  } catch (err) {
    console.error(err)
  }
}

export async function returnBook(book_id) {
  try {
    const user = dbuser(get_current_server_port())
    const result = await user.query('SELECT return_book($1);', [book_id])
    console.log(result.rows)
    return result.rows;
  } catch (err) {
    console.error(err);
  }
}

export async function getBooksTest(user_id) {
  try {
    const user = dbuser(get_current_server_port())
    const books = await user.query('select get_books($1);', [user_id])
    console.log(books.rowCount);
    return books.rows;
  } catch (err) {
    console.error(err)
  }
}

export async function addBook(book) {
  try {
    const admin = dbadmin(get_current_server_port())
    console.log(`book: ${book}`)
    const result = await admin.query('select add_book($1::json);', [JSON.stringify(book)])
    console.log(`response: ${result.rows}`)
    return result.rows
  } catch (err) {
    console.error(err)
  }
}

export async function deleteBook(book_id) {
  try {
    const admin = dbadmin(get_current_server_port())
    console.log(`book_id: ${book_id}`)
    const result = await admin.query('select delete_book($1);', [book_id])
    console.log(`response: ${result.rows}`)
    return result.rows
  } catch (err) {
    console.error(err)
  }
}

