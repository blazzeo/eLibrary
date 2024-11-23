const { Pool } = require('pg')

const db_admin = (port) => {
  return new Pool({
  user: 'dbadmin',
  host: 'localhost',
  database: 'postgres',
  password: 'masteradmin',
  port: port,
  })
}

const db_user = (port) => {
  return new Pool({
    user: 'dbuser',
    host: 'localhost',
    database: 'postgres',
    password: 'masteruser',
    port: port,
  });
} 

module.exports = {
  db_user, db_admin
}
