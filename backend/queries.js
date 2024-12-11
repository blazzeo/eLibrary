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

export async function borrowBook(user_name, book_id) {
  try {
    const user = dbuser(get_current_server_port())
    const result = await user.query('SELECT borrow_book($1, $2);', [user_name, book_id])
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

export async function getBooks(user_name) {
  try {
    console.log(user_name)
    const user = dbuser(get_current_server_port())
    const res = await user.query('select get_books($1);', [user_name])

    const books = res.rows.map(row => {
      // Extract the string
      const bookString = row.get_books;

      // Use regex to match the components
      const regex = /^\((\d+),"([^"]+)",(\d+|NULL),([\d.]+),(\d+|NULL),([\d-]+|NULL),(\d)\)$/;
      const match = regex.exec(bookString);

      if (match) {
        return {
          book_id: parseInt(match[1], 10),
          title: match[2],
          total_pages: match === 'NULL' ? null : parseInt(match[3], 10),
          rating: parseFloat(match[4]),
          isbn: match[5] === 'NULL' ? null : match[5],
          published_date: match[6] === 'NULL' ? null : new Date(match[6]),
          loan_status: parseInt(match[7], 10)
        };
      }
      return null; // In case of no match
    }).filter(Boolean); // Filter out any null results

    console.log(books.length); // This will log the parsed book objects

    return books;
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

