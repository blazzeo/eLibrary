import { dbuser, dbadmin, dbmoder } from './db_roles.js'
import { verify_password, hash_password } from './auth.js'

export async function checkLogin(userLogin) {
	try {
		const admin = dbadmin(5432)
		const result = await admin.query('SELECT check_available_login($1);', [userLogin])
		return result.rows[0].check_available_login
	} catch (err) {
		throw err
	}
}

export async function authenticate(userLogin, userPassword) {
	try {
		const admin = dbadmin(5432)
		const res = await admin.query(`
			SELECT user_password, user_role 
			from users
			where user_name = $1;`, [userLogin])

		if (res.rowCount == 0)
			throw "No such user found"
		const result = await verify_password(userPassword, res.rows[0].user_password)
		return result ? res.rows[0].user_role : result
	} catch (err) {
		throw err
	}
}

export async function createUser(userLogin, userPassword) {
	try {
		const admin = dbadmin(5432)
		const hashed_password = await hash_password(userPassword)
		const user = {
			user_name: userLogin,
			user_password: hashed_password
		}
		const result = await admin.query('SELECT add_users($1::json);', [JSON.stringify(user)])
		return result.rows[0].add_users;
	} catch (err) {
		throw err
	}
}

export async function addLoan(user_name, book_id, return_date) {
	try {
		const user = dbmoder(5432)
		console.log(user_name, book_id, return_date)
		const result = await user.query('SELECT borrow_book($1, $2, $3);', [user_name, book_id, return_date])
		return result.rows;
	} catch (err) {
		throw err
	}
}

export async function returnBook(book_id) {
	try {
		const user = dbmoder(5432)
		const result = await user.query('select return_book($1);', [book_id])
		return result.rows;
	} catch (err) {
		throw err
	}
}

export async function getBooks(user_name) {
	try {
		const user = dbuser(5432)
		const res = await user.query('select * from get_books($1);', [user_name])

		return res.rows;
	} catch (err) {
		throw err
	}
}

export async function addBook(book) {
	try {
		const admin = dbadmin(5432)
		const normalizedBook = normalizeAuthors(book)
		const result = await admin.query('select add_full_book($1::json);', [JSON.stringify(normalizedBook)])
		console.log(result)
		return result.rows
	} catch (err) {
		throw err
	}
}

export async function getGenres() {
	try {
		const admin = dbadmin(5432)
		const res = await admin.query('select * from get_genres();', [])

		return res.rows;
	} catch (err) {
		throw err
	}
}

export async function deleteUser(user_name) {
	try {
		const admin = dbadmin(5432)
		const result = await admin.query('select * delete_user($1);', [user_name])
		return result.rows
	} catch (err) {
		throw err
	}
}

export async function deleteBook(book_id) {
	try {
		const admin = dbadmin(5432)
		const result = await admin.query('select * from delete_book($1);', [book_id])
		return result.rows
	} catch (err) {
		console.log(err)
		throw err
	}
}

export async function getUsers() {
	try {
		const admin = dbadmin(5432)
		const users = await admin.query('select * from get_users();')

		return users.rows
	} catch (err) {
		throw err
	}
}

export async function getLoans() {
	try {
		const admin = dbadmin(5432)
		const loans = await admin.query('select * from get_loans();')

		return loans.rows
	} catch (err) {
		throw err
	}
}

function normalizeAuthors(book) {
	const parseAuthor = (fullName) => {
		const parts = fullName.trim().split(/\s+/); // разделить по пробелам

		return {
			first_name: parts[0] || '',
			middle_name: parts.length === 3 ? parts[1] : '',
			last_name: parts.length === 3 ? parts[2] : parts[1] || '',
		};
	};

	return {
		...book,
		authors: book.authors.map(parseAuthor),
	};
}

export async function editBook(book) {
	try {
		const admin = dbadmin(5432)
		const normalizedBook = normalizeAuthors(book)
		console.log(normalizedBook)
		const result = await admin.query('select edit_book($1::json);', [JSON.stringify(book)])
		return result.rows
	} catch (err) {
		throw err
	}
}

export async function toggleWishlist(user_name, book_id) {
	try {
		const user = dbuser(5432)
		const result = await user.query('call toggle_wishlist($1,$2);', [user_name, book_id])
		return result.rows
	} catch (err) {
		throw err
	}
}

export async function extentLoan(user_name, book_id, new_date) {
	try {
		const moder = dbmoder(5432)
		const result = await moder.query(`call extent_loan($1,$2,$3);`, [user_name, book_id, new_date])
		return result
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function getModerBooks() {
	try {
		const moder = dbmoder(5432)
		const result = await moder.query('select * from get_moder_books();')
		// console.dir(result, { depth: null, colors: true });
		return result.rows
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function requestExtent(user_name, book_id, request_date) {
	try {
		const user = dbuser(5432)
		console.log(user_name, book_id, request_date)
		const result = await user.query(`call request_extent_loan($1, $2, $3);`, [user_name, book_id, request_date])
		console.log(result)
		return result
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function confirmExtension(book_id, user_id, request_date) {
	try {
		const moder = dbmoder(5432)
		const result = await moder.query(`select confirm_extension($1, $2, $3);`, [book_id, user_id, request_date])
		console.log(result)
		return result;
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function rejectExtension(book_id, user_id, request_date) {
	try {
		const moder = dbmoder(5432)
		const result = await moder.query(`select reject_extension($1, $2, $3);`, [book_id, user_id, request_date])
		console.log(result)
		return result;
	} catch (error) {
		console.error(error)
		throw error
	}
}
