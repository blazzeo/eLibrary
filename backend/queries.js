import { dbuser, dbadmin, dbmoder } from './db_roles.js'
import { hashPassword } from './auth.js'
import bcrypt from 'bcrypt'

export async function checkLogin(userLogin) {
	try {
		const admin = dbadmin(5432)
		const result = await admin.query('SELECT check_available_login($1);', [userLogin])
		return result.rows[0].check_available_login
	} catch (err) {
		throw err
	}
}

export async function getUser(user_id) {
	try {
		const admin = dbadmin(5432)
		const result = await admin.query('SELECT get_user($1);', [user_id])
		let user = result.rows[0].get_user
		return user
	} catch (error) {
		throw error
	}
}

export async function login(userLogin, userPassword) {
	try {
		const db = dbadmin(5432);
		const res = await db.query(`
			SELECT user_id, user_password, user_role 
			FROM users
			WHERE user_name = $1
		`, [userLogin]);

		if (res.rowCount === 0) return false;

		const isPasswordValid = await bcrypt.compare(userPassword, res.rows[0].user_password);
		return isPasswordValid ? {
			id: res.rows[0].user_id,
			role: res.rows[0].user_role
		} : false;
	} catch (err) {
		throw err;
	}
}

export async function register(userLogin, userPassword, role) {
	try {
		const db = dbadmin(5432);
		const hashedPassword = await hashPassword(userPassword);

		const existingUser = await db.query(`SELECT * FROM users WHERE user_name = $1`, [userLogin]);
		if (existingUser.rowCount > 0)
			throw "User already exists"

		await db.query(`
			INSERT INTO users (user_name, user_password, user_role, registration_date)
			VALUES ($1, $2, $3, NOW())
		`, [userLogin, hashedPassword, role || "user"]);
	} catch (err) {
		throw err
	}
}

export async function createModer(login, password) {
	try {
		const admin = dbadmin(5432)
		const hashed_password = await hashPassword(password)
		console.log(login, password)
		const result = await admin.query('SELECT * from create_moder($1, $2);', [login, hashed_password])
		console.log(result.rows[0])

		return result.rows[0];
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

export async function getBooks(user_id) {
	try {
		const user = dbuser(5432)
		const res = await user.query('select * from get_books($1);', [user_id])

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

export async function deleteUser(user_id) {
	try {
		const admin = dbadmin(5432)
		const result = await admin.query('select delete_user($1);', [user_id])
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

export async function toggleWishlist(user_id, book_id) {
	try {
		const user = dbuser(5432)
		console.log('Connecting to database...')

		// Начинаем транзакцию
		await user.query('BEGIN');

		try {
			// Проверяем текущий статус wishlist
			console.log('Checking current wishlist status...')
			const wishlistResult = await user.query(
				'SELECT EXISTS(SELECT 1 FROM wishlist WHERE user_id = $1 AND book_id = $2)',
				[user_id, book_id]
			)
			console.log('Current wishlist status:', wishlistResult.rows[0].exists)

			// Переключаем wishlist
			console.log('Toggling wishlist...')
			await user.query('call toggle_wishlist($1,$2);', [user_id, book_id])
			console.log('Wishlist toggled')

			// Получаем обновленные данные пользователя
			console.log('Getting updated user data...')
			const userResult = await user.query('SELECT get_user($1);', [user_id])
			console.log('Raw user result:', userResult.rows)
			
			if (!userResult.rows || userResult.rows.length === 0) {
				throw new Error('Failed to get updated user data after toggle')
			}
			
			const userData = userResult.rows[0].get_user
			if (!userData) {
				throw new Error('get_user returned null or undefined')
			}
			
			console.log('Processed user data:', userData)

			// Фиксируем транзакцию
			await user.query('COMMIT');
			
			return userData
		} catch (err) {
			// В случае ошибки откатываем транзакцию
			await user.query('ROLLBACK');
			throw err;
		}
	} catch (err) {
		console.error('Error in toggleWishlist:', err)
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
