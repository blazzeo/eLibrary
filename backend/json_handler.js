import fs from 'fs'
import { get_current_server_port } from './monitoring.js'
import { dbadmin } from './db_roles.js';

export function import_json(filePath, tableName) {
  const admin = dbadmin(get_current_server_port())

  fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
      console.error('Error reading the file:', err);
      return;
    }

    try {
      const jsonData = JSON.parse(data);
      console.log('Parsed JSON data:', jsonData);

      jsonData.forEach(obj => {
        admin.query(`select add_${tableName}($1::json);`, [JSON.stringify(obj)])
      });
    } catch (parseErr) {
      console.error('Error parsing JSON:', parseErr);
    }
  });
}

export async function export_json(filePath, tableName) {
  const admin = dbadmin(get_current_server_port());

  try {
    const tableContent = await admin.query(`SELECT * FROM ${tableName};`);

    fs.writeFile(filePath, JSON.stringify(tableContent.rows, null, 2), (err) => {
      if (err) {
        console.error('Error writing to file:', err);
      } else {
        console.log('File has been written successfully.');
      }
    });
  } catch (error) {
    console.error('Error querying the database:', error);
  }
}
