import { dbuser, dbadmin, dbmoder } from '../db_roles.js'
import { hashPassword } from '../middleware/auth.js'
import bcrypt from 'bcrypt'

export async function checkLogin(userLogin) {
	try {
		const admin = dbadmin()
		const result = await admin.query('SELECT check_available_login($1);', [userLogin])
		return result.rows[0].check_available_login
	} catch (err) {
		throw err
	}
}

export async function getWishlist() {
	try {
		const admin = dbadmin()
		const loans = await admin.query('select * from get_wishlist();')

		return loans.rows
	} catch (err) {
		throw err
	}
}

export async function createUser(user_name, user_password, user_role) {
	try {
		const admin = dbadmin()
		const hashed_password = await hashPassword(user_password)
		const result = await admin.query('select create_user($1, $2, $3);', [user_name, hashed_password, user_role])
		return result.rows[0].create_user
	} catch (error) {
		throw error
	}
}

export async function getUser(user_id) {
	try {
		const admin = dbadmin()
		const result = await admin.query('SELECT get_user($1);', [user_id])
		let user = result.rows[0].get_user
		return user
	} catch (error) {
		throw error
	}
}

export async function login(userLogin, userPassword) {
	try {
		const db = dbadmin();
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
		const db = dbadmin();
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
		const admin = dbadmin()
		const hashed_password = await hashPassword(password)
		const result = await admin.query('SELECT * from create_moder($1, $2);', [login, hashed_password])
		return result.rows[0];
	} catch (err) {
		throw err
	}
}

export async function addLoan(user_name, book_id, return_date) {
	try {
		const user = dbmoder()
		const result = await user.query('SELECT borrow_book($1, $2, $3);', [user_name, book_id, return_date])
		return result.rows;
	} catch (err) {
		throw err
	}
}

export async function returnBook(book_id) {
	try {
		const user = dbmoder()
		const result = await user.query('select return_book($1);', [book_id])
		return result.rows;
	} catch (err) {
		throw err
	}
}

export async function getBooks(user_id) {
	try {
		const user = dbuser()
		const res = await user.query('select * from get_books($1);', [user_id])

		return res.rows;
	} catch (err) {
		throw err
	}
}

export async function addBook(book) {
	try {
		const admin = dbadmin();
		const normalizedBook = normalizeAuthors(book);
		const result = await admin.query('select add_full_book($1::json);', [JSON.stringify(normalizedBook)]);
		return result.rows;
	} catch (err) {
		throw err;
	}
}

export async function getGenres() {
	try {
		const admin = dbadmin()
		const res = await admin.query('select * from get_genres();', [])

		return res.rows;
	} catch (err) {
		throw err
	}
}

export async function deleteUser(user_id) {
	try {
		const admin = dbadmin()
		const result = await admin.query('select delete_user($1);', [user_id])
		return result.rows
	} catch (err) {
		throw err
	}
}

export async function deleteBook(book_id) {
	try {
		const admin = dbadmin()
		const result = await admin.query('select delete_book($1);', [book_id])
		return result.rows
	} catch (err) {
		console.log(err)
		throw err
	}
}

export async function getUsers() {
	try {
		const admin = dbadmin()
		const users = await admin.query('select * from get_users();')

		return users.rows
	} catch (err) {
		throw err
	}
}

export async function getLoans() {
	try {
		const admin = dbadmin()
		const loans = await admin.query('select * from get_loans();')

		return loans.rows
	} catch (err) {
		throw err
	}
}

function normalizeAuthors(book) {
	const parseAuthor = (fullName) => {
		const parts = fullName.trim().split(/\s+/).filter(part => part !== ''); // Убираем пустые строки от лишних пробелов

		let firstName = '';
		let middleName = '';
		let lastName = '';

		if (parts.length === 0) {
			// Если строка пустая
			return { first_name: '', middle_name: '', last_name: '' };
		} else if (parts.length === 1) {
			// "Имя"
			firstName = parts[0];
		} else if (parts.length === 2) {
			// "Имя Фамилия"
			firstName = parts[0];
			lastName = parts[1];
		} else {
			// "Имя Отчество Фамилия" или "Имя Отчество1 Отчество2 Фамилия"
			firstName = parts[0];
			lastName = parts[parts.length - 1];
			middleName = parts.slice(1, parts.length - 1).join(' '); // Все между первым и последним
		}

		return {
			first_name: firstName,
			middle_name: middleName, // Может быть пустой строкой, если нет отчества
			last_name: lastName
		};
	};

	// Проверяем, существует ли book.authors и является ли он массивом
	if (!book || !Array.isArray(book.authors)) {
		console.warn('Expected book.authors to be an array, but got:', book.authors);
		return book; // Возвращаем оригинальный объект, если authors не массив
	}

	return {
		...book,
		authors: book.authors.map(author => {
			// Если автор уже в правильном формате (объект с first_name)
			if (typeof author === 'object' && author !== null && typeof author.first_name === 'string') {
				return author;
			}
			// Если автор - строка, парсим её
			if (typeof author === 'string') {
				return parseAuthor(author);
			}
			// Если автор имеет неожиданный формат (например, число, null), возвращаем пустые значения
			console.warn('Unexpected author format:', author);
			return { first_name: '', middle_name: '', last_name: '' };
		})
	};
}

export async function editBook(book) {
	try {
		const admin = dbadmin()
		const normalizedBook = normalizeAuthors(book)
		// console.log(normalizedBook)
		const result = await admin.query('select edit_book($1::json);', [JSON.stringify(normalizedBook)])
		return result.rows
	} catch (err) {
		throw err
	}
}

export async function toggleWishlist(user_id, book_id) {
	try {
		const user = dbuser()

		await user.query('BEGIN');

		try {
			// Проверяем текущий статус wishlist
			console.log('Checking current wishlist status...')
			const wishlistResult = await user.query(
				'SELECT EXISTS(SELECT 1 FROM wishlist WHERE user_id = $1 AND book_id = $2)',
				[user_id, book_id]
			)

			await user.query('call toggle_wishlist($1,$2);', [user_id, book_id])

			const userResult = await user.query('SELECT get_user($1);', [user_id])

			if (!userResult.rows || userResult.rows.length === 0) {
				throw new Error('Failed to get updated user data after toggle')
			}

			const userData = userResult.rows[0].get_user
			if (!userData) {
				throw new Error('get_user returned null or undefined')
			}

			console.log('Processed user data:', userData)

			await user.query('COMMIT');

			return userData
		} catch (err) {
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
		const moder = dbmoder()
		const result = await moder.query(`call extent_loan($1,$2,$3);`, [user_name, book_id, new_date])
		return result
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function getModerBooks() {
	try {
		const moder = dbmoder()
		const result = await moder.query('select * from get_moder_books();')
		return result.rows
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function requestExtent(user_id, book_id, request_date) {
	try {
		const user = dbuser()
		const result = await user.query(`call request_extent_loan($1, $2, $3);`, [user_id, book_id, request_date])
		return result
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function confirmExtension(book_id, user_id, request_date) {
	try {
		const moder = dbmoder()
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
		const moder = dbmoder()
		const result = await moder.query(`select reject_extension($1, $2, $3);`, [book_id, user_id, request_date])
		console.log(result)
		return result;
	} catch (error) {
		console.error(error)
		throw error
	}
}

export async function getAuthors() {
	try {
		const user = dbuser();
		const result = await user.query('SELECT * FROM get_authors();');
		return result.rows;
	} catch (err) {
		throw err;
	}
}

export async function searchAuthors(searchTerm) {
	try {
		const user = dbuser();
		const result = await user.query('SELECT * FROM search_authors($1);', [searchTerm]);
		return result.rows;
	} catch (err) {
		throw err;
	}
}

export async function searchGenres(searchTerm) {
	try {
		const user = dbuser();
		const result = await user.query('SELECT * FROM search_genres($1);', [searchTerm]);
		return result.rows;
	} catch (err) {
		throw err;
	}
}
