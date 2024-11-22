const { user, admin } = require('./db_roles');

async function checkLogin(userLogin) {
  try {
    const result = await admin.query('CALL check_available_login($1);', userLogin);
    console.log(result);
    return result;
  } catch(err) {
    console.error(err);
  }
}

async function checkUser(userLogin, userPassword) {
  try {
    const result = await admin.query('CALL check_user($1, $2);', userLogin, userPassword);
    console.log(result);
    return result;
  } catch(err) {
    console.error(err);
  }
}

async function createUser(userLogin, userPassword) {
  try {
    const result = await admin.query('CALL create_user($1, $2);', userLogin, userPassword)
    console.log(result)
    return result;
  } catch(err) {
    console.error(err)
  }
}

async function borrowBook(userId, bookId) {
  try {
    const result = await user.query('CALL borrow_book($1, $2);', userId, bookId)
    console.log(result)
    return result;
  } catch (err) {
    console.error(err)
  }
}

async function returnBook(bookId) {
  try {
    const result = await user.query('CALL return_book($1);', bookId)
    console.log(result)
    return result;
  } catch (err) {
    console.error(err);
  }
}

module.exports = { checkLogin, checkUser, createUser, borrowBook, returnBook };
