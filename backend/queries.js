import { response } from 'express'
import { dbuser, dbadmin, dbmoder } from './db_roles.js'
import { get_current_server_port } from './monitoring.js'
import { log } from './server.js'

export async function checkLogin(userLogin) {
	try {
		const admin = dbadmin(5432)
		const result = await admin.query('SELECT check_available_login($1);', [userLogin])
		return result.rows[0].check_available_login
	} catch (err) {
		throw err
	}
}

export async function checkUser(userLogin, userPassword) {
	try {
		const admin = dbadmin(5432)
		const result = await admin.query('SELECT authentificate($1, $2);', [userLogin, userPassword])
		return result.rows[0].authentificate
	} catch (err) {
		throw err
	}
}

export async function createUser(userLogin, userPassword) {
	try {
		const admin = dbadmin(5432)
		const user = {
			user_name: userLogin,
			user_password: userPassword
		}
		const result = await admin.query('SELECT add_users($1::json);', [JSON.stringify(user)])
		return result.rows[0].add_users;
	} catch (err) {
		throw err
	}
}

export async function borrowBook(user_name, book_id, return_date) {
	try {
		const user = dbuser(5432)
		const result = await user.query('SELECT borrow_book($1, $2, $3);', [user_name, book_id, return_date])
		return result.rows;
	} catch (err) {
		throw err
	}
}

export async function returnBook(book_id) {
	try {
		const user = dbuser(5432)
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
		const result = await admin.query('select add_books($1::json);', [JSON.stringify(book)])
		console.log(result)
		return result.rows
	} catch (err) {
		throw err
	}
}

export async function deleteUser(user_name) {
	try {
		const admin = dbadmin(5432)
		const result = await admin.query('select delete_user($1);', [user_name])
		return result.rows
	} catch (err) {
		throw err
	}
}

export async function deleteBook(book_id) {
	try {
		const admin = dbadmin(5432)
		const result = await admin.query('select delete_book($1);', [book_id])
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

export async function editBook(book) {
	try {
		const admin = dbadmin(5432)
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

export async function extentLoan(book_id, new_date) {
	try {
		const moder = dbmoder(5432)
		const result = await moder.query(`exec extent_loan($1,$2);`, [book_id, new_date])
	} catch (error) {
		console.error(error)
		throw error
	}
}
