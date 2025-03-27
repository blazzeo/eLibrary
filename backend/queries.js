import { response } from 'express'
import { dbuser, dbadmin } from './db_roles.js'
import { get_current_server_port } from './monitoring.js'

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

export async function borrowBook(user_name, book_id) {
	try {
		const user = dbuser(5432)
		const result = await user.query('SELECT borrow_book($1, $2);', [user_name, book_id])
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
		const user = dbadmin(5432)
		const res = await user.query('select get_books($1);', [user_name])

		const books = res.rows.map(row => {
			// Extract the string
			const bookString = row.get_books;

			// Use regex to match the components
			const regex = /^\((\d+),(.+),(\d+)?,([\d.]+)?,(.+)?,([\d-]+)?,(\d)\)$/;
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
			} else {
				console.log(bookString)
			}
			return null; // In case of no match
		}).filter(Boolean); // Filter out any null results

		return books;
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
		const users = await admin.query('select get_users();')

		const result = users.rows.map(row => {
			const user = row.get_users

			const regex = /^\((\d+),(.+),(.+),(.+)\)$/;
			const match = regex.exec(user);

			if (match) {
				return {
					user_id: parseInt(match[1], 10),
					user_name: match[2],
					user_password: match[3],
					user_role: match[4]
				};
			} else {
				console.log(user)
			}
			return null; // In case of no match
		}).filter(Boolean); // Filter out any null results

		return result
	} catch (err) {
		throw err
	}
}


export async function getLoans() {
	try {
		const admin = dbadmin(5432)
		const loans = await admin.query('select get_loans();')

		const result = loans.rows.map(row => {
			const loan = row.get_loans

			const regex = /^\((\d+),(.+),(\d+)\)$/;

			const match = regex.exec(loan);

			if (match) {
				return {
					user_id: parseInt(match[1], 10),
					user_name: match[2],
					book_id: parseInt(match[3], 10)
				};
			} else {
				console.log(loan)
			}
			return null; // In case of no match
		}).filter(Boolean); // Filter out any null results

		return result
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
