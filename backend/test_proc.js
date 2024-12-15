const { dbadmin } = require('./db_roles');
const { get_current_server_port } = require('./monitoring');

async function callGetAllUsers() {
  try {
    const admin = dbadmin(get_current_server_port())
    const result = await admin.query('CALL get_all_users();');
    console.log('Процедура вызвана успешно');
  } catch (err) {
    console.error('Ошибка при вызове процедуры:', err);
  }
}

callGetAllUsers();
