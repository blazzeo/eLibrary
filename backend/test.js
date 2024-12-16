import { error, log } from "console";
import { dbadmin } from './db_roles.js';
import { get_current_server_port } from './monitoring.js'

function random_rating() {
  return Math.floor(Math.random() * 6); // Generates a rating between 0 and 5
}

async function test_100k() {
  const admin = dbadmin(get_current_server_port());

  try {
    await admin.query('BEGIN;');

    const promises = [];

    for (let i = 0; i < 20000; i++) {
      const book = {
        title: `book${i}`,
        total_pages: i + 1,
        rating: random_rating(),
      };

      promises.push(admin.query('SELECT add_books($1::json);', [JSON.stringify(book)]));
    }

    const results = await Promise.all(promises);

    for (const result of results) {
      if (!result || result == 'false') {
        throw new Error(result);
      }
    }

    await admin.query('COMMIT;');
    log("SUCCESS");
  } catch (error) {
    await admin.query('ROLLBACK;');
    error("ERROR OCCURRED: " + error.message);
    log(err)
    process.exit(1);
  }
}

test_100k()
