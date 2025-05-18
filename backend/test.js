import { dbadmin, dbmoder } from './db_roles.js';
import { confirmExtension } from './queries.js';
import { hash_password, verify_password } from './auth.js';

async function test_100k() {
	let moder = dbmoder(5432);
	let admin = dbadmin(5432);
	let client = await moder.connect();

	try {
		// let result = await verify_password('moder', '$2b$12$Up.etx3UiEX6/i92C7V9WOl57nkIYnDU5qapFWZ5p/Az4HRLVJ9Di')
		const result = await moder.query(`select confirm_extension(3, 3, '2025-07-05')`, []);
		console.log(result)
	} catch (error) {
		console.error(error)
		process.exit(1);
	} finally {
		client.release()
	}
}

test_100k()
