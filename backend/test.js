import { dbadmin, dbmoder } from './db_roles.js';
import { getModerBooks } from './queries.js';

async function test_100k() {
	const admin = dbadmin(5432);
	const moder = dbmoder(5432);

	try {
		let result = await getModerBooks();

		console.dir(result, { depth: null, colors: true });
	} catch (error) {
		console.error(error)

		process.exit(1);
	}
}

test_100k()
